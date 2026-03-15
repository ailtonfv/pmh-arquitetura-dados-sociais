
# DIM_DINAMICA_METROPOLITANA — Dinâmica Metropolitana do Trabalho
**Versão:** v01  
**Data:** 2026-03-15  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual

> Este documento define o bloco analítico **Dinâmica Metropolitana do Trabalho** —
> conjunto de indicadores estruturais que contextualiza o IVS-H dentro da realidade
> econômica regional de Hortolândia.
>
> **Não contém:**
> - Cálculo do IVS-H → `dim_variavel_IVS_v01r3.md`
> - Cobertura de serviços por núcleo → `REL_PROGRAMA_NUCLEO` (a criar)
> - Vínculos empregatícios individuais → `FATO_INSERCAO_PRODUTIVA` (a criar)

---

## Princípio Estruturante

Este bloco analítico opera em plano distinto do IVS-H.

```
IVS-H                              DIM_DINAMICA_METROPOLITANA
──────────────────────────         ──────────────────────────────────────
fenômeno: vulnerabilidade          fenômeno: estrutura econômica
escala:   família                  escala:   município / arranjo regional
unidade:  pessoa → loteamento      unidade:  município → arranjo populacional
ciclo:    anual (dados admin.)     ciclo:    decenal (Censo) / contínuo (PNAD)
```

> **Separação conceitual obrigatória:**
> Incorporar indicadores pendulares dentro do cálculo do IVS-H misturaria
> fenômenos de escalas diferentes e quebraria a comparabilidade com o IVS
> nacional do IPEA. A Dinâmica Metropolitana é um **segundo eixo analítico** —
> complementar ao IVS-H, nunca integrante dele.

---

## 1. Motivação

Hortolândia integra o **Arranjo Populacional de Campinas/SP** (IBGE, 2016),
concentração urbana de 1,87 milhão de habitantes. O índice de integração
do município com o arranjo é **0,42** — um dos mais altos do conjunto.

Esse fenômeno não é capturado pelo IVS-H, que opera na escala família/loteamento.
Sem este bloco, o Atlas Social ficaria sem resposta para a pergunta:

> *Um núcleo com IVS-H alto é vulnerável por déficit de infraestrutura local —
> ou porque depende estruturalmente de emprego externo ao município?*

Causas diferentes exigem respostas de política pública diferentes.

---

## 2. Tipologia de Município — Por que a Taxa de Entrada é Essencial

O saldo pendular sozinho não distingue situações economicamente opostas.

| cidade | saídas | entradas | saldo | tipo real |
|--------|--------|----------|-------|-----------|
| A | 60 mil | 10 mil | −50 mil | Dormitório |
| B | 60 mil | 50 mil | −10 mil | Integrado |

O saldo é negativo nas duas — mas a estrutura econômica é totalmente diferente.
A taxa de entrada é essencial para classificar corretamente o município.

| tipo | saída | entrada | saldo | interpretação |
|------|-------|---------|-------|---------------|
| DORMITORIO | alta | baixa | negativo grande | depende de emprego externo |
| EQUILIBRADO | moderada | moderada | próximo de zero | mercado de trabalho local suficiente |
| POLO_EMPREGO | baixa | alta | positivo | atrai trabalhadores de outros municípios |
| INTEGRADO | alta | alta | variável | forte interdependência regional |

---

## 3. Estrutura da Dimensão

### 3.1 Entidade principal

```
DIM_DINAMICA_METROPOLITANA
──────────────────────────
id_registro               PK
id_municipio              código IBGE — 3519071 para Hortolândia
nome_municipio            Hortolândia
nome_arranjo              Campinas/SP
ano_referencia            ano do dado (2010 | 2022 | ...)
fonte                     IBGE_ARRANJOS | CENSO | PNAD
data_referencia
observacoes
```

### 3.2 Indicadores de fluxo

```
-- Fluxos absolutos
saidas_trabalho            residentes que trabalham fora do município
saidas_estudo              residentes que estudam fora do município
entradas_trabalho          não residentes que trabalham no município
entradas_estudo            não residentes que estudam no município

-- Indicadores calculados
taxa_saida_pendular        saidas_trabalho / populacao_ocupada_residente
taxa_entrada_pendular      entradas_trabalho / empregos_localizados_municipio
saldo_pendular             entradas_trabalho - saidas_trabalho
indice_integracao          saidas_totais / populacao_residente
                           (metodologia IBGE — Arranjos Populacionais 2016)
```

### 3.3 Custo social da mobilidade

```
tempo_medio_deslocamento_min    tempo médio casa-trabalho em minutos
proporcao_deslocamento_longo    proporção com deslocamento > 1 hora
```

> O tempo médio de deslocamento é variável presente no IVS original do IPEA
> (dimensão Infraestrutura Urbana). Para Hortolândia, com índice de integração
> 0,42, esse indicador tem peso estrutural elevado.

### 3.4 Classificação tipológica

```
tipo_municipio    derivado dos indicadores acima
                  DORMITORIO | EQUILIBRADO | POLO_EMPREGO | INTEGRADO
```

---

## 4. Dado Já Disponível no Projeto

| indicador | valor | ano | fonte |
|-----------|-------|-----|-------|
| saidas_trabalho + saidas_estudo | 58.472 | 2010 | IBGE — Arranjos Populacionais 2016, Tabela 1.1, p. 78 |
| indice_integracao | 0,42 | 2010 | IBGE — Arranjos Populacionais 2016, Tabela 1.1, p. 78 |
| nome_arranjo | Campinas/SP | — | IBGE |
| municipio_desmembrado_apos_1988 | Sim (Sumaré, 1991) | — | IBGE |

> Dado registrado em `arquitetura_dados_IVS_IBGE_Horto_v04.md`, Seção 0.1.

---

## 5. Fontes de Dados

| indicador | fonte primária | disponibilidade |
|-----------|---------------|-----------------|
| saidas_trabalho, indice_integracao | IBGE — Arranjos Populacionais (2016) | ✅ 2010 disponível |
| entradas_trabalho | Censo Demográfico — matriz origem-destino | ⏳ Requer extração |
| taxa_saida_pendular | Calculado a partir do Censo | ⏳ Requer cálculo |
| taxa_entrada_pendular | Calculado a partir do Censo / RAIS municipal | ⏳ Requer cálculo |
| saldo_pendular | Calculado | ⏳ Requer cálculo |
| tempo_medio_deslocamento_min | Censo Demográfico 2022 | ⏳ A verificar |
| tipo_municipio | Derivado dos indicadores acima | ⏳ A calcular |

---

## 6. Uso Analítico — Cruzamento com IVS-H por Núcleo

Quando o IVS-H por núcleo estiver calculado (Produto 3), o cruzamento
com a Dinâmica Metropolitana revela padrões de vulnerabilidade estrutural:

| núcleo | IVS-H | saída pendular | interpretação |
|--------|-------|----------------|---------------|
| alto | alto | alta | vulnerabilidade estrutural metropolitana — depende de mobilidade para sobreviver |
| alto | alto | baixa | vulnerabilidade interna — emprego e infraestrutura locais insuficientes |
| baixo | baixo | alta | integração regional — baixa vulnerabilidade |
| baixo | alto | alta | pressão sobre serviços locais por atração regional |

> Núcleos com **IVS-H alto + alta saída pendular + tempo de deslocamento longo**
> concentram a combinação mais crítica: famílias vulneráveis que dependem
> de transporte intermunicipal para acessar o único emprego disponível.
> Esse é o conceito de **vulnerabilidade estrutural metropolitana**.

---

## 7. Relação com Outros Componentes do Modelo

```
DIM_DINAMICA_METROPOLITANA
  └─ contextualiza: IVS-H (não integra — planos analíticos distintos)
  └─ cruza com:    DIM_NUCLEO (análise por núcleo — Produto 3)
  └─ alimenta:     FATO_INDICADOR (quando valores forem carregados)
  └─ subsidia:     DIM_PROGRAMA (orientação de qualificação profissional)
                   → quais cursos oferecer com base nos setores que
                     absorvem trabalhadores de Hortolândia no arranjo
```

---

## 8. Posição no Roadmap

> Esta dimensão **não é requisito para o MVP (Produto 1)**.
> O dado de 2010 já disponível pode ser carregado como registro histórico a qualquer momento.
> A dimensão completa integra naturalmente o **Produto 3 — IVS-H Consolidado Territorial**.

| etapa | ação | fonte | status |
|-------|------|-------|--------|
| 1 | Registrar dados já disponíveis (saídas e índice 2010) | IBGE Arranjos Populacionais | ✅ Dado disponível |
| 2 | Extrair matriz OD do Censo 2010 para calcular entradas | IBGE Censo 2010 | ⏳ A fazer |
| 3 | Verificar disponibilidade de deslocamento no Censo 2022 | IBGE Censo 2022 | ⏳ A verificar |
| 4 | Calcular indicadores derivados e classificar tipo_municipio | — | ⏳ Após etapa 2 |
| 5 | Cruzar com IVS-H por núcleo | IVS-H + DIM_NUCLEO | ⏳ Produto 3 |

---

## Pendências

| # | pendência | prioridade |
|---|-----------|------------|
| P01 | Extrair matriz origem-destino do Censo 2010 para obter entradas_trabalho | Média |
| P02 | Verificar se Censo 2022 publica quesito de deslocamento por município | Média |
| P03 | Calcular taxa_saida_pendular com dados populacionais do Censo 2010 | Média |
| P04 | Classificar tipo_municipio após P01 e P03 concluídos | Baixa |
| P05 | Cruzar com IVS-H por núcleo quando Produto 3 estiver disponível | Baixa |

---

## Log de Alterações

| versão | data | alterações |
|--------|------|------------|
| v01 | 2026-03-15 | Criação — bloco Dinâmica Metropolitana do Trabalho; 4 indicadores pendulares; tipologia de município (4 tipos); dado IBGE 2010 já disponível registrado; cruzamento com IVS-H por núcleo definido; posição no roadmap (Produto 3) |

---

*Documento de modelagem conceitual — 01_modelagem_conceitual/*  
*Atlas Social de Hortolândia — uso interno*
