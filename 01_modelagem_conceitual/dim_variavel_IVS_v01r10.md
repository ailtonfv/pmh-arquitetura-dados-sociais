[dim_variavel_IVS_v01r10.md](https://github.com/user-attachments/files/26317409/dim_variavel_IVS_v01r10.md)[Uploading dim_va# DIM_VARIAVEL_IVS — Variáveis do Índice de Vulnerabilidade Social

**Versão:** v01r10  
**Data de criação:** "09/03/2026"  
**Última atualização:** "27/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual

---

## Nota Metodológica

Esta dimensão registra as variáveis que compõem o Índice de
Vulnerabilidade Social (IVS), desenvolvido pelo IPEA e publicado no
Atlas da Vulnerabilidade Social nos Municípios Brasileiros (2015),
e suas adaptações locais no IVS-H.

O IVS oficial é adotado como **base metodológica** do projeto.
A partir dele, é construído o **IVS-H (Hortolândia)**, preservando
as mesmas 16 variáveis e as mesmas três dimensões do modelo IPEA.

Sua implementação é progressiva por fases, conforme disponibilidade
de dados:

- **Fase 1 (MVP):** cálculo com as variáveis já disponíveis no CadÚnico,
  utilizando a ponderação original do IVS/IPEA;
- **Fase 2:** incorporação progressiva das demais variáveis, com base
  em IBGE, SIDRA, CAGED, Saúde e Educação;
- **Fase 3:** eventual calibração local de pesos (`peso_h`), após
  validação empírica com dados reais do CadÚnico e Censo 2022.

O IVS-H **não acrescenta nem remove variáveis** do modelo IPEA.
A diferença está na cobertura e na frequência das fontes: onde o IPEA
usa majoritariamente o Censo decenal, o IVS-H combina fontes municipais
contínuas e registros administrativos para calcular o mesmo indicador
com maior frequência e maior detalhamento espacial.

Variáveis locais adicionais (deslocamento para trabalho e estudo)
pertencem ao **IPST-H** (Índice de Pressão Social Territorial de
Hortolândia) — instrumento complementar que mede pressão sobre
o Estado, não vulnerabilidade estrutural da população.

**Princípio adotado:**
> Usar o IVS oficial garante credibilidade científica, comparabilidade
> intermunicipal e legitimidade institucional. A implementação local
> (IVS-H) preserva a base metodológica nacional e avança por fases,
> começando pela ponderação original do IPEA e deixando a calibração
> local para etapa posterior de validação empírica.

**Referências:**
- COSTA, M. A.; MARGUTI, B. O. *Atlas da Vulnerabilidade Social nos
  Municípios Brasileiros*. Brasília: IPEA, 2015.
- FUNARI, A. P. et al. *Atualização do IVS a partir dos dados da PNAD
  Contínua 2022*. Boletim Regional, Urbano e Ambiental, IPEA, 2024.
- IPEA. *Atlas da Vulnerabilidade Social*. ivs.ipea.gov.br
- NARDO, M. et al. *Handbook on Constructing Composite Indicators*.
  Paris: OECD, 2008.

---

## Estrutura da DIM_VARIAVEL_IVS

```
id_variavel
cod_variavel
nome_variavel
descricao
dimensao_ivs          (Infraestrutura Urbana | Capital Humano | Renda e Trabalho)
nivel_analise         (Pessoa | Família/Domicílio | Agregação Espacial)
direcao_risco         (maior_pior | maior_melhor)
peso_ipea             (peso derivado da estrutura hierárquica do IVS: 1/3 por dimensão, distribuído igualmente entre as variáveis de cada dimensão — IU: 1/3 ÷ 3 ≈ 0,111 por variável; CH: 1/3 ÷ 8 ≈ 0,042 por variável; RT: 1/3 ÷ 5 ≈ 0,067 por variável)
peso_h                (peso calibrado IVS-H — a definir com dados reais)
numerador             (definição do numerador da fórmula operacional)
denominador           (definição do denominador da fórmula operacional)
unidade               (proporcao | taxa | percentual | contagem)
universo_referencia   (população de referência para o cálculo)
fonte_dado            (fonte de dado disponível em Hortolândia)
disponivel            (S | N | Parcial)
prazo_obtencao        (Imediato | Curto prazo | Médio prazo | Roadmap)
observacoes
```

> **Nota sobre `nivel_analise`:** o IVS não é medido diretamente na
> escala espacial final. Os indicadores são calculados nas unidades de
> análise pessoa ou domicílio e posteriormente agregados. O valor
> "Agregação Espacial" indica que o resultado é consolidado na
> hierarquia: loteamento → núcleo (CRAS) → região de planejamento (RP).
>
> O campo `nivel_analise` registra, de forma simplificada, tanto
> a unidade de cálculo quanto a escala final de consolidação.
> Essa simplificação será refinada futuramente com a separação
> entre `unidade_calculo` e `unidade_agregacao` (pendência P10).

> **Nota sobre `direcao_risco`:** campo obrigatório para normalização
> correta do índice. Indica se valores maiores da variável representam
> maior vulnerabilidade (maior_pior) ou menor vulnerabilidade
> (maior_melhor). Essencial na etapa de padronização min-max para
> garantir que todas as variáveis apontem na mesma direção antes da
> composição do índice.
>
> **Fórmula de normalização min-max:**
>
> Para variáveis com `direcao_risco = maior_pior`:
> ```
> X_norm = (X - X_min) / (X_max - X_min)
> ```
> Para variáveis com `direcao_risco = maior_melhor`:
> ```
> X_norm = (X_max - X) / (X_max - X_min)
> ```
> Em ambos os casos, X_norm ∈ [0, 1], onde 1 = máxima vulnerabilidade.
>
> **Nota sobre escala antes da normalização:** variáveis expressas em
> escalas diferentes (ex: CH_01 em taxa por 1.000; demais em proporção
> 0–1) devem ser convertidas para escala comparável antes da aplicação
> do min-max. A normalização por si garante comparabilidade final, mas
> a conversão prévia evita distorções nos valores de X_min e X_max.

> **Nota sobre pesos:** o IVS IPEA estrutura os pesos em dois níveis:
> cada dimensão recebe peso igual de 1/3, e dentro de cada dimensão
> o peso é distribuído igualmente entre as variáveis. Isso resulta em
> pesos por variável distintos entre dimensões: IU (~0,111 por variável),
> CH (~0,042 por variável) e RT (~0,067 por variável). O campo `peso_h`
> será preenchido após análise empírica dos dados locais.

> **Nota sobre fórmulas:** os campos `numerador`, `denominador`,
> `unidade` e `universo_referencia` formalizam o cálculo operacional
> de cada variável. São necessários para implementação reproduzível
> e auditável. Detalhes completos por variável nas tabelas abaixo.

---

## Dimensão 1 — Infraestrutura Urbana

*3 variáveis | peso da dimensão no IVS: 1/3 | peso IVS-H hipótese: ~15-20%*

| id | cod | nome da variável | nível | direcao_risco | fonte do dado | disponível | prazo | observações |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| IVS001 | IU_01 | Percentual de pessoas em domicílios com abastecimento de água e esgotamento sanitário inadequados | Família/Domicílio | maior_pior | IBGE Censo 2022 / SAAE Hortolândia | Parcial | Curto prazo | Baixo poder discriminatório municipal (cobertura próxima de 100%) — não elimina poder discriminatório entre loteamentos. Peso local reduzido, mas variável mantida por relevância em loteamentos periféricos. |
| IVS002 | IU_02 | Percentual da população que vive em domicílios urbanos sem serviço de coleta de lixo | Família/Domicílio | maior_pior | IBGE Censo 2022 / Secretaria de Serviços Urbanos | Parcial | Curto prazo | Mesmo raciocínio de IU_01. Baixo poder discriminatório municipal, possível variação entre loteamentos mais recentes ou irregulares. Peso revisável. |
| IVS003 | IU_03 | Percentual de pessoas com renda per capita menor ou igual a meio SM que gastam mais de uma hora em deslocamento para o trabalho | Pessoa | maior_pior | IBGE Censo 2022 / SIDRA | Parcial | Curto prazo | Indicador híbrido (renda + mobilidade) presente no IVS IPEA. Mantido no IVS-H para preservar as 16 variáveis originais e garantir comparabilidade nacional. Dado disponível no Censo 2022 via SIDRA. |

### Fórmulas Operacionais — Infraestrutura Urbana

**IU_01**
- Numerador: pessoas em domicílios sem rede geral de água OU sem rede coletora de esgoto
- Denominador: total de pessoas residentes no loteamento
- Unidade: proporção (0 a 1)
- Universo: população residente total (Censo 2022)

**IU_02**
- Numerador: pessoas em domicílios sem coleta de lixo por serviço municipal ou empresa contratada
- Denominador: total de pessoas residentes no loteamento
- Unidade: proporção (0 a 1)
- Universo: população residente em domicílios particulares (Censo 2022)

**IU_03**
- Numerador: pessoas com renda domiciliar per capita menor ou igual a meio SM e tempo de deslocamento para o trabalho superior a 1 hora
- Denominador: total de pessoas com renda domiciliar per capita menor ou igual a meio SM no loteamento
- Unidade: proporção (0 a 1)
- Universo: população ocupada de baixa renda — Censo 2022 / SIDRA

---

## Dimensão 2 — Capital Humano

*8 variáveis | peso da dimensão no IVS: 1/3 | peso IVS-H hipótese: ~40-45%*

| id | cod | nome da variável | nível | direcao_risco | fonte do dado | disponível | prazo | observações |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| IVS004 | CH_01 | Mortalidade até 1 ano de idade | Pessoa | maior_pior | Secretaria Municipal de Saúde / DATASUS | Parcial | Curto prazo | Disponível no DATASUS. Solicitar série histórica à Saúde Municipal via interlocução intersetorial. |
| IVS005 | CH_02 | Percentual de crianças de 0 a 5 anos que não frequentam a escola | Pessoa | maior_pior | Secretaria de Educação / CadÚnico | Parcial | Curto prazo | CadÚnico registra frequência escolar das crianças do cadastro. Cruzar com matrículas da Educação. |
| IVS006 | CH_03 | Percentual de crianças de 6 a 14 anos que não frequentam a escola | Pessoa | maior_pior | Secretaria de Educação / CadÚnico | Parcial | Curto prazo | Evasão escolar — interface direta com CRAS e Conselho Tutelar. |
| IVS007 | CH_04 | Percentual de mulheres de 10 a 17 anos que tiveram filhos | Pessoa | maior_pior | Secretaria de Saúde (registros de parto) / CadÚnico | Parcial | Médio prazo | Variável relevante porém de disponibilidade menos estável — depende de integração intersetorial e validação com base de saúde. Sujeita a revisão de fonte. Fragilidade metodológica explicitada. |
| IVS008 | CH_05 | Percentual de mães chefes de família, sem fundamental completo e com pelo menos um filho menor de 15 anos | Família/Domicílio | maior_pior | CadÚnico — disponível imediatamente | Sim | Imediato | Disponível no CadÚnico. Operacionalização depende da identificação de responsável familiar (cod_parentesco_rf_pessoa = 1), sexo feminino e presença de filho menor de 15 anos no mesmo cod_familiar_fam. Alta relevância local — peso elevado no IVS-H. |
| IVS009 | CH_06 | Taxa de analfabetismo da população de 15 anos ou mais | Pessoa | maior_pior | CadÚnico — disponível imediatamente / IBGE Censo 2022 | Sim | Imediato | Disponível no CadÚnico. Censo 2022 permite validação e expansão para população fora do cadastro. |
| IVS010 | CH_07 | Percentual de crianças que vivem em domicílios em que nenhum morador tem ensino fundamental completo | Família/Domicílio | maior_pior | CadÚnico — disponível imediatamente | Sim | Imediato | Disponível no CadÚnico. Calculada em nível familiar — exige agregação por cod_familiar_fam antes da marcação individual das crianças. Um dos indicadores mais poderosos para detectar reprodução intergeracional da pobreza. |
| IVS011 | CH_08 | Percentual de pessoas de 15 a 24 anos que não estudam, não trabalham e possuem renda per capita menor ou igual a meio SM | Pessoa | maior_pior | CadÚnico + CAGED | Parcial | Curto prazo | CadÚnico identifica bem a vulnerabilidade, mas não cobre todos os jovens de 15 a 24 anos — jovens fora do cadastro são ponto cego estrutural. CAGED registra apenas vínculo formal. |

### Fórmulas Operacionais — Capital Humano

**CH_01**
- Numerador: óbitos de crianças menores de 1 ano no loteamento
- Denominador: nascidos vivos no loteamento no mesmo período
- Unidade: taxa por 1.000 nascidos vivos
- Universo: nascidos vivos — DATASUS / Secretaria Municipal de Saúde

**CH_02**
- Numerador: crianças de 0 a 5 anos que não frequentam estabelecimento de ensino
- Denominador: total de crianças de 0 a 5 anos no loteamento
- Unidade: proporção (0 a 1)
- Universo: crianças de 0 a 5 anos no CadÚnico / Secretaria de Educação

**CH_03**
- Numerador: crianças de 6 a 14 anos que não frequentam estabelecimento de ensino
- Denominador: total de crianças de 6 a 14 anos no loteamento
- Unidade: proporção (0 a 1)
- Universo: crianças de 6 a 14 anos no CadÚnico / Secretaria de Educação

**CH_04**
- Numerador: mulheres de 10 a 17 anos com pelo menos um filho registrado
- Denominador: total de mulheres de 10 a 17 anos no loteamento
- Unidade: proporção (0 a 1)
- Universo: mulheres de 10 a 17 anos — Secretaria de Saúde / CadÚnico

**CH_05** *(corrigido em v01r9)*

$$CH_{05}(l) = \frac{Fam_{m\tilde{a}e\_resp \,\cap\, sem\_fund \,\cap\, filho<15}(l)}{Fam_{total}(l)} \times 100$$

Onde:
- $Fam_{m\tilde{a}e\_resp \,\cap\, sem\_fund \,\cap\, filho<15}(l)$ = famílias do loteamento $l$ cuja responsável é mulher (cod_parentesco_rf_pessoa = 1, sexo feminino), sem ensino fundamental completo, com pelo menos um filho menor de 15 anos no mesmo cod_familiar_fam
- $Fam_{total}(l)$ = total de famílias do loteamento $l$ na base
- Universo: famílias no CadÚnico

**CH_06**

$$CH_{06}(l) = \frac{Pessoas_{15+\,analfabetas}(l)}{Pessoas_{15+\,total}(l)} \times 100$$

Onde:
- $Pessoas_{15+\,analfabetas}(l)$ = pessoas com 15 anos ou mais que não sabem ler nem escrever no loteamento $l$
- $Pessoas_{15+\,total}(l)$ = total de pessoas com 15 anos ou mais no loteamento $l$
- Universo: população de 15 anos ou mais no CadÚnico / Censo 2022

**CH_07**

$$CH_{07}(l) = \frac{Criancas_{0\text{-}14\,\cap\,dom.\,sem\,fund.}(l)}{Criancas_{0\text{-}14\,total}(l)} \times 100$$

Onde:
- $Criancas_{0\text{-}14\,\cap\,dom.\,sem\,fund.}(l)$ = crianças de 0 a 14 anos residentes em domicílios onde nenhum morador concluiu o ensino fundamental (agregação por cod_familiar_fam obrigatória antes da marcação individual)
- $Criancas_{0\text{-}14\,total}(l)$ = total de crianças de 0 a 14 anos no loteamento $l$
- Universo: crianças residentes no CadÚnico

**CH_08**
- Numerador: jovens de 15 a 24 anos que não estudam, não trabalham formalmente e têm renda per capita menor ou igual a meio SM
- Denominador: total de jovens de 15 a 24 anos no loteamento
- Unidade: proporção (0 a 1)
- Universo: jovens de 15 a 24 anos no CadÚnico (com limitação de cobertura)

---

## Dimensão 3 — Renda e Trabalho

*5 variáveis | peso da dimensão no IVS: 1/3 | peso IVS-H hipótese: ~35-40%*

| id | cod | nome da variável | nível | direcao_risco | fonte do dado | disponível | prazo | observações |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| IVS012 | RT_01 | Proporção de pessoas com renda domiciliar per capita menor ou igual a meio SM | Família/Domicílio | maior_pior | CadÚnico — disponível imediatamente | Sim | Imediato | Disponível no CadÚnico. Ponto de entrada natural do IVS-H. Renda domiciliar per capita por setor censitário não publicada pelo IBGE no Censo 2022 — CadÚnico confirmado como fonte primária. |
| IVS013 | RT_02 | Taxa de desocupação da população de 18 anos ou mais | Pessoa | maior_pior | CadÚnico + CAGED | Parcial | Curto prazo | CadÚnico registra situação ocupacional declarada. CAGED registra vínculo formal. Trabalhadores informais e parte dos MEI não aparecem no CAGED. |
| IVS014 | RT_03 | Percentual de pessoas de 18 anos ou mais sem fundamental completo e em ocupação informal | Pessoa | maior_pior | CadÚnico | Parcial | Curto prazo | Escolaridade disponível no CadÚnico. Informalidade depende de declaração — subestimação provável. Cruzar com CAGED para identificar vínculo formal. |
| IVS015 | RT_04 | Percentual de domicílios com renda per capita menor ou igual a meio SM e com presença de idoso | Família/Domicílio | maior_pior | CadÚnico — disponível imediatamente | Sim | Imediato | Disponível no CadÚnico. Critério operacional definido em 27/03/2026: domicílios com renda per capita ≤ 0,5 SM e presença de pelo menos um morador com 60 anos ou mais. P12 resolvida. |
| IVS016 | RT_05 | Taxa de atividade das pessoas de 10 a 14 anos de idade (trabalho infantil) | Pessoa | maior_pior | CadÚnico / IBGE Censo 2022 | Parcial | Curto prazo | Interface direta com CREAS e Conselho Tutelar. Peso local reduzido (~3%) justificado por: criticidade ética alta, incidência estatística menor, menor capacidade de explicar variação global do índice. Censo 2022 é fonte mais robusta. |

### Fórmulas Operacionais — Renda e Trabalho

**RT_01**

$$RT_{01}(l) = \frac{Pessoas_{rpc \leq 0{,}5SM}(l)}{Pessoas_{total}(l)} \times 100$$

Onde:
- $Pessoas_{rpc \leq 0{,}5SM}(l)$ = pessoas em domicílios com renda per capita menor ou igual a meio salário mínimo no loteamento $l$
- $Pessoas_{total}(l)$ = total de pessoas no loteamento $l$
- Universo: população cadastrada no CadÚnico dez/2025

**RT_02**
- Numerador: pessoas de 18 anos ou mais desocupadas (procurando trabalho sem vínculo)
- Denominador: total de pessoas de 18 anos ou mais no loteamento
- Unidade: proporção (0 a 1)
- Universo: população de 18 anos ou mais no CadÚnico / CAGED

**RT_03**
- Numerador: pessoas de 18 anos ou mais sem ensino fundamental completo em ocupação informal (sem vínculo CAGED)
- Denominador: total de pessoas de 18 anos ou mais ocupadas no loteamento
- Unidade: proporção (0 a 1)
- Universo: população ocupada de 18 anos ou mais no CadÚnico

**RT_04** *(corrigido em v01r9)*

$$RT_{04}(l) = \frac{Dom_{rpc \leq 0{,}5SM \,\cap\, idoso \geq 60}(l)}{Dom_{total}(l)} \times 100$$

Onde:
- $Dom_{rpc \leq 0{,}5SM \,\cap\, idoso \geq 60}(l)$ = domicílios com renda per capita menor ou igual a meio SM e presença de pelo menos um morador com 60 anos ou mais no loteamento $l$
- $Dom_{total}(l)$ = total de domicílios do loteamento $l$ na base
- Universo: domicílios no CadÚnico dez/2025

**RT_05**
- Numerador: pessoas de 10 a 14 anos economicamente ativas (trabalho declarado)
- Denominador: total de pessoas de 10 a 14 anos no loteamento
- Unidade: proporção (0 a 1)
- Universo: crianças de 10 a 14 anos no CadÚnico / Censo 2022

---

## Resumo de Disponibilidade

| Status | Qtd | Variáveis |
| --- | --- | --- |
| Disponível imediato (CadÚnico) | 5 | IVS008, IVS009, IVS010, IVS012, IVS015 |
| Parcial — curto prazo | 10 | IVS001, IVS002, IVS003, IVS004, IVS005, IVS006, IVS011, IVS013, IVS014, IVS016 |
| Parcial — médio prazo | 1 | IVS007 |
| **TOTAL IVS-H** | **16** | — |

> **Implicação para o MVP:** as 5 variáveis imediatamente disponíveis
> no CadÚnico (dez/2025) permitem calcular o **IVS-H Fase 1** como
> primeiro entregável analítico: CH_05, CH_06, CH_07, RT_01, RT_04.
> O modelo converge para as 16 variáveis do IVS/IPEA à medida que
> as fontes forem disponibilizadas, preservando a estrutura original
> do índice.

> **Nota metodológica da Fase 1:** nesta etapa inicial, o cálculo deve
> utilizar a ponderação original do IVS/IPEA, sem calibração local de
> `peso_h`. A recalibração fica reservada para fase posterior.

---

## Resumo das Unidades de Cálculo — Fase 1 MVP

| Variável | Unidade primária | Denominador | Agregação final |
| --- | --- | --- | --- |
| RT_01 | Pessoa | Total de pessoas do loteamento | Loteamento |
| RT_04 | Domicílio/Família | Total de domicílios do loteamento | Loteamento |
| CH_06 | Pessoa | Total de pessoas 15+ do loteamento | Loteamento |
| CH_07 | Criança em contexto domiciliar | Total de crianças 0-14 do loteamento | Loteamento |
| CH_05 | Família | Total de famílias do loteamento | Loteamento |

> Denominadores são sempre a população/domicílios/famílias *observadas
> no CadÚnico*, agregadas por loteamento — não a população censitária.

---

## Fluxo Analítico do IVS-H

1. Dados administrativos coletados nas fontes originais
   (CadÚnico, CAGED, Censo IBGE, SIDRA, Saúde, Educação).

2. Indicadores básicos calculados nas unidades de análise
   pessoa ou domicílio.

3. Resultados agregados por escala espacial:
   **Loteamento → Núcleo (CRAS) → Região de Planejamento.**

4. Normalização min-max aplicada por variável, respeitando
   `direcao_risco` (maior_pior = normalização direta;
   maior_melhor = normalização invertida).

5. Índice IVS-H calculado aplicando os pesos definidos
   em `DIM_VARIAVEL_IVS` sobre os valores normalizados
   registrados em `FATO_VARIAVEL_IVS_LOTEAMENTO`.

---

## Capacidade Analítica do IVS-H

| Escala | Aplicação |
| --- | --- |
| Loteamento | Identificação de bolsões de vulnerabilidade |
| Núcleo CRAS | Planejamento da assistência social |
| Região de Planejamento | Planejamento urbano e de infraestrutura |
| Município | Comparação com IVS nacional |

---

## Mapeamento IVS-H × Camadas do Modelo

| Camada analítica | Variáveis IVS-H cobertas |
| --- | --- |
| Pessoa | IVS003, IVS004, IVS005, IVS006, IVS007, IVS009, IVS011, IVS013, IVS014, IVS016 |
| Família/Domicílio | IVS001, IVS002, IVS008, IVS010, IVS012, IVS015 |
| Agregação Espacial | Todas — o IVS-H é calculado por loteamento e agregado por Núcleo e RP |

---

## Mapeamento IVS-H × Programas Municipais

| Dimensão IVS | Exemplos de programas de Hortolândia | Campo `dimensao_ivs` |
| --- | --- | --- |
| Infraestrutura Urbana | Agora a Casa é Sua, PHLIS, MCMV, Serviços Urbanos | `infraestrutura_urbana` |
| Capital Humano | Programa Cuidar, Bolsa Creche, SCFV, Enfrentamento Trabalho Infantil | `capital_humano` |
| Renda e Trabalho | PAT, Banco do Povo, Bolsa Família, BPC, DECOLA, Emprega Hortolândia | `renda_trabalho` |
| Multidimensional | PAIF, PAEFI, Ressignifica Hortolândia, CRAS/CREAS | `multidimensional` |

---

## IVS-H — Hipótese de Calibração Local (Fase posterior)

| Dimensão | Peso IPEA | Peso IVS-H (hipótese) | Justificativa |
| --- | --- | --- | --- |
| Infraestrutura Urbana | 33% | ~15-20% | Cobertura de água e coleta de lixo elevadas — baixo poder discriminatório municipal, possível variação entre loteamentos periféricos |
| Capital Humano | 33% | ~40-45% | Reprodução intergeracional da pobreza é o desafio central |
| Renda e Trabalho | 33% | ~35-40% | Tensão entre polo de emprego formal e 72.424 famílias no CadÚnico |

> Estes pesos são hipótese para Fase 2. Na Fase 1 (MVP), o IVS-H
> utiliza a ponderação original do IVS/IPEA. A calibração local será
> feita após validação empírica com dados reais do CadÚnico dez/2025
> e Censo 2022. A metodologia seguirá as diretrizes da OCDE
> (NARDO et al., OECD, 2008).

---

## Pendências

| # | Pendência | Prioridade |
| --- | --- | --- |
| P01 | Solicitar dados de mortalidade infantil à Secretaria de Saúde (CH_01) | Alta |
| P02 | Solicitar dados de matrícula e evasão escolar à Secretaria de Educação (CH_02, CH_03) | Alta |
| P03 | Extrair IU_03 do SIDRA/IBGE Censo 2022 — tabela de deslocamento intermunicipal | Alta |
| P04 | Calcular IVS-H Fase 1 com as 5 variáveis CadÚnico dez/2025 | Alta |
| P05 | Levantar dados do IBGE Censo 2022 por setor censitário para Hortolândia | Alta |
| P06 | Confirmar cobertura de saneamento com SAAE (IU_01) | Média |
| P07 | Definir metodologia formal de calibração dos pesos IVS-H (Fase 2) | Média |
| P08 | Cruzar variáveis IVS com loteamentos para cálculo por escala espacial | Alta |
| P09 | Formalizar convenção de `periodo_referencia` nos scripts de carga | Média |
| P10 | Separar `nivel_analise` em `unidade_calculo` e `unidade_agregacao` (melhoria futura) | Baixa |
| P11 | Registrar explicitamente, nos scripts e notebooks da Fase 1, o uso da ponderação original do IVS/IPEA (sem calibração local de peso_h) | Alta |
| P12 | ~~Formalizar regra operacional de "dependência de idosos" para RT_04~~ | ✅ Resolvida em 27/03/2026 — critério: domicílios com renda ≤ 0,5 SM e presença de pelo menos um morador com 60 anos ou mais |

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "09/03/2026" | Criação |
| v01r | "09/03/2026" | Substituída entidade Território pela hierarquia Loteamento / RP / Núcleo |
| v01r2 | "09/03/2026" | Substituída referência Modelo RAJIS; número CadÚnico padronizado; ACERTE removido |
| v01r3 | "11/03/2026" | Correções de disponibilidade; IVS003 como indicador híbrido; Fluxo Analítico adicionado |
| v01r4 | "13/03/2026" | RT_01: CadÚnico confirmado como fonte primária |
| v01r5 | "18/03/2026" | IU_03 removida (incorretamente); RT_06/RT_07 criadas; direcao_risco adicionado; fórmulas operacionais |
| v01r6 | "22/03/2026" | IU_03 restaurada; RT_06/RT_07 removidas (pertencem ao IPST-H); total = 16 variáveis |
| v01r7 | "22/03/2026" | peso_ipea corrigido para estrutura hierárquica; fórmulas min-max formalizadas; nota de escala CH_01; P10 adicionada |
| v01r8 | "23/03/2026" | (1) Nota Metodológica reescrita: estrutura explícita Fase 1 / Fase 2 / Fase 3; (2) Princípio adotado alinhado à implementação progressiva; (3) "Agregação Territorial" → "Agregação Espacial"; (4) nota nivel_analise expandida; (5) RT_04: observação com honestidade metodológica; (6) CH_05 e CH_07: notas operacionais explicitadas; (7) Resumo de Disponibilidade com nota Fase 1; (8) título calibração: "Hipótese de Calibração Local (Fase posterior)"; (9) P11 e P12 adicionadas |
| v01r9 | "27/03/2026" | Duas correções cirúrgicas a partir da formalização das fórmulas MVP (insights.docx, 27/03/2026): (1) **RT_04**: unidade corrigida de Pessoa para Domicílio/Família; numerador corrigido de "pessoas em domicílios onde o principal provedor é idoso" para "domicílios com renda ≤ 0,5 SM e presença de pelo menos um morador com 60+"; denominador corrigido de "total de pessoas" para "total de domicílios do loteamento"; P12 marcada como resolvida. (2) **CH_05**: denominador corrigido de "total de mulheres chefes de família" para "total de famílias do loteamento" — alinhamento com metodologia IPEA. Seção "Resumo das Unidades de Cálculo — Fase 1 MVP" adicionada. |
| v01r10 | "27/03/2026" | Fórmulas das 5 variáveis do MVP (RT_01, RT_04, CH_05, CH_06, CH_07) reescritas em notação LaTeX com subscritos, intersecções e denominadores explícitos. Demais fórmulas (variáveis Fase 2) mantidas em formato descritivo — LaTeX reservado para as variáveis operacionalmente ativas no MVP. |

---

*Documento de modelagem conceitual — 01_modelagem_conceitual.*  
*Uso interno — Atlas Social de Hortolândia.*
riavel_IVS_v01r10.md…]()
