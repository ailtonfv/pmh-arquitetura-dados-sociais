[palestra_marco_2026_v05.md](https://github.com/user-attachments/files/26085145/palestra_marco_2026_v05.md)
# Palestra — Março de 2026
## Vulnerabilidade Social e Integração de Políticas Públicas em Hortolândia

**Arquivo:** `00_governanca/palestra_marco_2026.md`  
**Versão:** v05  
**Data:** "18/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia

---

## Contexto e Finalidade

Este documento registra a estrutura narrativa e o argumento institucional
da palestra proposta para março de 2026, destinada a apresentar o projeto
Atlas Social de Hortolândia ao prefeito e às secretarias municipais.

A palestra tem dois objetivos simultâneos:

1. **Técnico** — apresentar o IVS como metodologia de diagnóstico territorial
2. **Institucional** — propor o IVS-H como instrumento de coordenação
   intersecretarial e eixo de planejamento municipal

> **Argumento central:**
> Nenhuma secretaria sozinha consegue reduzir a vulnerabilidade social.
> O IVS municipal não é apenas um indicador — é uma ferramenta de
> integração do governo.

---

## Frase de Abertura (gancho)

> *"Como uma cidade de 236 mil habitantes identifica, com precisão,
> onde está a vulnerabilidade social?"*

A resposta exige três elementos: **dados**, **integração institucional**
e **visão territorial**.

---

## Estrutura da Palestra — 22 Slides

---

### Slide 0 — Condições de Contorno

*Este slide abre a palestra antes de qualquer argumento técnico.
Seu papel é calibrar expectativas, apresentar vocabulário e situar
o público no projeto. O apresentador discursa livremente sobre cada
bullet — não há texto prescrito.*

**Bullets:**

- **O que é o GitHub e por que ele importa aqui**
  O projeto vive em um repositório público, versionado e auditável.
  Cada decisão técnica e cada arquivo têm data, autor e histórico.
  Isso não é detalhe operacional — é a prova de que o projeto existe,
  tem método e pode ser verificado por qualquer pessoa, a qualquer momento.
  Para quem não conhece: GitHub é o caderno de campo do projeto, aberto
  ao mundo.

- **O que é o IVS — e o que ele não é**
  O Índice de Vulnerabilidade Social não é um ranking de pobreza.
  É uma medida multidimensional que identifica onde as condições de
  vida mais limitam as escolhas das pessoas. Desenvolvido pelo IPEA,
  reconhecido nacional e internacionalmente. O IVS-H é a versão
  calibrada para a realidade de Hortolândia — mesmas 16 variáveis,
  mesmas 3 dimensões, pesos ajustados ao contexto local.

- **O que são loteamentos, regiões de planejamento e núcleos**
  Hortolândia não é um bloco homogêneo. Ela é composta por 141
  loteamentos, agrupados em regiões de planejamento (RP), organizadas
  por sua vez em núcleos (Amanda, Rosolém, Novo Ângulo, Centro, Vila Real).
  Toda a análise do Atlas Social parte dessa hierarquia territorial —
  do menor (loteamento) ao maior (núcleo). Quando falamos em
  vulnerabilidade, falamos sobre *onde*, não apenas *quantos*.

- **A população de Hortolândia e o movimento pendular**
  Hortolândia tem 236.641 habitantes (Censo 2022), crescendo a ~1,5%
  ao ano — projeção de 283 mil até 2030. Mas onde trabalham essas pessoas?
  Dados do Censo 2022 mostram que 58.472 pessoas fazem deslocamento
  intermunicipal diário. O índice de integração com Campinas é 0,42 —
  elevado. 40% dos trabalhadores levam mais de 30 minutos para chegar
  ao trabalho. Hortolândia é, em parte, cidade de residência de quem
  trabalha em outro município. Isso importa para entender renda,
  horários de demanda de serviços e concentração territorial da
  vulnerabilidade.

- **O que este projeto é — e o que não é**
  Este não é um projeto de TI. Não depende de Data Lakehouse, nuvem
  ou R$ 5,7 milhões. Começa com dados que já existem (CadÚnico,
  IBGE, CAGED), uma máquina Debian, SQLite e scripts versionados.
  É a primeira entrega concreta do compromisso assumido publicamente
  pela prefeitura no diagnóstico PPA 2026–2029 de março de 2025:
  *"Implantação de Data Lakehouse Municipal e uso de IA na gestão pública."*
  O Atlas Social não esperou o orçamento. Ele provou que é possível
  começar agora — com método, sem promessa.

- **Ponto focal na Secretaria de Inclusão**
  O Atlas Social de Hortolândia é desenvolvido na Secretaria de
  Planejamento Estratégico, mas sua matéria-prima central — as famílias
  em vulnerabilidade social — pertence ao cotidiano da Secretaria de
  Inclusão e Desenvolvimento Social. Para que o projeto avance com
  consistência e representatividade institucional, é necessário que a
  Secretaria de Inclusão designe formalmente um ponto focal: um
  profissional com autonomia para validar dados, contribuir com a
  leitura territorial e participar das decisões metodológicas que
  afetam a política socioassistencial. Sem esse vínculo formal, o
  projeto corre o risco de produzir análises tecnicamente corretas
  mas institucionalmente desconectadas da realidade operacional.
  Solicita-se ao prefeito que institua esse arranjo por ato formal.

- **Convênios institucionais para acesso a dados**
  O poder analítico do Atlas Social depende diretamente da qualidade
  e abrangência das bases de dados disponíveis. O modelo atual opera
  com o que já existe no município. Para avançar às próximas fases —
  IVS-H Expandido e IVS-H Consolidado Territorial — é necessário que
  a Prefeitura de Hortolândia celebre convênios formais com os
  seguintes órgãos:

  *Federais:*
  | Órgão | Dado almejado |
  | --- | --- |
  | MTE / SINE | CAGED — admissões e desligamentos por município de residência |
  | INSS / DATAPREV | CNIS — vínculos previdenciários; BPC — beneficiários por território |
  | IBGE | Microdados do Censo 2022; malha de setores censitários georreferenciada |
  | INEP / MEC | Censo Escolar — matrículas, evasão e distorção idade-série |
  | MS / RNDS | e-SUS — indicadores de saúde pública por território |

  *Estaduais (SP):*
  | Órgão | Dado almejado |
  | --- | --- |
  | SEADE | Indicadores socioeconômicos municipais e projeções populacionais |
  | SEDS-SP | SUAS estadual — dados de CRAS e CREAS regionais |
  | Secretaria de Educação SP | Matrículas e evasão da rede estadual no município |
  | SES-SP | Indicadores de saúde pública e mortalidade por município |

  Esses convênios não são pré-requisito para o MVP — o primeiro produto
  já está em produção sem eles. Mas são condição para que o Atlas Social
  evolua de diagnóstico parcial para inteligência territorial integrada.
  Solicita-se que a assessoria jurídica da Prefeitura inicie os
  procedimentos formais de conveniamento.

---

### Bloco 1 — O Problema (Slides 1–5)

**Slide 1 — A pergunta central**

Como uma cidade de 236 mil habitantes identifica, com precisão, onde
está a vulnerabilidade social?

A resposta exige três elementos:
- Dados
- Integração institucional
- Visão territorial

---

**Slide 2 — O desafio das cidades modernas**

Os dados existem. Mas estão espalhados:

| Secretaria | Dados que possui |
| --- | --- |
| Assistência Social | CadÚnico, atendimentos CRAS/CREAS |
| Saúde | Mortalidade, gravidez adolescente, e-SUS |
| Educação | Matrículas, evasão escolar |
| Habitação | Favelas, regularização fundiária |
| Desenvolvimento Econômico | Emprego formal, capacitação |

Cada secretaria possui uma parte do diagnóstico.
Nenhuma possui o quadro completo.

---

**Slide 3 — O problema estrutural da gestão pública**

Historicamente, os governos funcionam por secretarias setoriais.
Cada uma possui seus programas, seus indicadores, seus relatórios.

Resultado: **diagnóstico fragmentado da realidade social**.

---

**Slide 4 — A vulnerabilidade social não pertence a uma secretaria**

| Problema social | Secretarias envolvidas |
| --- | --- |
| Evasão escolar | Educação + Assistência Social |
| Gravidez adolescente | Saúde + Educação |
| Desemprego juvenil | Desenvolvimento + Assistência |
| Pobreza familiar | Assistência + Desenvolvimento |

Conclusão: **a vulnerabilidade é intersetorial por natureza**.

---

**Slide 5 — A consequência**

Quando cada secretaria analisa apenas seus próprios dados:
- Perde-se a visão do território
- Políticas podem se sobrepor ou se dispersar
- Áreas críticas podem permanecer **invisíveis**

---

### Bloco 2 — A Solução Metodológica (Slides 6–10)

**Slide 6 — A necessidade de um diagnóstico comum**

Cidades que avançaram em gestão social adotaram um princípio simples:

> Todos os setores do governo devem enxergar a mesma realidade social.

Isso exige: indicadores comuns, bases integradas, leitura territorial
compartilhada.

---

**Slide 7 — O Índice de Vulnerabilidade Social (IVS)**

Desenvolvido pelo IPEA. Mede vulnerabilidade a partir de três dimensões:

| Dimensão | Exemplos de variáveis |
| --- | --- |
| Infraestrutura Urbana | Saneamento, coleta de lixo, mobilidade |
| Capital Humano | Educação, saúde, infância, maternidade |
| Renda e Trabalho | Emprego, renda, informalidade |

16 variáveis no total. Metodologia reconhecida nacional e internacionalmente.

---

**Slide 8 — O IVS como linguagem comum**

O IVS permite que diferentes secretarias conversem sobre o mesmo problema:

- Educação observa **capital humano**
- Assistência Social observa **família**
- Desenvolvimento Econômico observa **renda e trabalho**

Todos analisam a mesma **vulnerabilidade territorial**.

---

**Slide 9 — A realidade de Hortolândia**

Os dados de saneamento básico de Hortolândia são excepcionais:

| Indicador | Valor (2020) | Fonte |
| --- | --- | --- |
| Cobertura de abastecimento de água | **100%** | SNIS / SABESP |
| Coleta de esgoto | **96,4%** | SNIS / SABESP |
| Esgoto tratado por água consumida | **89,7%** | SNIS / SABESP |

> Hortolândia foi destaque nacional no evento *Casos de Sucesso em
> Saneamento Básico* do Instituto Trata Brasil (2019).

Isso tem uma implicação direta para o IVS:

Quando uma variável tem cobertura próxima de 100%, ela **não diferencia
os territórios** — todos os bairros ficam com valor semelhante.
Seu poder discriminatório local é baixo.

Portanto, outras dimensões tornam-se **mais determinantes em Hortolândia**:
Capital Humano e Renda e Trabalho.

Hortolândia possui **49.100 empregos formais** com remuneração média
de R$ 4.700 — e ao mesmo tempo **72.424 pessoas no CadÚnico** (dez/2025).
Essa tensão é o desafio central do município.

---

**Slide 10 — A proposta: IVS-H**

Utilizar o IVS como **referência nacional**, mas construir também um
índice municipal adaptado:

> **IVS-H — Índice de Vulnerabilidade Social de Hortolândia**

Mesmas variáveis. Mesmas dimensões. **Pesos calibrados à realidade local.**

| Dimensão | Peso IPEA | Peso IVS-H (hipótese) |
| --- | --- | --- |
| Infraestrutura Urbana | 33% | ~15-20% |
| Capital Humano | 33% | ~40-45% |
| Renda e Trabalho | 33% | ~35-40% |

---

**Slide 10a — IVS-IPEA x IVS-H: o que muda e por que**

*Lamina de referencia — pode ser impressa como material de apoio*

---

#### O que e igual

| Elemento | IVS-IPEA | IVS-H |
| --- | --- | --- |
| Numero de variaveis | 16 | 16 |
| Dimensoes | 3 (IU / CH / RT) | 3 (IU / CH / RT) |
| Base cientifica | IPEA, 2015 | IPEA, 2015 |
| Comparabilidade intermunicipal | Sim | Sim (mantida via ancora IPEA) |

---

#### O que muda

| Elemento | IVS-IPEA | IVS-H |
| --- | --- | --- |
| Peso por dimensao | 33% cada | Calibrado a realidade local |
| Peso por variavel | 6,25% cada (uniforme) | Ajustado por poder discriminatorio local |
| Territorio de referencia | Nacional / municipal agregado | Loteamento -> RP -> Nucleo |
| Fonte de dados | Censo demografico (IBGE) | CadUnico + Censo 2022 + CAGED + Saude/Educacao |
| Atualizacao | Decenal (Censo) | Continua (CadUnico atualizado) |

---

#### Calibracao hipotetica — por que esses pesos?

| Dimensao | Peso IPEA | Peso IVS-H | Justificativa |
| --- | --- | --- | --- |
| Infraestrutura Urbana | 33% | ~15-20% | Agua: 100% de cobertura; esgoto coletado: 96,4% (SNIS 2020 / SABESP). Variancia entre territorios proxima de zero — baixo poder discriminatorio. Peso revisavel se obras futuras alterarem a cobertura. |
| Capital Humano | 33% | ~40-45% | Reproducao intergeracional da pobreza e o desafio central — maes chefes, analfabetismo, criancas fora da escola |
| Renda e Trabalho | 33% | ~35-40% | Tensao entre polo de emprego formal e 72.424 no CadUnico — desemprego e informalidade sao determinantes locais |

---

#### Disponibilidade imediata para o IVS-H

Das 16 variaveis, **5 ja estao disponiveis no CadUnico dez/2025**:

| Codigo | Variavel | Dimensao |
| --- | --- | --- |
| CH_05 | % maes chefes de familia, sem fund. completo e filho < 15 anos | Capital Humano |
| CH_06 | Taxa de analfabetismo — 15 anos ou mais | Capital Humano |
| CH_07 | % criancas em domicilios sem nenhum morador com fund. completo | Capital Humano |
| RT_01 | % pessoas com renda per capita menor ou igual a 1/2 SM | Renda e Trabalho |
| RT_04 | % domicilios com renda menor ou igual a 1/2 SM dependentes de idosos | Renda e Trabalho |

> Essas 5 variaveis permitem calcular um **IVS-H parcial** como primeiro
> entregavel analitico — antes de qualquer integracao intersetorial.

---

> *Referencia completa: `00_governanca/ivs_vs_ivsh_comparativo.md`*

---

### Bloco 3 — O Modelo Territorial (Slides 11–15)

**Slide 11 — Por que adaptar o indice?**

Porque cada cidade possui desafios especificos. Em Hortolandia:

- Saneamento e relativamente desenvolvido -> baixo poder discriminatorio
- Reproducao intergeracional da pobreza e o desafio central
- Polo de emprego formal convive com alta populacao em vulnerabilidade

A calibracao local **preserva a credibilidade cientifica do IPEA**
e **aumenta a relevancia politica para o municipio**.

---

**Slide 12 — O que o IVS-H permite identificar**

Com o indice calibrado, e possivel responder:

- Onde estao as familias mais vulneraveis?
- Quais regioes apresentam maior risco social?
- Quais politicas publicas atuam nesses territorios?
- Onde ha gap entre vulnerabilidade e atendimento?

---

**Slide 13 — Do indicador ao territorio**

O diagnostico e organizado em tres niveis encadeados:

```
Pessoa -> Familia -> Territorio
```

Essa estrutura permite compreender como vulnerabilidades individuais
se concentram em determinados espacos urbanos — loteamentos, regioes
de planejamento, areas de abrangencia de CRAS.

---

**Slide 14 — Programas publicos e vulnerabilidade**

Uma etapa fundamental e relacionar programas publicos as dimensoes
da vulnerabilidade:

| Dimensao | Exemplos de programas em Hortolandia |
| --- | --- |
| Capital Humano | Programa Cuidar, Bolsa Creche, SCFV, Enfrentamento Trabalho Infantil |
| Renda e Trabalho | PAT, Banco do Povo, Bolsa Familia, BPC, DECOLA |
| Infraestrutura | Agora a Casa e Sua, PHLIS, MCMV |
| Multidimensional | PAIF, PAEFI, CRAS, CREAS |

---

**Slide 15 — Um novo olhar sobre a gestao publica**

Em vez de organizar politicas apenas por secretaria, passamos a
analisa-las por **dimensao da vulnerabilidade**:

- Identificar sobreposicoes
- Detectar lacunas
- Priorizar territorios
- Medir impacto

---

### Bloco 4 — A Proposta Institucional (Slides 16–18)

**Slide 16 — Rompendo a logica dos feudos administrativos**

O modelo tradicional:

```
Secretaria A -> seus programas -> seus dados
Secretaria B -> seus programas -> seus dados
```

O modelo orientado por vulnerabilidade:

```
           IVS-H Municipal
                |
   +------------+-----------+
   |            |           |
Capital H.   Renda     Infraestr.
   |            |           |
Educacao   Desenvolv.   Obras
Saude      Assistencia  Habitacao
Assistencia
```

Quando o foco passa a ser o **territorio e a vulnerabilidade**, as
secretarias deixam de atuar isoladamente e passam a cooperar em torno
de familias, territorios prioritarios e problemas sociais concretos.

---

**Slide 17 — O papel da tecnologia**

A tecnologia nao e o objetivo. Ela e a infraestrutura que permite:

- Integrar bases de dados
- Organizar informacoes sociais
- Gerar indicadores territoriais
- Tornar o diagnostico auditavel e reproduzivel

O Atlas Social de Hortolandia comeca com SQLite e scripts versionados —
nao com Big Data. Comeca com **dados confiaveis**, nao com promessa.

---

**Slide 18 — O resultado esperado**

Um sistema capaz de apoiar decisoes como:

- Onde concentrar politicas sociais
- Quais territorios precisam de maior atencao
- Quais programas estao gerando impacto
- Como comprovar reducao de vulnerabilidade ao longo do tempo

---

### Bloco 5 — Visao de Futuro e Conclusao (Slides 19–21)

**Slide 19 — Visao de futuro**

Hortolandia pode construir um sistema de **Inteligencia Social
Territorial** capaz de integrar:

- Dados sociais (CadUnico, SIGAS)
- Politicas publicas (programas mapeados)
- Planejamento municipal (territorios, loteamentos, regioes)
- Fontes externas (IBGE, CAGED, Saude, Educacao)

---

**Slide 20 — O argumento para o prefeito**

Com menos de 3 anos de mandato, ha uma janela de oportunidade:

> Construir um indice que mostra que Hortolandia **reduziu vulnerabilidade
> de forma mensuravel, com metodologia reconhecida pelo IPEA**.

Isso e **legado**. Um legado que pertence a cidade — nao a uma secretaria.

Antes: cada secretaria trabalha no seu quadrado.
Depois: todas convergem para reduzir o mesmo indice.
Resultado: cidade mais justa — e **comprovadamente** mais justa.

**Nota institucional:** Em marco de 2025, a Prefeitura de Hortolandia
assumiu publicamente, em documento bilIngue de diagnostico PPA 2026-2029
destinado a investidores, o compromisso de implantar *"Data Lakehouse
Municipal e uso de IA na gestao publica"*. O Atlas Social nao esperou
o orcamento nem a infraestrutura. Ele entregou o primeiro produto desse
compromisso — com CadUnico, SQLite e metodo — antes que qualquer contrato
fosse assinado.

---

**Slide 21 — Conclusao**

> O IVS municipal nao e apenas um indicador.
> Ele pode se tornar uma ferramenta de integracao do governo.

Quando a vulnerabilidade passa a orientar o planejamento:

- As secretarias deixam de competir por agendas
- Passam a cooperar por territorios
- O governo fala a mesma lingua sobre a mesma realidade

---

## Referencias

- COSTA, M. A.; MARGUTI, B. O. *Atlas da Vulnerabilidade Social nos
  Municipios Brasileiros*. Brasilia: IPEA, 2015.
- FUNARI, A. P. et al. *Atualizacao do IVS a partir dos dados da PNAD
  Continua 2022*. Boletim Regional, Urbano e Ambiental, IPEA, 2024.
- OECD. *Handbook on Constructing Composite Indicators*. OECD
  Publishing, 2008.
- OECD. *Integrating Policies for Inclusive Growth*. Paris: OECD
  Publishing.
- World Bank. *Whole-of-Government Approaches to Public Sector Reform*.

---

## Cross-references

| Documento | Localizacao no repositorio |
| --- | --- |
| DIM_VARIAVEL_IVS v01r4 | `01_modelagem_conceitual/dim_variavel_IVS_v01r4.md` |
| DIM_DINAMICA_METROPOLITANA v02 | `01_modelagem_conceitual/dim_dinamica_metropolitana_v02.md` |
| arquitetura_dados_IVS_IBGE_Horto_v07 | `00_governanca/arquitetura_dados_IVS_IBGE_Horto_v07.md` |
| ivs_vs_ivsh_comparativo | `00_governanca/ivs_vs_ivsh_comparativo_v04.md` |
| DIM_PROGRAMA v04 | `01_modelagem_conceitual/dim_programa_v04.md` |
| schema_IVS.sql | `02_modelagem_logica/schema_IVS.sql` |

---

## Log de Alteracoes

| Versao | Data | Alteracoes |
| --- | --- | --- |
| v01 | "10/03/2026" | Criacao — estrutura de 21 slides a partir do Registro de Ideias de 08/03/2026 |
| v02 | "10/03/2026" | Adicao do Slide 10a — lamina comparativa IVS-IPEA x IVS-H |
| v03 | "10/03/2026" | Slide 9: dados reais SNIS/SABESP; Slide 10a: justificativa IU com fonte empirica |
| v04 | "17/03/2026" | Novo Slide 0 (Condicoes de Contorno): GitHub, IVS, loteamentos/regioes/nucleos, mobilidade pendular, o que o projeto e e nao e. Slide 20: nota institucional com referencia ao compromisso PPA bilIngue marco/2025. Cross-references atualizados. |
| v05 | "18/03/2026" | Slide 0: dois novos bullets — (1) Ponto focal na Secretaria de Inclusao: solicitacao formal ao prefeito de nomeacao de responsavel para interface com o projeto; (2) Convenios institucionais: solicitacao de convenios com orgaos federais (MTE/CAGED, INSS/DATAPREV, IBGE, INEP/MEC, MS/RNDS) e estaduais SP (SEADE, SEDS-SP, Sec. Educacao SP, SES-SP). |

---

*Documento de comunicacao institucional — `00_governanca/`.*
*Atlas Social de Hortolandia.*
