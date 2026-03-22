# DIM_VARIAVEL_IVS — Variáveis do Índice de Vulnerabilidade Social

**Versão:** v01r6  
**Data de criação:** "09/03/2026"  
**Última atualização:** "22/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual

---

## Nota Metodológica

Esta dimensão registra as variáveis que compõem o Índice de
Vulnerabilidade Social (IVS), desenvolvido pelo IPEA e publicado no
Atlas da Vulnerabilidade Social nos Municípios Brasileiros (2015),
e suas adaptações locais no IVS-H.

O IVS oficial é adotado como **base metodológica** do projeto.
A partir dele, é construído o **IVS-H (Hortolândia)** — mesmas
16 variáveis, mesmas três dimensões, pesos calibrados à realidade
local e construção progressiva por fases conforme disponibilidade
de dados.

O IVS-H **não acrescenta nem remove variáveis** do modelo IPEA.
A diferença está na cobertura de dados: onde o IPEA usa Censo
decenal, o IVS-H usa fontes municipais contínuas (CadÚnico,
registros administrativos) para calcular o mesmo indicador com
maior frequência e granularidade territorial.

Variáveis locais adicionais (deslocamento para trabalho e estudo)
pertencem ao **IPST-H** (Índice de Pressão Social Territorial de
Hortolândia) — instrumento complementar que mede pressão sobre
o Estado, não vulnerabilidade estrutural da população.

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
nivel_analise         (Pessoa | Família/Domicílio | Agregação Territorial)
direcao_risco         (maior_pior | maior_melhor)
peso_ipea             (igual para todas = 1/16 aprox. 0,0625 — peso uniforme original)
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

> **Nota sobre `nivel_analise`:** o IVS não é medido diretamente no
> território. Os indicadores são calculados nas unidades de análise
> pessoa ou domicílio e posteriormente agregados. O valor
> "Agregação Territorial" indica que o resultado é consolidado na
> hierarquia: loteamento → núcleo (CRAS) → região de planejamento (RP).

> **Nota sobre `direcao_risco`:** campo obrigatório para normalização
> correta do índice. Indica se valores maiores da variável representam
> maior vulnerabilidade (maior_pior) ou menor vulnerabilidade
> (maior_melhor). Essencial na etapa de padronização min-max para
> garantir que todas as variáveis apontem na mesma direção antes da
> composição do índice.

> **Nota sobre pesos:** o IVS IPEA atribui peso uniforme a todas as
> variáveis dentro de cada dimensão, e peso igual às três dimensões
> (1/3 cada). O campo `peso_h` será preenchido após análise empírica
> dos dados locais — inicialmente replicará o peso IPEA.

> **Nota sobre fórmulas:** os campos `numerador`, `denominador`,
> `unidade` e `universo_referencia` formalizam o cálculo operacional
> de cada variável. São necessários para implementação reproduzível
> e auditável. Detalhes completos por variável nas tabelas abaixo.

---

## Dimensão 1 — Infraestrutura Urbana

*3 variáveis | peso da dimensão no IVS: 1/3 | peso IVS-H hipótese: ~15-20%*

| id | cod | nome da variável | nível | direcao_risco | fonte do dado | disponível | prazo | observações |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| IVS001 | IU_01 | Percentual de pessoas em domicílios com abastecimento de água e esgotamento sanitário inadequados | Família/Domicílio | maior_pior | IBGE Censo 2022 / SAAE Hortolândia | Parcial | Curto prazo | Baixo poder discriminatório municipal (cobertura próxima de 100%) — não elimina poder discriminatório territorial entre loteamentos. Peso local reduzido, mas variável mantida por relevância em loteamentos periféricos. |
| IVS002 | IU_02 | Percentual da população que vive em domicílios urbanos sem serviço de coleta de lixo | Família/Domicílio | maior_pior | IBGE Censo 2022 / Secretaria de Serviços Urbanos | Parcial | Curto prazo | Mesmo raciocínio de IU_01. Baixo poder discriminatório municipal, possível variação territorial em loteamentos mais recentes ou irregulares. Peso revisável. |
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
| IVS007 | CH_04 | Percentual de mulheres de 10 a 17 anos que tiveram filhos | Pessoa | maior_pior | Secretaria de Saúde (registros de parto) / CadÚnico | Parcial | Médio prazo | Variável relevante porém de disponibilidade menos estável — depende de integração intersetorial e validação com base de saúde. Sujeita a revisão de fonte. Manter com observação explícita de fragilidade metodológica. |
| IVS008 | CH_05 | Percentual de mães chefes de família, sem fundamental completo e com pelo menos um filho menor de 15 anos | Família/Domicílio | maior_pior | CadÚnico — disponível imediatamente | Sim | Imediato | Totalmente disponível no CadÚnico. Escolaridade, composição familiar, chefe de família e idade dos filhos são campos padrão do cadastro. Alta relevância local — peso elevado no IVS-H. |
| IVS009 | CH_06 | Taxa de analfabetismo da população de 15 anos ou mais | Pessoa | maior_pior | CadÚnico — disponível imediatamente / IBGE Censo 2022 | Sim | Imediato | Disponível no CadÚnico. Censo 2022 permite validação e expansão para população fora do cadastro. |
| IVS010 | CH_07 | Percentual de crianças que vivem em domicílios em que nenhum morador tem ensino fundamental completo | Família/Domicílio | maior_pior | CadÚnico — disponível imediatamente | Sim | Imediato | Totalmente disponível no CadÚnico. Um dos indicadores mais poderosos para detectar reprodução intergeracional da pobreza. |
| IVS011 | CH_08 | Percentual de pessoas de 15 a 24 anos que não estudam, não trabalham e possuem renda per capita menor ou igual a meio SM | Pessoa | maior_pior | CadÚnico + CAGED | Parcial | Curto prazo | CadÚnico identifica bem a vulnerabilidade, mas não cobre todos os jovens de 15 a 24 anos do município — jovens fora do cadastro são ponto cego estrutural. CAGED registra apenas vínculo formal. Indicador estratégico para captura da geração nem-nem por loteamento. |

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

**CH_05**
- Numerador: mulheres chefes de família, sem ensino fundamental completo, com pelo menos um filho menor de 15 anos
- Denominador: total de mulheres chefes de família no loteamento
- Unidade: proporção (0 a 1)
- Universo: mulheres chefes de família no CadÚnico

**CH_06**
- Numerador: pessoas de 15 anos ou mais que não sabem ler nem escrever
- Denominador: total de pessoas de 15 anos ou mais no loteamento
- Unidade: proporção (0 a 1)
- Universo: população de 15 anos ou mais no CadÚnico / Censo 2022

**CH_07**
- Numerador: crianças que residem em domicílios onde nenhum morador concluiu o ensino fundamental
- Denominador: total de crianças no loteamento
- Unidade: proporção (0 a 1)
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
| IVS012 | RT_01 | Proporção de pessoas com renda domiciliar per capita menor ou igual a meio SM | Família/Domicílio | maior_pior | CadÚnico — disponível imediatamente | Sim | Imediato | Totalmente disponível no CadÚnico. Ponto de entrada natural do IVS-H. Renda domiciliar per capita por setor censitário não publicada pelo IBGE no Censo 2022 — CadÚnico confirmado como fonte primária. |
| IVS013 | RT_02 | Taxa de desocupação da população de 18 anos ou mais | Pessoa | maior_pior | CadÚnico + CAGED | Parcial | Curto prazo | CadÚnico registra situação ocupacional declarada. CAGED registra vínculo formal. Trabalhadores informais e parte dos MEI não aparecem no CAGED. |
| IVS014 | RT_03 | Percentual de pessoas de 18 anos ou mais sem fundamental completo e em ocupação informal | Pessoa | maior_pior | CadÚnico | Parcial | Curto prazo | Escolaridade disponível no CadÚnico. Informalidade depende de declaração — subestimação provável. Cruzar com CAGED para identificar vínculo formal. |
| IVS015 | RT_04 | Percentual de pessoas em domicílios com renda per capita menor ou igual a meio SM e dependentes de idosos | Família/Domicílio | maior_pior | CadÚnico — disponível imediatamente | Sim | Imediato | Totalmente disponível no CadÚnico. Captura fragilidade da renda do idoso como sustentáculo familiar. |
| IVS016 | RT_05 | Taxa de atividade das pessoas de 10 a 14 anos de idade (trabalho infantil) | Pessoa | maior_pior | CadÚnico / IBGE Censo 2022 | Parcial | Curto prazo | Interface direta com CREAS e Conselho Tutelar. Peso local reduzido (~3%) justificado por: criticidade ética alta, incidência estatística menor, menor capacidade de explicar variação global do índice. Censo 2022 é fonte mais robusta. |

### Fórmulas Operacionais — Renda e Trabalho

**RT_01**
- Numerador: pessoas em domicílios com renda per capita menor ou igual a meio salário mínimo
- Denominador: total de pessoas no loteamento
- Unidade: proporção (0 a 1)
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

**RT_04**
- Numerador: pessoas em domicílios com renda per capita menor ou igual a meio SM onde o principal provedor é idoso (60 anos ou mais)
- Denominador: total de pessoas no loteamento
- Unidade: proporção (0 a 1)
- Universo: população total no CadÚnico dez/2025

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

---

## Fluxo Analítico do IVS-H

1. Dados administrativos coletados nas fontes originais
   (CadÚnico, CAGED, Censo IBGE, SIDRA, Saúde, Educação).

2. Indicadores básicos calculados nas unidades de análise
   pessoa ou domicílio.

3. Resultados agregados para a escala territorial:
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
| Região de Planejamento | Planejamento urbano e territorial |
| Município | Comparação com IVS nacional |

---

## Mapeamento IVS-H × Camadas do Modelo

| Camada analítica | Variáveis IVS-H cobertas |
| --- | --- |
| Pessoa | IVS003, IVS004, IVS005, IVS006, IVS007, IVS009, IVS011, IVS013, IVS014, IVS016 |
| Família/Domicílio | IVS001, IVS002, IVS008, IVS010, IVS012, IVS015 |
| Agregação Territorial | Todas — o IVS-H é calculado por loteamento e agregado por Núcleo e RP |

---

## Mapeamento IVS-H × Programas Municipais

| Dimensão IVS | Exemplos de programas de Hortolândia | Campo `dimensao_ivs` |
| --- | --- | --- |
| Infraestrutura Urbana | Agora a Casa é Sua, PHLIS, MCMV, Serviços Urbanos | `infraestrutura_urbana` |
| Capital Humano | Programa Cuidar, Bolsa Creche, SCFV, Enfrentamento Trabalho Infantil | `capital_humano` |
| Renda e Trabalho | PAT, Banco do Povo, Bolsa Família, BPC, DECOLA, Emprega Hortolândia | `renda_trabalho` |
| Multidimensional | PAIF, PAEFI, Ressignifica Hortolândia, CRAS/CREAS | `multidimensional` |

---

## IVS-H — Calibração Local (em construção)

| Dimensão | Peso IPEA | Peso IVS-H (hipótese) | Justificativa |
| --- | --- | --- | --- |
| Infraestrutura Urbana | 33% | ~15-20% | Cobertura de água e coleta de lixo elevadas — baixo poder discriminatório municipal, possível variação territorial em loteamentos periféricos |
| Capital Humano | 33% | ~40-45% | Reprodução intergeracional da pobreza é o desafio central |
| Renda e Trabalho | 33% | ~35-40% | Tensão entre polo de emprego formal e 72.424 famílias no CadÚnico |

> Estes pesos são hipótese inicial. A calibração definitiva do IVS-H
> será feita com base nos dados reais do CadÚnico dez/2025 e validada
> com os dados do Censo 2022 e SIDRA. A metodologia seguirá as
> diretrizes da OCDE (NARDO et al., OECD, 2008).

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
| P07 | Definir metodologia formal de calibração dos pesos IVS-H | Média |
| P08 | Cruzar variáveis IVS com loteamentos para cálculo territorial | Alta |
| P09 | Formalizar convenção de `periodo_referencia` nos scripts de carga | Média |

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "09/03/2026" | Criação — 16 variáveis IVS mapeadas; disponibilidade por fonte municipal; calibração IVS-H inicial; mapeamento por camada analítica e por programa |
| v01r | "09/03/2026" | Revisão — substituída entidade Território pela hierarquia Loteamento / RP / Núcleo |
| v01r2 | "09/03/2026" | Revisão — substituída referência Modelo RAJIS por Atlas Social de Hortolândia; número CadÚnico padronizado para 72.424; ACERTE removido do mapeamento; datas em ISO 8601 |
| v01r3 | "11/03/2026" | Correção: curto prazo 8 para 9 variáveis; médio prazo 3 para 2; IVS003 caracterizado como indicador híbrido; nivel_analise Agregação Territorial com nota; fonte_municipal para fonte_dado; Fluxo Analítico adicionado; quadro Capacidade Analítica adicionado; referência Nardo et al. (OECD, 2008) |
| v01r4 | "13/03/2026" | RT_01 (IVS012): confirmação empírica — renda domiciliar per capita por setor censitário não publicada pelo IBGE no Censo 2022; CadÚnico confirmado como fonte primária de RT_01 |
| v01r5 | "18/03/2026" | IU_03 removida da dimensão IU com nota de migração. RT_06 (IVS_L01) e RT_07 (IVS_L02) criadas como variáveis locais em Renda e Trabalho. Campo direcao_risco adicionado. Fórmulas operacionais adicionadas para todas as 17 variáveis. |
| v01r6 | "22/03/2026" | Decisão arquitetural definitiva: IVS-H preserva exatamente as 16 variáveis do IVS/IPEA. IU_03 restaurada na dimensão Infraestrutura Urbana. RT_06 e RT_07 removidas do IVS-H — pertencem ao IPST-H (eixo Pressão Territorial, PT_05 e PT_06). Nota Metodológica reescrita para refletir o princípio de não acréscimo/remoção de variáveis. Resumo de disponibilidade corrigido: total = 16. Dimensão RT: 5 variáveis (não 7). Dimensão IU: 3 variáveis (não 2). |

---

*Documento de modelagem conceitual — 01_modelagem_conceitual.*  
*Uso interno — Atlas Social de Hortolândia.*

[dim_variavel_IVS_v01r6.md](https://github.com/user-attachments/files/26167021/dim_variavel_IVS_v01r6.md)
