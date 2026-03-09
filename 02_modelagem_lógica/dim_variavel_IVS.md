# DIM_VARIAVEL_IVS — Variáveis do Índice de Vulnerabilidade Social
**Versão:** v01  
**Data de criação:** 09/03/2026  
**Responsável:** Ailton Vendramini / Claude (Anthropic)  
**Repositório:** pmh-arquitetura-dados-sociais / 02_modelagem_lógica

---

## Nota Metodológica

Esta dimensão registra as 16 variáveis que compõem o Índice de
Vulnerabilidade Social (IVS), desenvolvido pelo IPEA e publicado no
Atlas da Vulnerabilidade Social nos Municípios Brasileiros (2015).

O IVS oficial é adotado como **base metodológica** do projeto.
A partir dele, será construído o **IVS-H (Hortolândia)** — mesmas
variáveis, mesmas dimensões, com pesos calibrados à realidade local.

**Princípio adotado:**
> Usar o IVS oficial garante credibilidade científica, comparabilidade
> intermunicipal e legitimidade institucional. A calibração local
> (IVS-H) preserva a base e ajusta os pesos conforme evidências
> empíricas do território.

**Referências:**
- COSTA, M. A.; MARGUTI, B. O. *Atlas da Vulnerabilidade Social nos
  Municípios Brasileiros*. Brasília: IPEA, 2015.
- FUNARI, A. P. et al. *Atualização do IVS a partir dos dados da PNAD
  Contínua 2022*. Boletim Regional, Urbano e Ambiental, IPEA, 2024.
- IPEA. *Atlas da Vulnerabilidade Social*. ivs.ipea.gov.br

---

## Estrutura da DIM_VARIAVEL_IVS

```
id_variavel
cod_variavel
nome_variavel
descricao
dimensao_ivs          (Infraestrutura Urbana | Capital Humano | Renda e Trabalho)
nivel_analise         (Pessoa | Família/Domicílio | Território)
peso_ipea             (igual para todas = 1/16 ≈ 0,0625 — peso uniforme original)
peso_h                (peso calibrado IVS-H — a definir com dados reais)
fonte_municipal       (fonte de dado disponível em Hortolândia)
disponivel            (S | N | Parcial)
prazo_obtencao        (Imediato | Curto prazo | Médio prazo | Roadmap)
observacoes
```

**Nota sobre pesos:**
O IVS IPEA atribui peso uniforme a todas as variáveis dentro de cada
dimensão, e peso igual às três dimensões (1/3 cada). O campo `peso_h`
será preenchido após análise empírica dos dados locais — inicialmente
replicará o peso IPEA.

---

## Dimensão 1 — Infraestrutura Urbana
*3 variáveis | peso da dimensão no IVS: 1/3*

| id | cod | nome da variável | nível | fonte municipal | disponível | prazo | observações |
|----|-----|-----------------|-------|----------------|------------|-------|-------------|
| IVS001 | IU_01 | Percentual de pessoas em domicílios com abastecimento de água e esgotamento sanitário inadequados | Família/Domicílio | IBGE Censo 2022 / SAAE Hortolândia | Parcial | Curto prazo | Cobertura de água em Hortolândia é razoável — variável pode ter baixo poder discriminatório local. Confirmar com SAAE. |
| IVS002 | IU_02 | Percentual da população que vive em domicílios urbanos sem serviço de coleta de lixo | Família/Domicílio | IBGE Censo 2022 / Secretaria de Serviços Urbanos | Parcial | Curto prazo | Cobertura de coleta também elevada — mesmo raciocínio da IU_01. Peso local pode ser reduzido no IVS-H. |
| IVS003 | IU_03 | Percentual de pessoas em domicílios com renda per capita inferior a ½ SM e que gastam mais de 1 hora até o trabalho | Pessoa | CadÚnico (renda) + IBGE Censo 2022 (tempo de deslocamento) | Parcial | Médio prazo | Renda disponível no CadÚnico. Tempo de deslocamento requer Censo 2022 ou pesquisa local. Hortolândia tem polo de emprego próprio — variável estratégica. |

---

## Dimensão 2 — Capital Humano
*8 variáveis | peso da dimensão no IVS: 1/3*

| id | cod | nome da variável | nível | fonte municipal | disponível | prazo | observações |
|----|-----|-----------------|-------|----------------|------------|-------|-------------|
| IVS004 | CH_01 | Mortalidade até 1 ano de idade | Pessoa | Secretaria Municipal de Saúde / DATASUS | Parcial | Curto prazo | Dado disponível no DATASUS. Secretaria de Saúde pode fornecer série histórica local. Solicitar via interlocução intersetorial. |
| IVS005 | CH_02 | Percentual de crianças de 0 a 5 anos que não frequentam a escola | Pessoa | Secretaria de Educação / CadÚnico | Parcial | Curto prazo | CadÚnico registra frequência escolar das crianças do cadastro. Secretaria de Educação tem dados de matrícula. Cruzamento possível. |
| IVS006 | CH_03 | Percentual de crianças de 6 a 14 anos que não frequentam a escola | Pessoa | Secretaria de Educação / CadÚnico | Parcial | Curto prazo | Idem CH_02. Evasão escolar é dado estratégico — interface direta com CRAS e Conselho Tutelar. |
| IVS007 | CH_04 | Percentual de mulheres de 10 a 17 anos que tiveram filhos | Pessoa | Secretaria de Saúde (registros de parto) / CadÚnico | Parcial | Médio prazo | CadÚnico registra composição familiar e idade dos membros. Dado de parto adolescente disponível na Saúde. |
| IVS008 | CH_05 | Percentual de mães chefes de família, sem fundamental completo e com pelo menos um filho menor de 15 anos | Família/Domicílio | CadÚnico | ✅ Sim | Imediato | **Totalmente disponível no CadÚnico** — escolaridade, composição familiar, chefe de família e idade dos filhos são campos padrão do cadastro. Indicador de alta relevância para Hortolândia. |
| IVS009 | CH_06 | Taxa de analfabetismo da população de 15 anos ou mais | Pessoa | CadÚnico / IBGE Censo 2022 | ✅ Sim | Imediato | **Disponível no CadÚnico** — escolaridade é campo obrigatório. Censo 2022 permite validação e expansão para população fora do cadastro. |
| IVS010 | CH_07 | Percentual de crianças que vivem em domicílios em que nenhum morador tem ensino fundamental completo | Família/Domicílio | CadÚnico | ✅ Sim | Imediato | **Totalmente disponível no CadÚnico** — escolaridade de todos os membros + composição por faixa etária. Um dos indicadores mais poderosos para detectar reprodução intergeracional da pobreza. |
| IVS011 | CH_08 | Percentual de pessoas de 15 a 24 anos que não estudam, não trabalham e possuem renda per capita ≤ ½ SM | Pessoa | CadÚnico + CAGED | Parcial | Curto prazo | CadÚnico fornece renda e situação de estudo. Vínculo formal via CAGED. Jovens fora do CadÚnico são ponto cego. Indicador estratégico — captura "geração nem-nem" no território. |

---

## Dimensão 3 — Renda e Trabalho
*5 variáveis | peso da dimensão no IVS: 1/3*

| id | cod | nome da variável | nível | fonte municipal | disponível | prazo | observações |
|----|-----|-----------------|-------|----------------|------------|-------|-------------|
| IVS012 | RT_01 | Proporção de pessoas com renda domiciliar per capita ≤ ½ SM | Família/Domicílio | CadÚnico | ✅ Sim | Imediato | **Totalmente disponível no CadÚnico** — renda per capita é campo central do cadastro. Ponto de entrada natural para o IVS-H. |
| IVS013 | RT_02 | Taxa de desocupação da população de 18 anos ou mais | Pessoa | CadÚnico + CAGED | Parcial | Curto prazo | CadÚnico registra situação ocupacional declarada. CAGED fornece vínculo formal. Informalidade é ponto cego estrutural — MEI não aparece no CAGED. |
| IVS014 | RT_03 | Percentual de pessoas de 18 anos ou mais sem fundamental completo e em ocupação informal | Pessoa | CadÚnico | Parcial | Curto prazo | Escolaridade disponível no CadÚnico. Informalidade depende de declaração — subestimação provável. Cruzamento com CAGED identifica quem tem vínculo formal. |
| IVS015 | RT_04 | Percentual de pessoas em domicílios com renda per capita ≤ ½ SM e dependentes de idosos | Família/Domicílio | CadÚnico | ✅ Sim | Imediato | **Totalmente disponível no CadÚnico** — renda per capita + composição familiar por faixa etária. Captura fragilidade da renda do idoso como sustentáculo familiar. |
| IVS016 | RT_05 | Taxa de atividade das pessoas de 10 a 14 anos de idade | Pessoa | CadÚnico / IBGE Censo 2022 | Parcial | Curto prazo | Trabalho infantil — CadÚnico pode capturar via declaração de ocupação de crianças. Censo 2022 é fonte mais robusta. Interface direta com CREAS e Conselho Tutelar. |

---

## Resumo de Disponibilidade

| Status | Qtd | Variáveis |
|--------|-----|-----------|
| ✅ Disponível imediato (CadÚnico) | 5 | IVS008, IVS009, IVS010, IVS012, IVS015 |
| ⏳ Parcial — curto prazo | 8 | IVS001, IVS002, IVS004, IVS005, IVS006, IVS011, IVS013, IVS014, IVS016 |
| ⏳ Parcial — médio prazo | 3 | IVS003, IVS007 |
| **TOTAL** | **16** | — |

> **Implicação para o MVP:** as 5 variáveis imediatamente disponíveis
> no CadÚnico (dez/2025) já permitem calcular um **IVS-H parcial**
> com cobertura da população cadastrada. Esse subíndice pode ser o
> primeiro entregável analítico do projeto antes da integração
> intersetorial.

---

## Mapeamento IVS × Camadas do Modelo RAJIS

| Camada analítica | Variáveis IVS cobertas |
|-----------------|----------------------|
| **Pessoa** | IVS003, IVS004, IVS005, IVS006, IVS007, IVS009, IVS011, IVS013, IVS014, IVS016 |
| **Família/Domicílio** | IVS001, IVS002, IVS008, IVS010, IVS012, IVS015 |
| **Território** | Todas — o IVS é calculado por setor censitário/loteamento |

---

## Mapeamento IVS × Programas Municipais

| Dimensão IVS | Exemplos de programas de Hortolândia | Campo `dimensao_ivs` |
|-------------|-------------------------------------|----------------------|
| Infraestrutura Urbana | Agora a Casa é Sua, PHLIS, MCMV, Serviços Urbanos | `infraestrutura_urbana` |
| Capital Humano | Programa Cuidar, Bolsa Creche, SCFV, Enfrentamento Trabalho Infantil | `capital_humano` |
| Renda e Trabalho | ACERTE, PAT, Banco do Povo, Bolsa Família, BPC, DECOLA | `renda_trabalho` |
| Multidimensional | PAIF, PAEFI, Ressignifica Hortolândia, CRAS/CREAS | `multidimensional` |

> Cross-reference completo: campo `dimensao_ivs` no DIM_PROGRAMA v09
> (a gerar).

---

## IVS-H — Calibração Local (em construção)

### Hipótese inicial de calibração

Com base nas características conhecidas de Hortolândia
(infraestrutura urbana relativamente desenvolvida; polo de emprego
formal expressivo com 49.100 empregos formais e remuneração média
de R$ 4.700; 73.000 pessoas no CadÚnico):

| Dimensão | Peso IPEA | Peso IVS-H (hipótese) | Justificativa |
|----------|-----------|----------------------|---------------|
| Infraestrutura Urbana | 33% | ~15–20% | Cobertura de água e coleta de lixo elevadas — baixo poder discriminatório local |
| Capital Humano | 33% | ~40–45% | Reprodução intergeracional da pobreza é o desafio central — mães chefes, analfabetismo, crianças fora da escola |
| Renda e Trabalho | 33% | ~35–40% | Tensão entre polo de emprego formal e 73.000 no CadÚnico — desemprego e informalidade são determinantes |

> ⚠️ **Estes pesos são hipótese inicial.** A calibração definitiva
> do IVS-H será feita com base nos dados reais do CadÚnico dez/2025
> e validada com os dados do Censo 2022. A metodologia de calibração
> seguirá as diretrizes da OCDE para construção de índices compostos
> (OECD Handbook on Constructing Composite Indicators, 2008).

---

## Pendências

| # | pendência | prioridade |
|---|-----------|------------|
| P01 | Solicitar dados de mortalidade infantil à Secretaria de Saúde (IVS004) | Alta |
| P02 | Solicitar dados de matrícula e evasão escolar à Secretaria de Educação (IVS005, IVS006) | Alta |
| P03 | Levantar dados do IBGE Censo 2022 por setor censitário para Hortolândia | Alta |
| P04 | Confirmar cobertura de saneamento com SAAE (IVS001) | Média |
| P05 | Calcular subíndice IVS-H parcial com as 5 variáveis disponíveis no CadÚnico dez/2025 | Alta |
| P06 | Definir metodologia formal de calibração dos pesos IVS-H | Média |
| P07 | Publicar metodologia IVS-H no repositório como documento auditável | Média |
| P08 | Cruzar variáveis IVS com loteamentos para cálculo territorial | Alta |

---

## Log de Alterações

| Versão | Data | Alterações |
|--------|------|------------|
| v01 | 09/03/2026 | Criação — 16 variáveis IVS mapeadas; disponibilidade por fonte municipal; calibração IVS-H inicial; mapeamento por camada analítica e por programa |

---

*Documento de modelagem conceitual — primeiro arquivo de
02_modelagem_lógica. Uso interno do Projeto Atlas Social de Hortolândia.*
