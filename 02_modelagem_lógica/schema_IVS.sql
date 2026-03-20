-- =============================================================================
-- schema_IVS.sql
-- Esquema completo do banco de dados — Atlas Social de Hortolândia
-- Versão: v05 — "20/03/2026"
-- Responsável: Ailton Vendramini
-- Repositório: Atlas-Social-de-Hortolândia / 02_modelagem_lógica
-- =============================================================================
-- v01 — "10/03/2026" — Criação
-- v02 — "10/03/2026" — Renomeação: fato_ivs_territorial → fato_ivs_loteamento
--                      Alinhamento com hierarquia Loteamento → Núcleo → RP
-- v03 — "11/03/2026" — FKs declaradas (id_loteamento, id_nucleo, id_rp)
--                      Campo unidade_medida adicionado
--                      Nota DIM_TEMPO adicionada (roadmap)
--                      Nota de revisão de pesos com comparabilidade temporal
--                      Periodicidade CadÚnico corrigida
-- v04 — "20/03/2026" — FATO_ABRANGENCIA_CRAS adicionada (cobertura temporal)
--                      DIM_TIPO_EVENTO adicionada (catálogo de eventos sociais)
--                      FATO_EVENTO_SOCIAL adicionada
--                      Esquema estrela atualizado para refletir novos módulos
-- v05 — "20/03/2026" — Consolidação final do dia
-- =============================================================================

-- =============================================================================
-- MOTIVAÇÃO
-- =============================================================================
--
-- As variáveis do IVS não são estáticas.
--
-- Exemplo concreto — Hortolândia, dimensão Infraestrutura Urbana:
--
--   Ano  | Cobertura água | Coleta esgoto | Esgoto tratado
--   -----+----------------+---------------+---------------
--   2014 | 99,9%          | 99,8%         | 82,0%
--   2015 | 100,0%         | 100,0%        | 82,5%
--   2016 | 100,0%         | 99,4%         | 96,9%
--   2017 | 100,0%         | 99,2%         | 96,3%
--   2018 | 100,0%         | 99,5%         | 96,3%
--   2019 | 100,0%         | 99,7%         | 96,4%
--   2020 | 100,0%         | 96,4%         | 89,7%
--
--   Fonte: SNIS / SABESP — Instituto Trata Brasil, 2022
--
-- Implicação arquitetural:
--   - IU_01 e IU_02 variam conforme novas obras são implantadas
--   - O mesmo vale para variáveis do CadÚnico (atualização contínua)
--     e do CAGED (mensal)
--   - A DIM_VARIAVEL_IVS define O QUE medir — não QUANDO nem QUANTO
--   - Os valores reais, por loteamento e por período, pertencem a
--     FATO_IVS_LOTEAMENTO
--
-- =============================================================================
-- HIERARQUIA ANALÍTICA DO PROJETO
-- =============================================================================
--
--   Município → Região de Planejamento → Núcleo → Loteamento
--
--   id_loteamento  = unidade mínima de análise (141 loteamentos oficiais)
--   id_nucleo      = agregação operacional por setor (Inclusão, Saúde, Educação...)
--   id_rp          = agregação por Região de Planejamento (6 RPs — Plano Diretor)
--
--   PRINCÍPIO: o loteamento é o átomo espacial — estável e imutável.
--   O núcleo é camada de agregação flexível — cada secretaria define os seus.
--   A cobertura do CRAS é operacional (limite de atendimento), não geográfica.
--
-- =============================================================================
-- ROADMAP — DIM_TEMPO
-- =============================================================================
--
-- No MVP, o período é registrado como texto (periodo_referencia TEXT).
-- Em evolução futura, recomenda-se substituir por uma dimensão de tempo:
--
--   CREATE TABLE dim_tempo (
--       id_tempo        INTEGER PRIMARY KEY,
--       ano             INTEGER NOT NULL,
--       semestre        INTEGER,   -- 1 | 2
--       mes             INTEGER,   -- 1-12
--       tipo_periodo    TEXT       -- 'Anual' | 'Semestral' | 'Mensal'
--   );
--
-- Benefícios:
--   - Facilita análise temporal e séries históricas
--   - Melhora desempenho analítico (filtros e agregações)
--   - Segue padrão de esquema estrela (Data Warehouse)
--
--   Essa evolução não requer migração destrutiva — basta adicionar a tabela
--   e um campo id_tempo como FK opcional em FATO_IVS_LOTEAMENTO.
--
-- =============================================================================
-- MÓDULO 1 — IVS-H
-- =============================================================================

CREATE TABLE IF NOT EXISTS fato_ivs_loteamento (

    id_fato             INTEGER PRIMARY KEY AUTOINCREMENT,
    id_variavel         TEXT    NOT NULL,   -- FK → dim_variavel_ivs
    id_loteamento       TEXT    NOT NULL,   -- FK → dim_loteamento
    id_nucleo           TEXT,               -- FK → dim_nucleo
    id_rp               TEXT,               -- FK → dim_regiao_planejamento

    periodo_referencia  TEXT    NOT NULL,   -- Ex: '2022' | '2025-S1' | '2025-12'
    data_extracao       TEXT    NOT NULL,   -- ISO 8601
    fonte_dado          TEXT    NOT NULL,   -- SNIS | CadUnico | Censo2022 | CAGED
    versao_fonte        TEXT,               -- Ex: 'SNIS_2022' | 'CadUnico_dez2025'

    valor_absoluto      REAL,
    valor_denominador   REAL,
    valor_percentual    REAL,
    unidade_medida      TEXT,               -- '%' | 'taxa por 1000' | 'anos'

    cobertura_cadastral REAL,               -- % da população coberta pela fonte
    flag_estimado       INTEGER DEFAULT 0,  -- 1 = estimado / interpolado
    flag_revisado       INTEGER DEFAULT 0,  -- 1 = revisado após publicação
    observacoes         TEXT,

    FOREIGN KEY (id_variavel)   REFERENCES dim_variavel_ivs(id_variavel),
    FOREIGN KEY (id_loteamento) REFERENCES dim_loteamento(id_loteamento),
    FOREIGN KEY (id_nucleo)     REFERENCES dim_nucleo(id_nucleo),
    FOREIGN KEY (id_rp)         REFERENCES dim_regiao_planejamento(id_rp),

    UNIQUE (id_variavel, id_loteamento, periodo_referencia, fonte_dado)
);

CREATE INDEX IF NOT EXISTS idx_fato_variavel
    ON fato_ivs_loteamento (id_variavel);
CREATE INDEX IF NOT EXISTS idx_fato_loteamento
    ON fato_ivs_loteamento (id_loteamento);
CREATE INDEX IF NOT EXISTS idx_fato_periodo
    ON fato_ivs_loteamento (periodo_referencia);
CREATE INDEX IF NOT EXISTS idx_fato_fonte
    ON fato_ivs_loteamento (fonte_dado);

-- =============================================================================
-- MÓDULO 2 — COBERTURA CRAS (relação temporal loteamento × CRAS)
-- =============================================================================
--
-- A cobertura do CRAS é definida por limite operacional de atendimento,
-- não por fronteira geográfica fixa. Um loteamento pode mudar de CRAS
-- quando uma nova unidade for implantada. Esse histórico deve ser preservado.
--
-- Implicação para indicadores: o cálculo de cobertura por loteamento deve
-- referenciar a abrangência VIGENTE na data do atendimento, nunca a atual.
--

CREATE TABLE IF NOT EXISTS fato_abrangencia_cras (

    id_abrangencia      INTEGER PRIMARY KEY AUTOINCREMENT,
    id_loteamento       TEXT    NOT NULL,   -- FK → dim_loteamento
    id_cras             TEXT    NOT NULL,   -- FK → dim_unidades_atendimento
    data_inicio         TEXT    NOT NULL,   -- ISO 8601
    data_fim            TEXT,               -- NULL = vigente
    ativo               INTEGER DEFAULT 1,  -- 1 = vigente
    fonte_delimitacao   TEXT,               -- 'CRAS_cobertura' | 'Manual' | ...
    observacoes         TEXT,

    FOREIGN KEY (id_loteamento) REFERENCES dim_loteamento(id_loteamento),

    UNIQUE (id_loteamento, id_cras, data_inicio)
);

CREATE INDEX IF NOT EXISTS idx_abrangencia_loteamento
    ON fato_abrangencia_cras (id_loteamento);
CREATE INDEX IF NOT EXISTS idx_abrangencia_cras
    ON fato_abrangencia_cras (id_cras);
CREATE INDEX IF NOT EXISTS idx_abrangencia_ativo
    ON fato_abrangencia_cras (ativo);

-- =============================================================================
-- MÓDULO 3 — EVENTOS SOCIAIS
-- =============================================================================
--
-- Registra ocorrências observáveis no município — crimes, premiações,
-- programas, eventos de saúde — complementando a leitura estrutural do IVS-H
-- com pressão social dinâmica por loteamento.
--
-- O IVS-H mede privação estrutural acumulada.
-- FATO_EVENTO_SOCIAL mede pressão emergente e dinâmica.
-- Os dois instrumentos são complementares — não concorrentes.
--
-- Combinação analítica central:
--   IVS-H baixo + eventos negativos frequentes = alerta (mudança não capturada)
--   IVS-H alto  + eventos negativos frequentes = emergência — prioridade máxima
--   IVS-H alto  + eventos positivos            = política funcionando em contexto adverso
--

CREATE TABLE IF NOT EXISTS dim_tipo_evento (

    id_tipo_evento      TEXT    PRIMARY KEY,
                                -- padrão: EVT_{CATEGORIA}_{SUBCATEGORIA}
                                -- ex: EVT_SEG_PATRIMONIAL_FURTO_VEICULO
    categoria           TEXT    NOT NULL,
                                -- Segurança Pública | Educação | Saúde |
                                -- Segurança Alimentar | Habitação | Trabalho | Outro
    subcategoria        TEXT    NOT NULL,
                                -- ex: Crime Patrimonial | Tráfico |
                                --     Desempenho Escolar | Transferência de Alimentos
    nome_tipo           TEXT    NOT NULL,
    polaridade          TEXT    NOT NULL
                                CHECK (polaridade IN ('Positiva','Negativa','Neutra')),
                                -- Positiva = melhoria, proteção ou avanço
                                -- Negativa = risco, vulnerabilidade ou problema
                                -- Neutra   = informativo, sem impacto claro
    dimensao_ivsh       TEXT,   -- IU | CH | RT | Transversal | Nenhuma
    escala_registro     TEXT    NOT NULL
                                CHECK (escala_registro IN
                                    ('Loteamento','Nucleo','RP','Municipio')),
    fonte_esperada      TEXT,
    gravidade_padrao    TEXT    CHECK (gravidade_padrao IN ('Baixa','Media','Alta')),
    ativo               INTEGER DEFAULT 1,
    observacoes         TEXT
);

-- Carga inicial — casos reais do município (Tribuna Liberal 20/03/2026)
INSERT OR IGNORE INTO dim_tipo_evento VALUES
    ('EVT_SEG_PATRIMONIAL_FURTO_VEICULO',
     'Segurança Pública','Crime Patrimonial','Furto de Veículo',
     'Negativa','RT','Loteamento','Boletim Oficial','Alta',1,NULL),
    ('EVT_SEG_TRAFICO_APREENSAO',
     'Segurança Pública','Tráfico','Apreensão de Entorpecentes',
     'Negativa','RT','Loteamento','Boletim Oficial','Alta',1,NULL),
    ('EVT_SEG_PATRIMONIAL_ROUBO',
     'Segurança Pública','Crime Patrimonial','Roubo a Pessoa',
     'Negativa','RT','Loteamento','Boletim Oficial','Alta',1,NULL),
    ('EVT_EDU_DESEMPENHO_PREMIACAO',
     'Educação','Desempenho Escolar','Premiação Estadual de Alfabetização',
     'Positiva','CH','Loteamento','Secretaria Municipal','Alta',1,NULL),
    ('EVT_EDU_DESEMPENHO_EVASAO',
     'Educação','Desempenho Escolar','Evasão Escolar',
     'Negativa','CH','Loteamento','Sistema Municipal','Alta',1,NULL),
    ('EVT_ALI_TRANSFERENCIA_PAA',
     'Segurança Alimentar','Transferência de Alimentos','Distribuição PAA',
     'Positiva','RT','Municipio','Imprensa','Media',1,
     'Município elegível via CADInsans — derivado do CadÚnico'),
    ('EVT_ALI_INSEGURANCA_GRAVE',
     'Segurança Alimentar','Insegurança Alimentar','Insegurança Alimentar Grave (CADInsans)',
     'Negativa','RT','Municipio','MDS','Alta',1,NULL),
    ('EVT_SAU_MATERNO_INFANTIL',
     'Saúde','Materno-Infantil','Gravidez na Adolescência',
     'Negativa','CH','Loteamento','Saúde','Alta',1,NULL),
    ('EVT_HAB_IRREGULAR',
     'Habitação','Irregularidade','Ocupação Irregular',
     'Negativa','IU','Loteamento','Secretaria Municipal','Media',1,NULL),
    ('EVT_TRA_EMPREGO_FORMAL',
     'Trabalho','Empregabilidade','Inserção em Emprego Formal',
     'Positiva','RT','Loteamento','CAGED','Media',1,NULL);

CREATE TABLE IF NOT EXISTS fato_evento_social (

    id_evento           INTEGER PRIMARY KEY AUTOINCREMENT,
                                -- padrão textual de referência: EVS_{ANO}{MES}_{SEQ}
    id_tipo_evento      TEXT    NOT NULL,   -- FK → dim_tipo_evento

    -- Localização — apenas um campo preenchido por registro
    id_loteamento       TEXT,               -- FK → dim_loteamento (escala Loteamento)
    id_nucleo           TEXT,               -- FK → dim_nucleo     (escala Núcleo)
    id_rp               TEXT,               -- FK → dim_regiao_planejamento (escala RP)
    id_municipio        TEXT DEFAULT '3519071',  -- fixo quando escala = Município

    -- Temporalidade
    data_evento         TEXT    NOT NULL,   -- data da ocorrência ou da fonte
    data_referencia     TEXT,               -- período ao qual o dado se refere
                                            -- pode diferir de data_evento

    -- Valor
    valor_referencia    REAL,               -- ex: 28 | 5 | 70
    unidade_medida      TEXT,               -- Ocorrências | Famílias | Escolas | ...

    -- Intensidade e qualidade
    gravidade           TEXT    CHECK (gravidade IN ('Baixa','Media','Alta')),
    confianca_fonte     TEXT    CHECK (confianca_fonte IN ('Alta','Media','Baixa')),
    fonte_registro      TEXT,               -- Boletim Oficial | Imprensa |
                                            -- Secretaria Municipal | Sistema Municipal |
                                            -- Observação de Campo | Outro
    referencia_fonte    TEXT,               -- URL, número do BO, nome do relatório

    -- Controle
    data_registro       TEXT    DEFAULT (date('now')),
    usuario_registro    TEXT,
    ativo               INTEGER DEFAULT 1,
    observacoes         TEXT,

    FOREIGN KEY (id_tipo_evento)  REFERENCES dim_tipo_evento(id_tipo_evento),
    FOREIGN KEY (id_loteamento)   REFERENCES dim_loteamento(id_loteamento),
    FOREIGN KEY (id_nucleo)       REFERENCES dim_nucleo(id_nucleo),
    FOREIGN KEY (id_rp)           REFERENCES dim_regiao_planejamento(id_rp)
);

CREATE INDEX IF NOT EXISTS idx_evento_tipo
    ON fato_evento_social (id_tipo_evento);
CREATE INDEX IF NOT EXISTS idx_evento_loteamento
    ON fato_evento_social (id_loteamento);
CREATE INDEX IF NOT EXISTS idx_evento_data
    ON fato_evento_social (data_evento);

-- Exemplos reais — Tribuna Liberal 20/03/2026
INSERT OR IGNORE INTO fato_evento_social (
    id_tipo_evento, id_loteamento,
    data_evento, data_referencia,
    valor_referencia, unidade_medida,
    gravidade, confianca_fonte, fonte_registro, referencia_fonte
) VALUES
    ('EVT_SEG_PATRIMONIAL_FURTO_VEICULO', 'LOT_071',
     '2026-03-20', '2026-01/2026-03',
     28, 'Ocorrências',
     'Alta', 'Media', 'Imprensa',
     'Tribuna Liberal 20/03/2026 p.09 — dados do 1o Distrito Policial'),
    ('EVT_SEG_TRAFICO_APREENSAO', 'LOT_068',
     '2026-03-19', '2026-03-19',
     121, 'Ocorrências',
     'Alta', 'Alta', 'Boletim Oficial',
     'Tribuna Liberal 20/03/2026 p.09 — operação DISE Americana'),
    ('EVT_EDU_DESEMPENHO_PREMIACAO', NULL,
     '2026-03-20', '2025',
     5, 'Escolas',
     'Alta', 'Alta', 'Secretaria Municipal',
     'Tribuna Liberal 20/03/2026 p.07 — Prêmio Excelência Educacional. id_loteamento a mapear por endereço de cada EMEF.'),
    ('EVT_ALI_TRANSFERENCIA_PAA', NULL,
     '2026-03-20', '2026-S1',
     70, 'Famílias',
     'Media', 'Alta', 'Imprensa',
     'Tribuna Liberal 20/03/2026 p.04 — CATI Regional Campinas. Referência regional. Hortolândia elegível via CADInsans.');

-- =============================================================================
-- TABELA DE FONTES — DIM_FONTE_DADO
-- =============================================================================

CREATE TABLE IF NOT EXISTS dim_fonte_dado (

    id_fonte            TEXT    PRIMARY KEY,
    nome_fonte          TEXT    NOT NULL,
    orgao_responsavel   TEXT,
    periodicidade       TEXT,
    url_acesso          TEXT,
    data_ultima_carga   TEXT,
    observacoes         TEXT
);

INSERT OR IGNORE INTO dim_fonte_dado VALUES
    ('SNIS_2022',
     'Sistema Nacional de Informações sobre Saneamento',
     'Ministério das Cidades','Anual',
     'https://app4.mdr.gov.br/serieHistorica/','2026-03-10',
     'Indicadores de água e esgoto por município. IU_01 e IU_02.'),
    ('CADUNICO_DEZ2025',
     'Cadastro Único para Programas Sociais',
     'Ministério do Desenvolvimento e Assistência Social',
     'Mensal (extrações administrativas)',
     NULL,'2026-03-10',
     'Fonte principal de CH e RT. 72.424 pessoas em Hortolândia (dez/2025). '
     'Renda autodeclarada — sem comprovação. Triangulação futura via CAGED/CNIS.'),
    ('CENSO2022_SETOR',
     'Censo Demográfico 2022 — Agregados por Setores Censitários',
     'IBGE','Decenal',
     'https://ftp.ibge.gov.br/Censos/Censo_Demografico_2022/','2026-03-10',
     'Microdados ainda não liberados. Dados agregados disponíveis.'),
    ('CAGED_MENSAL',
     'Cadastro Geral de Empregados e Desempregados',
     'Ministério do Trabalho','Mensal',
     'https://www.gov.br/trabalho-e-emprego/pt-br/assuntos/estatisticas-trabalho/caged',
     '2026-03-10',
     'Vínculo formal. RT_02 e RT_03. Requer convênio MTE. '
     'Trabalhadores informais não aparecem nessa base.'),
    ('SABESP_SNIS',
     'SABESP — indicadores SNIS Hortolândia',
     'SABESP / Instituto Trata Brasil','Anual',
     'https://tratabrasil.org.br','2026-03-10',
     'Água 100% (2015-2020), esgoto 96,4% (2020), tratamento 89,7% (2020).');

-- =============================================================================
-- NOTA SOBRE DINAMISMO DO IVS-H
-- =============================================================================
--
-- PRINCÍPIO ARQUITETURAL:
--
--   Os pesos do IVS-H (campo peso_h em dim_variavel_ivs) devem ser
--   revisados periodicamente conforme:
--
--   1. Novas obras de infraestrutura (IU_01, IU_02):
--      Se cobertura de esgoto cair abaixo de 90% em algum loteamento,
--      IU_01 readquire poder discriminatório. Monitorar via SNIS (anual).
--
--   2. Atualização do CadÚnico (variáveis CH e RT):
--      Recomendado: recalcular IVS-H a cada extração semestral.
--
--   3. Novos dados do Censo IBGE:
--      Próximo Censo: ~2032. Até lá, Censo 2022 é referência estática para IU.
--
--   PRINCÍPIO DE COMPARABILIDADE TEMPORAL:
--   Alterações de peso afetam toda a série histórica — devem ser justificadas,
--   documentadas e versionadas. Não revisar sem evidência empírica suficiente.
--   Referência: NARDO, M. et al. Handbook on Constructing Composite
--   Indicators. Paris: OECD, 2008.
--
-- =============================================================================
-- ESQUEMA ESTRELA COMPLETO — VISÃO GERAL
-- =============================================================================
--
--   DIMENSÕES FIXAS
--   DIM_VARIAVEL_IVS          — 16 variáveis, pesos, dimensões IU/CH/RT
--   DIM_LOTEAMENTO            — 141 loteamentos (átomo espacial — imutável)
--   DIM_NUCLEO                — Agregação por setor (Inclusão, Saúde, Educação...)
--   DIM_REGIAO_PLANEJAMENTO   — 6 RPs (Plano Diretor 2017-2020)
--   DIM_FONTE_DADO            — Rastreabilidade de origem e versão
--   DIM_TIPO_EVENTO           — Catálogo de tipos de eventos sociais
--
--   TABELAS FATO
--   FATO_IVS_LOTEAMENTO       — Valores IVS-H por variável, loteamento e período
--   FATO_ABRANGENCIA_CRAS     — Cobertura temporal loteamento × CRAS
--   FATO_EVENTO_SOCIAL        — Ocorrências sociais por loteamento e data
--
--   Evolução futura:
--   DIM_TEMPO                 — Dimensão temporal para séries históricas
--   FATO_ATENDIMENTO          — Atendimentos individuais por família e CRAS
--   FATO_IVS_MUNICIPIO        — IVS-H agregado municipal para comparação IPEA
--
-- =============================================================================
-- FIM DO SCHEMA
-- =============================================================================
