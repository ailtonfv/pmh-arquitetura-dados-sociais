-- =============================================================================
-- nota_tecnica_fato_ivs_loteamento_v05.sql
-- Nota técnica: modelagem da tabela de fatos do IVS-H por loteamento
-- Versão: v05 — "23/03/2026"
-- Responsável: Ailton Vendramini
-- Repositório: Atlas-Social-de-Hortolândia / 02_modelagem_lógica
-- =============================================================================
-- v01 — "10/03/2026" — Criação
-- v02 — "10/03/2026" — Renomeação: fato_ivs_territorial → fato_ivs_loteamento
-- v03 — "10/03/2026" — dim_fonte_dado criada; carga inicial de fontes
-- v04 — "18/03/2026" — FK fonte_dado; convenção periodo_referencia;
--                      valor_percentual (0-100); flag_oficial;
--                      fato_ivs_loteamento → fato_variavel_ivs_loteamento;
--                      fato_ivs_loteamento reservada para índice final;
--                      RT_06 e RT_07 incluídos na carga de dim_fonte_dado
-- v05 — "23/03/2026" — CORREÇÃO: RT_06 e RT_07 removidos do IVS-H.
--                      Pertencem ao IPST-H (Pressão Territorial PT_05/PT_06).
--                      SIDRA_CENSO2022 mantido como fonte — relevante para
--                      IU_03 (deslocamento como parte do IVS IPEA).
--                      Próximos passos atualizados.
--                      Nota de implementação progressiva adicionada.
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
--   IU_01 e IU_02 variam conforme obras são implantadas.
--   O mesmo vale para variáveis CadÚnico (contínua) e CAGED (mensal).
--   A DIM_VARIAVEL_IVS define O QUE medir — não QUANDO nem QUANTO.
--   Os valores reais, por loteamento e período, pertencem a
--   FATO_VARIAVEL_IVS_LOTEAMENTO.
--
-- =============================================================================
-- DECISÃO METODOLÓGICA CENTRAL — IVS-H vs IPST-H
-- =============================================================================
--
--   O IVS-H preserva exatamente as 16 variáveis do IVS/IPEA.
--   Sua implementação é progressiva por fases:
--
--   Fase 1 (MVP): 5 variáveis CadÚnico — ponderação original do IVS/IPEA.
--   Fase 2: incorporação de IBGE, SIDRA, CAGED, Saúde, Educação.
--   Fase 3: eventual calibração local de pesos (peso_h).
--
--   Variáveis de deslocamento (RT_06/RT_07) pertencem ao IPST-H,
--   não ao IVS-H. Referência: dim_variavel_IVS_v01r8.md
--
-- =============================================================================
-- HIERARQUIA ANALÍTICA DO PROJETO
-- =============================================================================
--
--   Loteamento → Núcleo (área de abrangência CRAS) → Região de Planejamento
--
--   id_loteamento  = unidade mínima de análise (141 loteamentos oficiais)
--   id_nucleo      = agregação por CRAS (7 núcleos)
--   id_rp          = agregação por Região de Planejamento (6 RPs)
--
-- =============================================================================
-- SEPARAÇÃO SEMÂNTICA DE TABELAS FATO
-- =============================================================================
--
--   fato_variavel_ivs_loteamento
--     → Armazena o valor bruto/percentual de cada variável IVS-H
--        por loteamento e período de referência.
--     → É a tabela de ingestão e cálculo intermediário.
--     → Equivale a "o que foi medido, onde e quando".
--
--   fato_ivs_loteamento
--     → Armazena o índice IVS-H já calculado, por dimensão e geral,
--        por loteamento e período.
--     → É a tabela de resultado analítico.
--     → Equivale a "qual é o índice consolidado do loteamento".
--
--   A separação evita ambiguidade semântica e facilita auditoria.
--
-- =============================================================================
-- CONVENÇÃO OBRIGATÓRIA: periodo_referencia
-- =============================================================================
--
--   Formato   | Exemplo       | Uso
--   ----------+---------------+-------------------------------------------
--   YYYY      | '2022'        | Dados anuais (Censo, SNIS, CAGED anual)
--   YYYY-MM   | '2025-12'     | Dados mensais (CadÚnico, CAGED mensal)
--   YYYY-S1   | '2025-S1'     | Primeiro semestre
--   YYYY-S2   | '2025-S2'     | Segundo semestre
--
-- Formatos PROIBIDOS:
--   2025/12   dez-2025   2025_sem1   DEZ2025   dezembro2025
--
-- =============================================================================
-- CONVENÇÃO OBRIGATÓRIA: valor_percentual
-- =============================================================================
--
--   Armazenar sempre como percentual legível:
--   3.6  para  3,6%   (CORRETO)
--   0.036        (ERRADO — escala fracionária)
--
-- =============================================================================


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
     'Ministério das Cidades', 'Anual',
     'https://app4.mdr.gov.br/serieHistorica/', '2026-03-10',
     'Indicadores de água e esgoto por município. IU_01 e IU_02.'),

    ('CADUNICO_DEZ2025',
     'Cadastro Único para Programas Sociais — extração dezembro/2025',
     'Ministério do Desenvolvimento e Assistência Social', 'Contínua',
     NULL, '2026-03-10',
     'Fonte principal de CH e RT. 72.424 pessoas cadastradas em Hortolândia '
     '(dez/2025). Arquivo: /tmp/cecad/tudo.csv na máquina Debian.'),

    ('CENSO2022_SETOR',
     'Censo Demográfico 2022 — Agregados por Setores Censitários',
     'IBGE', 'Decenal',
     'https://ftp.ibge.gov.br/Censos/Censo_Demografico_2022/', '2026-03-10',
     'IU_01, IU_02 e variáveis CH/RT do Censo. Nota: renda domiciliar per '
     'capita por setor não publicada — apenas V06004 (rendimento médio do '
     'responsável). CadÚnico é fonte primária de RT_01.'),

    ('CAGED_MENSAL',
     'Cadastro Geral de Empregados e Desempregados',
     'Ministério do Trabalho', 'Mensal',
     'https://www.gov.br/trabalho-e-emprego/pt-br/assuntos/estatisticas-trabalho/caged',
     '2026-03-10',
     'Vínculo formal. RT_02 e RT_03. MEI não aparece no CAGED.'),

    ('SABESP_SNIS',
     'SABESP — indicadores SNIS Hortolândia',
     'SABESP / Instituto Trata Brasil', 'Anual',
     'https://tratabrasil.org.br', '2026-03-10',
     'Água 100% (2015-2020), esgoto 96,4% (2020), tratamento 89,7% (2020). '
     'Fonte empírica para calibração do peso IU no IVS-H.'),

    ('SIDRA_CENSO2022',
     'SIDRA — Sistema IBGE de Recuperação Automática — Censo 2022',
     'IBGE', 'Decenal',
     'https://sidra.ibge.gov.br', '2026-03-18',
     'Tabela de deslocamento intermunicipal — fonte para IU_03 '
     '(% pessoas com renda <= 1/2 SM e deslocamento > 1h para o trabalho). '
     'NOTA v05: RT_06 (trabalho fora do município) e RT_07 (estudo fora do '
     'município) pertencem ao IPST-H — não ao IVS-H. '
     'Esta fonte permanece válida para IU_03.');


-- =============================================================================
-- TABELA FATO 1 — FATO_VARIAVEL_IVS_LOTEAMENTO
-- =============================================================================

CREATE TABLE IF NOT EXISTS fato_variavel_ivs_loteamento (

    id_fato             INTEGER PRIMARY KEY AUTOINCREMENT,

    id_variavel         TEXT    NOT NULL,
    -- FK → dim_variavel_ivs
    -- Valores IVS-H: IVS001–IVS016 (16 variáveis IPEA)
    -- IVS_L01 e IVS_L02 NÃO pertencem ao IVS-H — pertencem ao IPST-H.

    id_loteamento       TEXT    NOT NULL,
    id_nucleo           TEXT,
    id_rp               TEXT,

    periodo_referencia  TEXT    NOT NULL,
    data_extracao       TEXT    NOT NULL,

    id_fonte            TEXT    NOT NULL,
    -- FK → dim_fonte_dado

    versao_fonte        TEXT,

    valor_absoluto      REAL,
    valor_denominador   REAL,
    valor_percentual    REAL,
    -- Unidade: percentual legível — 3.6 para 3,6%.

    cobertura_cadastral REAL,

    flag_estimado       INTEGER DEFAULT 0,
    flag_revisado       INTEGER DEFAULT 0,
    flag_oficial        INTEGER DEFAULT 1,

    observacoes         TEXT,

    FOREIGN KEY (id_variavel) REFERENCES dim_variavel_ivs(id_variavel),
    FOREIGN KEY (id_fonte)    REFERENCES dim_fonte_dado(id_fonte),

    UNIQUE (id_variavel, id_loteamento, periodo_referencia, id_fonte)
);

CREATE INDEX IF NOT EXISTS idx_fvil_variavel
    ON fato_variavel_ivs_loteamento (id_variavel);
CREATE INDEX IF NOT EXISTS idx_fvil_loteamento
    ON fato_variavel_ivs_loteamento (id_loteamento);
CREATE INDEX IF NOT EXISTS idx_fvil_periodo
    ON fato_variavel_ivs_loteamento (periodo_referencia);
CREATE INDEX IF NOT EXISTS idx_fvil_fonte
    ON fato_variavel_ivs_loteamento (id_fonte);
CREATE INDEX IF NOT EXISTS idx_fvil_nucleo
    ON fato_variavel_ivs_loteamento (id_nucleo);


-- =============================================================================
-- TABELA FATO 2 — FATO_IVS_LOTEAMENTO
-- =============================================================================

CREATE TABLE IF NOT EXISTS fato_ivs_loteamento (

    id_fato             INTEGER PRIMARY KEY AUTOINCREMENT,

    id_loteamento       TEXT    NOT NULL,
    id_nucleo           TEXT,
    id_rp               TEXT,

    periodo_referencia  TEXT    NOT NULL,
    data_calculo        TEXT    NOT NULL,

    versao_calculo      TEXT,
    -- Exemplos: 'IVS-H_FASE1_v1' | 'IVS-H_FASE2_v1'
    -- Fase 1: ponderação original IVS/IPEA, sem calibração local.

    ivsh_infraestrutura_urbana  REAL,
    ivsh_capital_humano         REAL,
    ivsh_renda_trabalho         REAL,
    ivsh_geral          REAL,

    n_variaveis_iu      INTEGER,
    n_variaveis_ch      INTEGER,
    n_variaveis_rt      INTEGER,
    n_variaveis_total   INTEGER,

    flag_parcial        INTEGER DEFAULT 0,
    -- 1 = índice calculado com subconjunto de variáveis (Fase 1)
    -- 0 = índice calculado com conjunto completo (16 variáveis)

    flag_pesos_calibrados INTEGER DEFAULT 0,
    -- 1 = usa peso_h calibrado localmente (Fase 3)
    -- 0 = usa ponderação original IVS/IPEA (Fase 1 e 2)

    observacoes         TEXT,

    FOREIGN KEY (id_loteamento) REFERENCES dim_loteamento(id_loteamento),

    UNIQUE (id_loteamento, periodo_referencia, versao_calculo)
);

CREATE INDEX IF NOT EXISTS idx_fil_loteamento
    ON fato_ivs_loteamento (id_loteamento);
CREATE INDEX IF NOT EXISTS idx_fil_periodo
    ON fato_ivs_loteamento (periodo_referencia);
CREATE INDEX IF NOT EXISTS idx_fil_nucleo
    ON fato_ivs_loteamento (id_nucleo);


-- =============================================================================
-- EXEMPLO DE CARGA — RT_01 com CadÚnico dez/2025
-- =============================================================================

-- INSERT INTO fato_variavel_ivs_loteamento (
--     id_variavel, id_loteamento, id_nucleo, id_rp,
--     periodo_referencia, data_extracao,
--     id_fonte, versao_fonte,
--     valor_absoluto, valor_denominador, valor_percentual,
--     cobertura_cadastral, flag_estimado, flag_oficial, observacoes
-- ) VALUES
--     ('IVS012', 'LOT_001', 'NUC_AMANDA', 'RP_01',
--      '2025-12', '2026-03-23',
--      'CADUNICO_DEZ2025', 'CadUnico_dez2025',
--      412, 980, 42.04, 31.2, 0, 0,
--      'IVS-H Fase 1 — pesos IPEA originais — CadÚnico dez/2025');


-- =============================================================================
-- NOTA SOBRE DINAMISMO DO IVS-H
-- =============================================================================
--
-- Os pesos do IVS-H (campo peso_h em dim_variavel_ivs) serão revisados
-- apenas na Fase 3, após validação empírica. Na Fase 1, usar
-- ponderação original do IVS/IPEA.
--
-- FLUXO DE REVISÃO DE PESOS (Fase 3):
--   fato_variavel_ivs_loteamento (novos valores)
--       → análise de variância por loteamento
--       → revisão de peso_h em dim_variavel_ivs
--       → versionamento no log de dim_variavel_IVS.md
--
-- =============================================================================
-- PRÓXIMOS PASSOS
-- =============================================================================
--
-- 1. Criar dim_loteamento e dim_nucleo para habilitar cálculo por loteamento.
-- 2. Implementar script de carga RT_01 a partir de /tmp/cecad/tudo.csv.
-- 3. Calcular CH_05, CH_06, CH_07, RT_04 e inserir em
--    fato_variavel_ivs_loteamento (Fase 1 — 5 variáveis CadÚnico).
-- 4. Calcular IVS-H Fase 1 com ponderação original IVS/IPEA e inserir
--    em fato_ivs_loteamento (flag_parcial=1, flag_pesos_calibrados=0).
-- 5. Extrair IU_03 do SIDRA/Censo 2022 — tabela de deslocamento
--    intermunicipal (% renda <= 1/2 SM e deslocamento > 1h).
--
-- =============================================================================
-- FIM DA NOTA TÉCNICA v05
-- =============================================================================
