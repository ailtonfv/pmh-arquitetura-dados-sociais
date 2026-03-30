-- =============================================================================
-- rel_programa_indicador_v02.sql
-- Modelagem lógica: REL_PROGRAMA_INDICADOR
-- Versão: v02 — 2026-03-31
-- Responsável: Ailton Vendramini
-- Repositório: Atlas-Social-de-Hortolândia / 02_modelagem_lógica
-- =============================================================================
-- v01 — 2026-03-15 — Criação
--        Origem conceitual: rel_programa_indicador_v01.md (01_modelagem_conceitual)
--        Motivação: campo indicador_principal em DIM_PROGRAMA é insuficiente
--        para programas com múltiplos indicadores de naturezas distintas
-- v02 — 2026-03-31 — Nota arquitetural de governança de acesso ao SIGAS
--        Origem: levantamento técnico realizado junto à equipe operacional
--        do sistema municipal de atendimento socioassistencial (SIGAS)
-- =============================================================================

-- =============================================================================
-- NOTA ARQUITETURAL — GOVERNANÇA DE ACESSO AO SIGAS (v02)
-- =============================================================================
--
-- Vários indicadores desta tabela referenciam 'SIGAS' ou 'CadÚnico + SIGAS'
-- no campo fonte_dado. É necessário registrar as condições de acesso a essa
-- fonte antes de qualquer implementação que dependa dela.
--
-- CONDIÇÕES DE ACESSO (levantamento mar/2026):
--
--   O banco de dados do SIGAS roda em servidor externo (empresa contratada).
--   O acesso requer:
--     (a) solicitação formal via sistema de documentos oficial à
--         Secretaria Municipal de Inclusão e Desenvolvimento Social; e
--     (b) consulta ao Departamento de Sistemas da Prefeitura quanto à
--         viabilidade técnica e procedimentos de extração.
--
-- RESTRIÇÃO DE SIGILO PROFISSIONAL:
--
--   Parte dos dados registrados no SIGAS é classificada sob sigilo
--   profissional — em especial relatórios de evolução e acompanhamento
--   de famílias, equivalentes funcionalmente ao sigilo de prontuário.
--   Esses dados podem não ser liberados para integração analítica,
--   independentemente da aprovação do acesso técnico.
--
-- IMPLICAÇÃO PARA OS INDICADORES DESTA TABELA:
--
--   Indicadores com fonte_dado = 'SIGAS' ou 'CadÚnico + SIGAS' devem ser
--   tratados como DEPENDENTES DE APROVAÇÃO FORMAL até que o acesso seja
--   concedido e o escopo dos dados liberados seja conhecido.
--
--   Indicadores afetados (exemplos):
--     - PAIF: famílias em acompanhamento ativo
--     - PAIF: taxa de cobertura PAIF por núcleo
--     - SISTEMA: taxa de cobertura SUAS
--     - SISTEMA: taxa de emancipação assistida
--     - SISTEMA: taxa de reincidência
--     - POL_PCD: PCD com acesso a pelo menos 1 serviço
--     (ver coluna fonte_dado para lista completa)
--
--   Indicadores com fonte_dado = 'CadÚnico' exclusivamente NÃO são
--   afetados por esta restrição — o CadÚnico já está disponível.
--
-- PRÓXIMO PASSO:
--   Formalizar solicitação de acesso via DOCS antes de iniciar qualquer
--   extração ou cruzamento que dependa do SIGAS.
--
-- =============================================================================

-- =============================================================================
-- MOTIVAÇÃO
-- =============================================================================
--
-- O campo indicador_principal em DIM_PROGRAMA (texto curto, campo único)
-- foi suficiente para a primeira versão do catálogo.
-- Porém, programas complexos exigem múltiplos indicadores de naturezas distintas.
--
-- Exemplo concreto — CENTROPOP:
--
--   indicador             | tipo          | o que mede
--   ----------------------+---------------+-------------------------------------
--   atendimentos/mês      | produto       | volume de entregas
--   encaminhamentos       | processo      | qualidade do fluxo assistencial
--   reinserção social     | resultado     | mudança real na vida da pessoa
--
-- Colocar apenas um desses no campo indicador_principal apagaria
-- a distinção entre "fazer" (produto) e "mudar" (resultado) —
-- distinção que é exatamente o que o Atlas Social precisa capturar.
--
-- PRINCÍPIO:
--   Um programa pode ter N indicadores.
--   Um indicador pode ser compartilhado por M programas.
--   A tabela REL_PROGRAMA_INDICADOR é a ponte N:M.
--
-- RELAÇÃO COM AS TRÊS CAMADAS DO CATÁLOGO:
--
--   Camada 1 — Inventário Institucional  →  DIM_PROGRAMA
--   Camada 2 — Governança               →  DIM_ORGAO_EXECUTOR + base_legal
--   Camada 3 — Avaliação                →  REL_PROGRAMA_INDICADOR + FATO_INDICADOR
--
--   Esta tabela pertence à Camada 3.
--   Sem ela, o projeto descreve a política pública.
--   Com ela, o projeto avalia a política pública.
--
-- =============================================================================
-- TIPO_INDICADOR — LÓGICA DE CLASSIFICAÇÃO
-- =============================================================================
--
--   insumo    — recursos disponibilizados para o programa
--               Ex: vagas ofertadas, valor do repasse, servidores lotados
--
--   processo  — atividades realizadas durante a execução
--               Ex: encaminhamentos, visitas domiciliares, abordagens
--
--   produto   — entregas diretas do programa ao público-alvo
--               Ex: famílias acompanhadas, atendimentos realizados
--
--   resultado — mudança observada no público-alvo após a intervenção
--               Ex: inserção formal, saída da situação de rua, evasão escolar
--
--   impacto   — mudança estrutural de longo prazo (horizonte multi-anual)
--               Ex: redução do IVS-H do núcleo, variação na taxa de pobreza
--
-- HIERARQUIA DE RELEVÂNCIA PARA O ATLAS SOCIAL:
--   resultado > produto > processo > insumo
--   impacto é medido por FATO_IVS_LOTEAMENTO, não aqui.
--
-- =============================================================================
-- ESTRUTURA — REL_PROGRAMA_INDICADOR
-- =============================================================================

CREATE TABLE IF NOT EXISTS rel_programa_indicador (

    -- Chave primária
    id_rel              INTEGER PRIMARY KEY AUTOINCREMENT,

    -- Chaves de dimensão
    id_programa         TEXT    NOT NULL,   -- FK → dim_programa
    id_nucleo           TEXT,               -- FK → dim_nucleo (NULL = Municipal)
                                            -- Quando preenchido: indicador calculado
                                            -- apenas para aquele núcleo

    -- Identificação do indicador
    indicador           TEXT    NOT NULL,   -- Nome padronizado (texto curto)
    descricao           TEXT,               -- Descrição completa da fórmula/critério

    -- Classificação
    tipo_indicador      TEXT    NOT NULL    -- insumo | processo | produto |
        CHECK (tipo_indicador IN (          -- resultado | impacto
            'insumo', 'processo', 'produto', 'resultado', 'impacto'
        )),

    unidade_medida      TEXT    NOT NULL,   -- famílias | atendimentos | % | R$ | vagas | pessoas

    -- Monitoramento
    periodicidade       TEXT    NOT NULL    -- mensal | trimestral | semestral | anual | por_evento
        CHECK (periodicidade IN (
            'mensal', 'trimestral', 'semestral', 'anual', 'por_evento'
        )),

    fonte_dado          TEXT    NOT NULL,   -- CadÚnico | SIGAS | CRAS | CAGED |
                                            -- IBGE | Secretaria | OSC | A confirmar
                                            -- ATENÇÃO: fontes que incluem SIGAS
                                            -- dependem de acesso formal — ver nota
                                            -- arquitetural de governança no cabeçalho

    -- Dimensão IVS associada
    dimensao_ivs        TEXT                -- infraestrutura_urbana | capital_humano |
        CHECK (dimensao_ivs IN (           -- renda_trabalho | multidimensional | governanca
            'infraestrutura_urbana', 'capital_humano',
            'renda_trabalho', 'multidimensional', 'governanca'
        )),

    -- Prioridade
    prioritario         INTEGER DEFAULT 0   -- 1 = indicador principal do programa
        CHECK (prioritario IN (0, 1)),      -- substitui campo indicador_principal de DIM_PROGRAMA

    -- Controle
    data_criacao        TEXT    DEFAULT (date('now')),
    observacoes         TEXT,

    -- Integridade referencial
    FOREIGN KEY (id_programa) REFERENCES dim_programa(id_programa),

    -- Unicidade: um programa não repete o mesmo indicador duas vezes
    UNIQUE (id_programa, indicador)
);

-- =============================================================================
-- ÍNDICES
-- =============================================================================

CREATE INDEX IF NOT EXISTS idx_rel_pi_programa
    ON rel_programa_indicador (id_programa);

CREATE INDEX IF NOT EXISTS idx_rel_pi_tipo
    ON rel_programa_indicador (tipo_indicador);

CREATE INDEX IF NOT EXISTS idx_rel_pi_dimensao
    ON rel_programa_indicador (dimensao_ivs);

CREATE INDEX IF NOT EXISTS idx_rel_pi_nucleo
    ON rel_programa_indicador (id_nucleo);

CREATE INDEX IF NOT EXISTS idx_rel_pi_prioritario
    ON rel_programa_indicador (prioritario);

-- =============================================================================
-- CARGA INICIAL — GRUPO 1: PROTEÇÃO SOCIAL BÁSICA
-- =============================================================================

INSERT OR IGNORE INTO rel_programa_indicador
    (id_programa, indicador, tipo_indicador, unidade_medida, periodicidade, fonte_dado, dimensao_ivs, prioritario, observacoes)
VALUES
    ('PAIF', 'famílias em acompanhamento ativo',          'produto',    'famílias',    'mensal',    'SIGAS',            'multidimensional', 1, NULL),
    ('PAIF', 'famílias vulneráveis no núcleo (denominador)', 'insumo',  'famílias',    'anual',     'CadÚnico',         'multidimensional', 0, 'Denominador para cálculo da taxa de cobertura'),
    ('PAIF', 'taxa de cobertura PAIF por núcleo',         'resultado',  '%',           'semestral', 'CadÚnico + SIGAS', 'multidimensional', 0, 'Famílias acompanhadas / famílias vulneráveis'),
    ('SCFV', 'crianças e adolescentes matriculados',      'produto',    'pessoas',     'mensal',    'CRAS (registro)',  'capital_humano',   1, NULL),
    ('SCFV', 'cobertura SCFV por núcleo',                 'resultado',  '%',           'semestral', 'CadÚnico + CRAS', 'capital_humano',   0, NULL),
    ('SCFV', 'evasão escolar entre participantes',        'resultado',  '%',           'semestral', 'Educação',        'capital_humano',   0, NULL),
    ('SCFV', 'núcleos com SCFV ausente',                  'processo',   'núcleos',     'semestral', 'CRAS (registro)', 'capital_humano',   0, 'Questionado formalmente pelo CMDCA — Ofício 001/2026'),
    ('CCS',  'frequentadores ativos',                     'produto',    'pessoas',     'mensal',    'CRAS_ROSOLEM',    'capital_humano',   1, NULL);

-- =============================================================================
-- CARGA INICIAL — GRUPO 2: PROTEÇÃO ESPECIAL MÉDIA COMPLEXIDADE
-- =============================================================================

INSERT OR IGNORE INTO rel_programa_indicador
    (id_programa, indicador, tipo_indicador, unidade_medida, periodicidade, fonte_dado, dimensao_ivs, prioritario, observacoes)
VALUES
    ('PAEFI',          'famílias em acompanhamento',                     'produto',    'famílias',        'mensal',    'CREAS_01',       'multidimensional', 1, NULL),
    ('PAEFI',          'casos encerrados com superação de violação',      'resultado',  '%',               'semestral', 'CREAS_01',       'multidimensional', 0, NULL),
    ('CENTROPOP',      'atendimentos realizados',                         'produto',    'atendimentos',    'mensal',    'CENTROPOP_01',   'multidimensional', 1, NULL),
    ('CENTROPOP',      'encaminhamentos para abrigo e serviços',          'processo',   'encaminhamentos', 'mensal',    'CENTROPOP_01',   'multidimensional', 0, NULL),
    ('CENTROPOP',      'reinserção social — saída da situação de rua',    'resultado',  'pessoas',         'semestral', 'CENTROPOP_01',   'multidimensional', 0, NULL),
    ('ABORDAGEM_SOCIAL','abordagens realizadas',                          'produto',    'abordagens',      'mensal',    'CENTROPOP_01',   'multidimensional', 1, NULL),
    ('ABORDAGEM_SOCIAL','pessoas identificadas sem CadÚnico',             'resultado',  'pessoas',         'mensal',    'CadÚnico',       'multidimensional', 0, 'Ponto cego: pop. rua sem cadastro'),
    ('MSE_LA_PSC',     'adolescentes em acompanhamento',                  'produto',    'pessoas',         'mensal',    'CREAS_01',       'capital_humano',   1, NULL),
    ('MSE_LA_PSC',     'reincidência de medida socioeducativa',           'resultado',  '%',               'anual',     'CREAS_01',       'capital_humano',   0, NULL),
    ('EMERGENCIAS',    'famílias atendidas por evento',                   'produto',    'famílias',        'por_evento','SMIDS',          'multidimensional', 1, NULL),
    ('EMERGENCIAS',    'dias médios até solução habitacional',            'resultado',  'dias',            'por_evento','SMIDS',          'infraestrutura_urbana', 0, NULL);

-- =============================================================================
-- CARGA INICIAL — GRUPO 3: PROTEÇÃO ESPECIAL ALTA COMPLEXIDADE
-- =============================================================================

INSERT OR IGNORE INTO rel_programa_indicador
    (id_programa, indicador, tipo_indicador, unidade_medida, periodicidade, fonte_dado, dimensao_ivs, prioritario, observacoes)
VALUES
    ('SAICA',          'crianças e adolescentes acolhidos',               'produto',    'pessoas',  'mensal',    'OSC_SAO_PEDRO', 'capital_humano',      1, 'Executor: OSC_SAO_PEDRO desde fev/2026'),
    ('SAICA',          'tempo médio de acolhimento',                      'processo',   'meses',    'semestral', 'OSC_SAO_PEDRO', 'capital_humano',      0, NULL),
    ('SAICA',          'desligamentos para família de origem ou substituta','resultado', '%',        'semestral', 'OSC_SAO_PEDRO', 'capital_humano',      0, NULL),
    ('ABRIGO_ADULTOS', 'vagas ocupadas',                                   'produto',   'vagas',    'mensal',    'OSC_SAO_PEDRO', 'infraestrutura_urbana',1, NULL),
    ('ABRIGO_ADULTOS', 'tempo médio de permanência',                       'processo',  'meses',    'semestral', 'OSC_SAO_PEDRO', 'infraestrutura_urbana',0, NULL),
    ('REPUBLICA',      'residentes com vínculo formal de emprego',         'resultado', '%',        'semestral', 'OSC_SAO_PEDRO + CAGED', 'renda_trabalho',1, NULL),
    ('REPUBLICA',      'residentes com moradia autônoma ao desligamento',  'resultado', '%',        'semestral', 'OSC_SAO_PEDRO', 'infraestrutura_urbana',0, NULL),
    ('RESSIGNIFICA',   'beneficiários ativos',                             'produto',   'pessoas',  'mensal',    'CENTROPOP_01',  'multidimensional',    1, NULL),
    ('RESSIGNIFICA',   'beneficiários com moradia estável após 6 meses',   'resultado', '%',        'semestral', 'CENTROPOP_01',  'infraestrutura_urbana',0, NULL),
    ('RESSIGNIFICA',   'beneficiários com vínculo formal de emprego',      'resultado', '%',        'semestral', 'CAGED',         'renda_trabalho',      0, NULL);

-- =============================================================================
-- CARGA INICIAL — GRUPO 4: PROGRAMAS MUNICIPAIS
-- =============================================================================

INSERT OR IGNORE INTO rel_programa_indicador
    (id_programa, indicador, tipo_indicador, unidade_medida, periodicidade, fonte_dado, dimensao_ivs, prioritario, observacoes)
VALUES
    ('ACERTE',       'participantes matriculados',                       'produto',   'pessoas', 'por_evento','DEP_DIPGR',  'renda_trabalho', 1, NULL),
    ('ACERTE',       'inserção formal pós-programa (6 meses)',           'resultado', '%',       'semestral', 'CAGED',      'renda_trabalho', 0, NULL),
    ('CRIANCA_FELIZ','visitas domiciliares realizadas',                  'produto',   'visitas', 'mensal',    'OSC executora','capital_humano',1, 'OSC executora a identificar — Pendência P13'),
    ('CRIANCA_FELIZ','crianças 0–6 acompanhadas',                       'produto',   'pessoas', 'mensal',    'OSC executora','capital_humano',0, NULL),
    ('CRIANCA_FELIZ','famílias com CadÚnico atualizado após intervenção','resultado', '%',       'semestral', 'CadÚnico',   'capital_humano', 0, NULL);

-- =============================================================================
-- CARGA INICIAL — GRUPO 5: SEGURANÇA ALIMENTAR
-- =============================================================================

INSERT OR IGNORE INTO rel_programa_indicador
    (id_programa, indicador, tipo_indicador, unidade_medida, periodicidade, fonte_dado, dimensao_ivs, prioritario, observacoes)
VALUES
    ('BAH',    'pessoas atendidas via OSCs parceiras',     'produto',  'pessoas',    'mensal', 'DEP_SEG_ALIMENTAR', 'renda_trabalho', 1, '1.762 pessoas (2024)'),
    ('BAH',    'toneladas de alimentos distribuídas',      'produto',  'toneladas',  'mensal', 'DEP_SEG_ALIMENTAR', 'renda_trabalho', 0, NULL),
    ('BAH',    'OSCs parceiras ativas',                    'insumo',   'OSCs',       'anual',  'DEP_SEG_ALIMENTAR', 'renda_trabalho', 0, '19 OSCs (2024)'),
    ('PAA',    'agricultores familiares credenciados',     'insumo',   'agricultores','anual', 'DEP_SEG_ALIMENTAR', 'renda_trabalho', 1, NULL),
    ('PAA',    'famílias beneficiadas com doação simultânea','produto', 'famílias',  'anual',  'DEP_SEG_ALIMENTAR', 'renda_trabalho', 0, NULL),
    ('CESTAS', 'cestas distribuídas',                      'produto',  'cestas',     'mensal', 'FUNDO_SOCIAL',      'renda_trabalho', 1, NULL);

-- =============================================================================
-- CARGA INICIAL — GRUPO 7: INSERÇÃO PRODUTIVA
-- =============================================================================

INSERT OR IGNORE INTO rel_programa_indicador
    (id_programa, indicador, tipo_indicador, unidade_medida, periodicidade, fonte_dado, dimensao_ivs, prioritario, observacoes)
VALUES
    ('PAT',          'encaminhamentos realizados',                      'produto',   'encaminhamentos','mensal',    'PAT_01',            'renda_trabalho', 1, NULL),
    ('PAT',          'encaminhamentos com inserção formal',             'resultado', '%',              'trimestral','PAT_01 + CAGED',    'renda_trabalho', 0, NULL),
    ('PAT',          'beneficiários do CadÚnico encaminhados',         'processo',  'pessoas',        'mensal',    'PAT_01 + CadÚnico', 'renda_trabalho', 0, NULL),
    ('SINE',         'trabalhadores cadastrados',                       'produto',   'pessoas',        'mensal',    'PAT_01',            'renda_trabalho', 1, NULL),
    ('SINE',         'vagas preenchidas via SINE',                      'resultado', 'vagas',          'mensal',    'PAT_01',            'renda_trabalho', 0, NULL),
    ('PEI',          'PCD atendidos',                                   'produto',   'pessoas',        'mensal',    'DEP_PCD',           'renda_trabalho', 1, NULL),
    ('PEI',          'PCD com vínculo formal após programa',            'resultado', '%',              'semestral', 'CAGED',             'renda_trabalho', 0, NULL),
    ('SEG_DESEMPREGO','beneficiários ativos',                           'produto',   'pessoas',        'mensal',    'PAT_01',            'renda_trabalho', 1, NULL),
    ('SEG_DESEMPREGO','entrada no CadÚnico após esgotamento',          'resultado', 'pessoas',        'semestral', 'CadÚnico',          'renda_trabalho', 0, 'Esgotamento do seguro → porta de entrada no SUAS');

-- =============================================================================
-- CARGA INICIAL — GRUPO 8: PÚBLICOS ESPECÍFICOS / DIREITOS HUMANOS
-- =============================================================================

INSERT OR IGNORE INTO rel_programa_indicador
    (id_programa, indicador, tipo_indicador, unidade_medida, periodicidade, fonte_dado, dimensao_ivs, prioritario, observacoes)
VALUES
    ('CRAM', 'atendimentos realizados',                     'produto',   'atendimentos', 'mensal',    'CRAM_01',        'multidimensional', 1, '293 atend. jan–mar/2026'),
    ('CRAM', 'medidas protetivas solicitadas',              'processo',  'medidas',      'mensal',    'CRAM_01 + TJ-SP','multidimensional', 0, '94 medidas jan–fev/2026 — maior da região'),
    ('CRAM', 'mulheres reincidentes por nova violência',    'resultado', '%',            'semestral', 'CRAM_01',        'multidimensional', 0, NULL),
    ('POL_PCD','PCD cadastradas',                           'produto',   'pessoas',      'anual',     'DEP_PCD',        'capital_humano',   1, NULL),
    ('POL_PCD','PCD com acesso a pelo menos 1 serviço',     'resultado', '%',            'anual',     'DEP_PCD + SIGAS','capital_humano',   0, NULL);

-- =============================================================================
-- CARGA INICIAL — GRUPO 11: GOVERNANÇA
-- =============================================================================

INSERT OR IGNORE INTO rel_programa_indicador
    (id_programa, indicador, tipo_indicador, unidade_medida, periodicidade, fonte_dado, dimensao_ivs, prioritario, observacoes)
VALUES
    ('CMAS',         'reuniões ordinárias realizadas',       'processo',  'reuniões',  'anual',     'CMASH',     'governanca', 1, NULL),
    ('CMAS',         'resoluções publicadas',                'produto',   'resoluções','anual',     'DO Municipal','governanca',0, NULL),
    ('PMAS',         'metas do PMAS 2026–2029 cumpridas',    'resultado', '%',         'anual',     'SMIDS',     'governanca', 1, 'PMAS aprovado Res. CMAS 006/2026 em 06/02/2026'),
    ('COMISSAO_VD',  'metas do Plano de Metas VD cumpridas', 'resultado', '%',         'semestral', 'SMIDS',     'multidimensional', 1, 'Decreto 5.810/2026 — prazo 180 dias');

-- =============================================================================
-- INDICADORES TRANSVERSAIS DO SISTEMA
-- =============================================================================
--
-- Estes indicadores não pertencem a um único programa.
-- São calculados em FATO_INDICADOR cruzando múltiplas fontes.
-- Registrados aqui como referência para o dashboard gerencial.
--
-- id_programa = 'SISTEMA' (programa fictício — representa o SUAS municipal)
--
-- =============================================================================

INSERT OR IGNORE INTO rel_programa_indicador
    (id_programa, indicador, tipo_indicador, unidade_medida, periodicidade, fonte_dado, dimensao_ivs, prioritario, observacoes)
VALUES
    ('SISTEMA', 'taxa de cobertura SUAS',
     'resultado', '%', 'semestral', 'CadÚnico + SIGAS', 'multidimensional', 1,
     'Famílias atendidas / famílias vulneráveis no CadÚnico'),

    ('SISTEMA', 'taxa de emancipação assistida',
     'resultado', '%', 'anual', 'SIGAS + CAGED', 'renda_trabalho', 1,
     'Beneficiários que saíram da rede com autonomia / total desligado'),

    ('SISTEMA', 'tempo médio até inserção formal',
     'resultado', 'meses', 'anual', 'SIGAS + CAGED', 'renda_trabalho', 0,
     'Meses entre entrada na rede e primeiro vínculo CAGED'),

    ('SISTEMA', 'taxa de reincidência',
     'resultado', '%', 'anual', 'SIGAS', 'multidimensional', 1,
     'Beneficiários que retornam após desligamento / total desligado'),

    ('SISTEMA', 'permanência média no benefício',
     'resultado', 'meses', 'semestral', 'SIGAS + CadÚnico', 'renda_trabalho', 0,
     'Meses médios de permanência em programas de transferência'),

    ('SISTEMA', 'concentração de vulnerabilidade por núcleo',
     'resultado', 'índice', 'anual', 'CadÚnico + IBGE', 'multidimensional', 0,
     'IVS-H médio por núcleo — calculado em FATO_IVS_LOTEAMENTO'),

    ('SISTEMA', 'gap de cobertura por núcleo',
     'resultado', '%', 'semestral', 'CadÚnico + SIGAS', 'multidimensional', 1,
     'Famílias vulneráveis sem atendimento / total vulneráveis por núcleo');

-- =============================================================================
-- QUERIES ANALÍTICAS DE REFERÊNCIA
-- =============================================================================

-- 1. Todos os indicadores de resultado do SUAS:
-- SELECT id_programa, indicador, unidade_medida, periodicidade
-- FROM rel_programa_indicador
-- WHERE tipo_indicador = 'resultado'
-- ORDER BY id_programa;

-- 2. Indicador principal de cada programa:
-- SELECT id_programa, indicador, tipo_indicador, dimensao_ivs
-- FROM rel_programa_indicador
-- WHERE prioritario = 1
-- ORDER BY id_programa;

-- 3. Programas sem indicador de resultado (lacuna de avaliação):
-- SELECT DISTINCT p.id_programa, p.nome_programa
-- FROM dim_programa p
-- WHERE p.id_programa NOT IN (
--     SELECT DISTINCT id_programa
--     FROM rel_programa_indicador
--     WHERE tipo_indicador = 'resultado'
-- )
-- AND p.status_programa = 'ativo';

-- 4. Indicadores por dimensão IVS:
-- SELECT dimensao_ivs, COUNT(*) as qtd_indicadores,
--        COUNT(DISTINCT id_programa) as qtd_programas
-- FROM rel_programa_indicador
-- GROUP BY dimensao_ivs
-- ORDER BY qtd_indicadores DESC;

-- 5. Indicadores cuja fonte é CAGED — cruzamento com mercado formal:
-- SELECT id_programa, indicador, tipo_indicador
-- FROM rel_programa_indicador
-- WHERE fonte_dado LIKE '%CAGED%'
-- ORDER BY tipo_indicador, id_programa;

-- 6. Indicadores dependentes de acesso formal ao SIGAS:
-- SELECT id_programa, indicador, fonte_dado
-- FROM rel_programa_indicador
-- WHERE fonte_dado LIKE '%SIGAS%'
-- ORDER BY id_programa;

-- =============================================================================
-- NOTA ARQUITETURAL — EVOLUÇÃO PARA FATO_INDICADOR
-- =============================================================================
--
-- Esta tabela define O QUE medir por programa.
-- Os valores reais medidos no tempo pertencem a FATO_INDICADOR (a criar):
--
--   FATO_INDICADOR
--   --------------
--   id_rel              FK → rel_programa_indicador
--   id_nucleo           FK → dim_nucleo (NULL = municipal)
--   periodo_referencia  TEXT  (YYYY | YYYY-SN | YYYY-MM)
--   valor               REAL
--   fonte_carga         TEXT
--   data_extracao       TEXT
--   observacoes         TEXT
--
-- Fluxo:
--   rel_programa_indicador (estrutura)
--       → FATO_INDICADOR (valores no tempo)
--           → dashboard gerencial
--               → Camada 3 do Atlas Social
--
-- =============================================================================
-- FIM
-- =============================================================================
