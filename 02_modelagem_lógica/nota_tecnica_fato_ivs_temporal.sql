-- =============================================================================
-- nota_tecnica_fato_ivs_temporal.sql
-- Nota técnica: modelagem da dimensão temporal em FATO_IVS_TERRITORIAL
-- Versão: v01 — 2026-03-10
-- Responsável: Ailton Vendramini / Claude (Anthropic)
-- Repositório: Atlas-Social-de-Hortolândia / 02_modelagem_lógica
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
--   - Os valores reais, por território e por período, pertencem a
--     FATO_IVS_TERRITORIAL
--
-- =============================================================================
-- ESTRUTURA PROPOSTA — FATO_IVS_TERRITORIAL
-- =============================================================================

CREATE TABLE IF NOT EXISTS fato_ivs_territorial (

    -- Chaves de dimensão
    id_fato             INTEGER PRIMARY KEY AUTOINCREMENT,
    id_variavel         TEXT    NOT NULL,   -- FK → dim_variavel_ivs
    id_loteamento       TEXT    NOT NULL,   -- FK → dim_loteamento (unidade mínima)
    id_nucleo           TEXT,               -- FK → dim_nucleo (agregação por CRAS)
    id_rp               TEXT,               -- FK → dim_regiao_planejamento

    -- Dimensão temporal — OBRIGATÓRIA para variáveis dinâmicas
    periodo_referencia  TEXT    NOT NULL,   -- Ex: '2022', '2025-S1', '2025-12'
                                            -- Formato ISO: YYYY | YYYY-SN | YYYY-MM
    data_extracao       TEXT    NOT NULL,   -- Data em que o dado foi coletado (ISO 8601)
    fonte_dado          TEXT    NOT NULL,   -- SNIS | CadÚnico | Censo2022 | CAGED | Saúde | Educação
    versao_fonte        TEXT,               -- Ex: 'SNIS_2022', 'CadUnico_dez2025'

    -- Valor
    valor_absoluto      REAL,               -- Numerador (ex: domicílios sem esgoto)
    valor_denominador   REAL,               -- Denominador (ex: total de domicílios)
    valor_percentual    REAL,               -- valor_absoluto / valor_denominador * 100
                                            -- OU diretamente % quando fonte já agrega

    -- Qualidade do dado
    cobertura_cadastral REAL,               -- % da população coberta pela fonte
                                            -- Ex: CadÚnico cobre ~30% da pop. total
    flag_estimado       INTEGER DEFAULT 0,  -- 1 = valor estimado / interpolado
    flag_revisado       INTEGER DEFAULT 0,  -- 1 = dado revisado após publicação inicial
    observacoes         TEXT,

    -- Integridade referencial
    FOREIGN KEY (id_variavel) REFERENCES dim_variavel_ivs(id_variavel),

    -- Unicidade: uma variável, um território, um período, uma fonte
    UNIQUE (id_variavel, id_loteamento, periodo_referencia, fonte_dado)
);

-- =============================================================================
-- ÍNDICES
-- =============================================================================

CREATE INDEX IF NOT EXISTS idx_fato_variavel
    ON fato_ivs_territorial (id_variavel);

CREATE INDEX IF NOT EXISTS idx_fato_loteamento
    ON fato_ivs_territorial (id_loteamento);

CREATE INDEX IF NOT EXISTS idx_fato_periodo
    ON fato_ivs_territorial (periodo_referencia);

CREATE INDEX IF NOT EXISTS idx_fato_fonte
    ON fato_ivs_territorial (fonte_dado);

-- =============================================================================
-- TABELA DE FONTES — DIM_FONTE_DADO
-- Registra as fontes de dados usadas no cálculo do IVS-H,
-- com periodicidade e URL de acesso.
-- =============================================================================

CREATE TABLE IF NOT EXISTS dim_fonte_dado (

    id_fonte            TEXT    PRIMARY KEY,  -- Ex: 'SNIS_2022', 'CADUNICO_DEZ2025'
    nome_fonte          TEXT    NOT NULL,
    orgao_responsavel   TEXT,
    periodicidade       TEXT,     -- Anual | Semestral | Mensal | Decenal | Eventual
    url_acesso          TEXT,
    data_ultima_carga   TEXT,     -- ISO 8601
    observacoes         TEXT
);

-- Carga inicial de fontes conhecidas
INSERT OR IGNORE INTO dim_fonte_dado VALUES
    ('SNIS_2022',       'Sistema Nacional de Informações sobre Saneamento',
     'Ministério das Cidades',    'Anual',
     'https://app4.mdr.gov.br/serieHistorica/', '2026-03-10',
     'Indicadores de água e esgoto por município. IU_01 e IU_02.'),
    ('CADUNICO_DEZ2025','Cadastro Único para Programas Sociais',
     'Ministério do Desenvolvimento e Assistência Social', 'Contínua',
     NULL, '2026-03-10',
     'Fonte principal de CH e RT. 72.424 pessoas cadastradas em Hortolândia (dez/2025).'),
    ('CENSO2022_SETOR', 'Censo Demográfico 2022 — Agregados por Setores Censitários',
     'IBGE', 'Decenal',
     'https://ftp.ibge.gov.br/Censos/Censo_Demografico_2022/', '2026-03-10',
     'Script de extração: 03_indicadores_mvp/scripts/ibge_censo2022_hortolandia.py'),
    ('CAGED_MENSAL',    'Cadastro Geral de Empregados e Desempregados',
     'Ministério do Trabalho', 'Mensal',
     'https://www.gov.br/trabalho-e-emprego/pt-br/assuntos/estatisticas-trabalho/caged',
     '2026-03-10',
     'Vínculo formal. RT_02 e RT_03. MEI não aparece no CAGED.'),
    ('SABESP_SNIS',     'SABESP — indicadores SNIS Hortolândia',
     'SABESP / Instituto Trata Brasil', 'Anual',
     'https://tratabrasil.org.br', '2026-03-10',
     'Água 100% (2015–2020), esgoto 96,4% (2020), tratamento 89,7% (2020). '
     'Fonte empírica para calibração do peso IU no IVS-H.');

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
--      - Se cobertura de esgoto cair abaixo de 90% em algum território,
--        IU_01 readquire poder discriminatório
--      - Monitorar via SNIS (publicação anual)
--
--   2. Atualização do CadÚnico (variáveis CH e RT):
--      - Recomendado: recalcular IVS-H a cada extração semestral
--
--   3. Novos dados do Censo IBGE:
--      - Próximo Censo: ~2032
--      - Até lá, Censo 2022 é a referência estática para IU
--
--   FLUXO DE REVISÃO DE PESOS:
--   fato_ivs_territorial (novos valores)
--       → análise de variância por território
--       → revisão de peso_h em dim_variavel_ivs
--       → versionamento no log do arquivo dim_variavel_IVS.md
--
-- =============================================================================
-- EXEMPLO DE CARGA — IU_01 com dado histórico SNIS
-- =============================================================================

-- INSERT INTO fato_ivs_territorial (
--     id_variavel, id_loteamento, periodo_referencia,
--     data_extracao, fonte_dado, versao_fonte,
--     valor_percentual, cobertura_cadastral, observacoes
-- ) VALUES
--     ('IVS001', 'MUNICIPIO_HORTOLANDIA', '2020',
--      '2026-03-10', 'SABESP_SNIS', 'SNIS_2020',
--      3.6,   -- 100% - 96,4% = 3,6% sem coleta de esgoto
--      100.0, -- SNIS cobre 100% da população servida pela SABESP
--      'Dado municipal agregado. Desagregação por loteamento requer Censo 2022.');

-- =============================================================================
-- FIM DA NOTA TÉCNICA
-- Próximo passo: criar dim_loteamento e dim_nucleo para habilitar
-- o cálculo do IVS-H por território (não apenas por município).
-- =============================================================================

