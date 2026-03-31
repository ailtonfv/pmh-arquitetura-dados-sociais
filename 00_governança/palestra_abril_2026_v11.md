# ATLAS SOCIAL DE HORTOLÂNDIA

Vulnerabilidade Social e Integração de Políticas Públicas

*Palestra — Abril de 2026*

Versão v11

Ailton Vendramini | Secretaria de Planejamento Estratégico | Hortolândia-SP

---

**Argumento Central**

> *"Nenhuma secretaria sozinha consegue reduzir a vulnerabilidade social.  
> O IVS municipal não é apenas um indicador — é uma ferramenta de integração do governo."*

**Frase de abertura:**

> *"Como uma cidade de 236 mil habitantes identifica, com precisão, onde está a vulnerabilidade social — e se a prefeitura está preparada para responder a ela?"*

*A resposta exige três elementos: dados, integração institucional e visão territorial.*

---

## Slide 0 — Condições de Contorno

> **Este projeto parte de cinco condições de contorno.**

**1. Repositório público, versionado e auditável**  
O trabalho vive em um repositório público, com histórico de versões, autoria e rastreabilidade.  
Cada decisão técnica, cada estrutura de dados e cada ajuste metodológico ficam registrados.  
O GitHub funciona, aqui, como caderno de campo auditável do projeto.

**2. O que é o IVS — e o que ele não é**  
O IVS não é um ranking de pobreza.  
É uma medida multidimensional das restrições concretas às escolhas das pessoas.  
Seu valor está em mostrar onde a vulnerabilidade se concentra e como ela se distribui no território.

**3. O município não pode ser lido apenas por agregado**  
Hortolândia possui 141 loteamentos, agrupados em Regiões de Planejamento e organizados, na operação setorial, em núcleos de atendimento.  
A leitura relevante não é apenas “quantos”, mas “onde”.

**4. As coberturas setoriais não coincidem — e isso é informação estratégica**  
Um mesmo loteamento pode pertencer a núcleos distintos conforme o setor público que o atende.  
O CRAS define o núcleo da Inclusão.  
A UBS define o núcleo da Saúde.  
A escola estrutura a cobertura da Educação.  
As fronteiras não são idênticas — e essa diferença não é ruído: é informação analítica.

**5. Este projeto não concorre com a TI operacional**  
A TI municipal automatiza processos, sustenta sistemas e garante infraestrutura digital.  
O Atlas Social atua em outra camada: inteligência estratégica para decisão pública.  
Essa camada ainda não existe formalmente no município.

---

### Estrutura territorial de referência

A hierarquia-base do município é:

**Município → Região de Planejamento → Núcleo → Loteamento**

Um mesmo loteamento pode pertencer a núcleos diferentes dependendo do setor público que o atende.  
Essa sobreposição é central para compreender onde a prefeitura está presente, onde está pressionada e onde há lacuna.

---

### População, integração regional e movimento pendular

- **236.641 habitantes** (Censo 2022)
- **58.472 pessoas** realizam deslocamento intermunicipal diário
- **Integração com Campinas: 0,42**
- **40% dos trabalhadores** levam mais de 30 minutos até o trabalho

Esses números mostram que a cidade não pode ser lida como unidade isolada.  
Ela opera dentro de uma dinâmica regional mais ampla.

---

### Ponto focal institucional

**Solicita-se que seja designado formalmente um ponto focal na Secretaria de Inclusão** para interface com o projeto, com autonomia para validar dados e participar das decisões metodológicas.

---

## Convênios institucionais para acesso a dados

O Atlas Social já produz valor com as bases disponíveis hoje.  
Mas, para atingir granularidade analítica plena, algumas fontes exigem convênios formais.

**Solicita-se que a assessoria jurídica inicie os procedimentos cabíveis.**

### Convênios Federais

| Órgão | Dado acessado | Por que precisamos | O que perdemos sem ele |
| --- | --- | --- | --- |
| MTE / CAGED | Admissões e demissões de emprego formal, com salário declarado por CPF | Verificar consistência entre renda autodeclarada no CadÚnico e vínculo formal de emprego | Sem isso, não detectamos inconsistências cadastrais nem medimos com precisão a transição entre vulnerabilidade e emprego formal |
| INSS / DATAPREV | BPC, histórico contributivo, vínculos formais históricos (CNIS) | Separar renda de trabalho de renda previdenciária e de benefício | Sem isso, o eixo Renda e Trabalho perde precisão |
| IBGE | Microdados do Censo 2022 por setor censitário | Cruzamentos por domicílio e identificação de bolsões internos de vulnerabilidade | Sem isso, o IVS-H permanece restrito ao loteamento |
| INEP / MEC | Matrículas, evasão e desempenho escolar por estabelecimento | Cruzar endereço do aluno com loteamento | Sem isso, a evasão por loteamento permanece invisível |
| MS / RNDS | Gravidez na adolescência, mortalidade infantil, cobertura vacinal | Cruzar saúde com loteamento | Sem isso, parte da dimensão Capital Humano segue com cobertura incompleta |

### Convênios Estaduais — São Paulo

| Órgão | Dado acessado | Por que precisamos | O que perdemos sem ele |
| --- | --- | --- | --- |
| SEADE | Dados demográficos estaduais, projeções populacionais | Atualizar denominadores intercensitários | Taxas ficam ancoradas em base demográfica desatualizada |
| SEDS-SP | Cadastro de programas e benefícios estaduais | Mapear cobertura estadual no território | Programas estaduais ficam invisíveis na análise |
| Secretaria de Educação SP | Matrículas, evasão e fluxo escolar da rede estadual | Completar o retrato educacional | Loteamentos com forte presença estadual ficam subestimados |
| SES-SP | Internações, procedimentos e cobertura da rede estadual | Completar o retrato da saúde | A leitura fica restrita à rede municipal |

> **Nota sobre o CNIS:** ele é acessado via convênio com INSS/DATAPREV.  
> Não se trata de convênio separado.

---

## Bloco 1 — O Problema (Slides 1–5)

### Slide 1 — A pergunta que a rede já faz

> *"A rede já conhece muitos casos. O problema é transformar esse conhecimento disperso em leitura territorial comparável e acionável."*

A Secretaria de Inclusão acumula diariamente um conhecimento que poucas áreas possuem: o retrato concreto das famílias mais vulneráveis da cidade.  
O Atlas Social não pretende “descobrir” o que a rede já sabe.  
Ele organiza esse conhecimento em linguagem territorial compartilhada, para que possa orientar decisões além dos limites de cada unidade.

---

### Slide 1A — O dado que temos até aqui

Hortolândia possui:

- **49.100** empregos formais com remuneração média de **R$ 4.700**
- **72.424** pessoas registradas no CadÚnico (**dez/2025**)

> *"Como uma cidade com esse volume de emprego formal mantém, ao mesmo tempo, uma base tão expressiva de vulnerabilidade?"*

**Esse é o paradoxo que o Atlas Social se propõe a medir e explicar.**

Cada um desses 72.424 registros representa uma família que passou pelo CadÚnico, pelos CRAS, pelo CREAS ou pela rede de proteção.  
A pergunta não é apenas quantos são.  
A pergunta é: **onde estão, o que precisam e como a prefeitura pode responder melhor.**

---

### Slide 2 — O desafio das cidades modernas

Os dados existem. Mas estão espalhados.

| Secretaria | Dados que possui |
| --- | --- |
| Assistência Social | CadÚnico, atendimentos CRAS/CREAS |
| Saúde | Mortalidade, gravidez adolescente, e-SUS |
| Educação | Matrículas, evasão escolar |
| Habitação | Regularização fundiária, assentamentos, déficit |
| Desenvolvimento Econômico | Emprego formal, qualificação |

**Cada secretaria possui uma parte do diagnóstico. Nenhuma possui o quadro completo.**

---

### Slide 3 — O problema estrutural da gestão pública

Historicamente, os governos funcionam por secretarias setoriais.  
Cada uma possui seus programas, seus indicadores e seus relatórios.

**Resultado: diagnóstico fragmentado da realidade social.**

---

### Slide 4 — A vulnerabilidade social não pertence a uma secretaria

| Problema social | Secretarias envolvidas |
| --- | --- |
| Evasão escolar | Educação + Assistência Social |
| Gravidez adolescente | Saúde + Educação |
| Desemprego juvenil | Desenvolvimento + Assistência |
| Pobreza familiar | Assistência + Desenvolvimento |

**Conclusão: a vulnerabilidade é intersetorial por natureza.**

---

### Slide 5 — A consequência

Quando cada secretaria analisa apenas seus próprios dados:

- perde-se a visão do loteamento;
- políticas podem se sobrepor ou se dispersar;
- áreas críticas podem permanecer invisíveis.

---

## Bloco 2 — A Solução Metodológica (Slides 6–10)

### Slide 6 — A necessidade de um diagnóstico comum

> *"Todos os setores do governo precisam enxergar a mesma realidade social."*

Isso exige:

- indicadores comuns;
- bases integradas;
- leitura territorial compartilhada.

---

### Slide 7 — O Índice de Vulnerabilidade Social (IVS)

Desenvolvido pelo IPEA.  
16 variáveis.  
Metodologia reconhecida nacionalmente.

| Dimensão | Exemplos de variáveis |
| --- | --- |
| Infraestrutura Urbana | Saneamento, coleta de lixo, mobilidade |
| Capital Humano | Educação, saúde, infância, maternidade |
| Renda e Trabalho | Emprego, renda, informalidade |

---

### Slide 8 — O IVS como linguagem comum

- Educação observa Capital Humano
- Assistência observa família e proteção
- Desenvolvimento observa renda e trabalho

**Todos passam a analisar a mesma vulnerabilidade pelo mesmo loteamento.**

---

### Slide 9 — A realidade local

| Indicador | Valor | Fonte |
| --- | --- | --- |
| Cobertura de abastecimento de água | 100% | SNIS / SABESP |
| Coleta de esgoto | 96,4% | SNIS / SABESP |
| Esgoto tratado por água consumida | 89,7% | SNIS / SABESP |

*Hortolândia foi destaque nacional no evento Casos de Sucesso em Saneamento Básico — Instituto Trata Brasil (2019).*

**49.100 empregos formais convivem com 72.424 pessoas no CadÚnico (dez/2025). Essa tensão é o desafio central do município.**

---

### Evidências recentes — março de 2026

**Este slide não apresenta o índice. Apresenta o ambiente dinâmico em que o índice precisa operar.**

**1. Ampliação de equipamentos de saúde básica (UBS)**  
A prefeitura recebeu, na 17ª Caravana Federativa, equipamentos para UBSs.  
Isso altera a capacidade concreta de resposta do município em variáveis de saúde e precisa ser incorporado ao modelo.

**2. Inauguração de residencial sênior**  
A abertura de nova unidade para idosos sinaliza uma transição demográfica em curso.  
A dependência de renda associada ao envelhecimento tende a crescer e precisa ser monitorada.

**3. Paradoxo hídrico nas bacias PCJ**  
A melhora pontual da vazão não elimina risco estrutural.  
Isso sustenta a manutenção da dimensão de infraestrutura no modelo, com menor peso discriminatório relativo, mas sem exclusão.

> *"Vulnerabilidade não é uma fotografia. É um filme. O Atlas Social precisa capturar o movimento."*

---

### Slide 9A — O que a imprensa local já está mostrando

> *"A vulnerabilidade social não aparece apenas nos cadastros. Ela também deixa rastros públicos no cotidiano da cidade."*

**Evidência exploratória — imprensa local**  
**Período observado:** 14 a 26 de março de 2026  
**Base consolidada:** 19 registros estruturados da *Tribuna Liberal*

#### Distribuição por dimensão IVS
- **Capital Humano:** 9 ocorrências
- **Renda e Trabalho:** 6 ocorrências
- **Infraestrutura Urbana:** 4 ocorrências

#### Leitura inicial
- maior concentração em **Capital Humano**;
- **Renda e Trabalho** aparece como segunda pressão recorrente;
- **Infraestrutura Urbana** permanece presente, mas com menor frequência relativa.

#### Variáveis mais recorrentes
- **CH_04 — mães vulneráveis**
- **IU_01 — infraestrutura urbana**
- **RT_01 — baixa renda**
- **RT_04 — idosos vulneráveis**

> *"O Atlas Social não substitui os sistemas oficiais.  
> Ele cruza o dado administrativo com evidência empírica da cidade real."*

**Nota metodológica:**  
Leitura exploratória baseada em clipping estruturado de imprensa local.  
Não substitui indicador oficial, mas sinaliza pressões sociais e temas recorrentes.

---

### Slide 10 — A proposta: IVS-H

> *"IVS-H — Índice de Vulnerabilidade Social de Hortolândia"*

Mesmas variáveis.  
Mesmas dimensões.  
Construído progressivamente com as fontes disponíveis, preservando a âncora metodológica do IPEA.

| Dimensão | Referência IPEA | Prioridade analítica local |
| --- | --- | --- |
| Infraestrutura Urbana | Estrutural | Menor poder discriminatório relativo, sem exclusão |
| Capital Humano | Estrutural | Prioridade elevada |
| Renda e Trabalho | Estrutural | Prioridade elevada |

> O IVS-H preserva a estrutura metodológica do IPEA e será construído progressivamente, conforme a disponibilidade das 16 variáveis.

---

### Slide 10a — Três índices, três funções

| Índice | Natureza | Pergunta central |
| --- | --- | --- |
| IVS-IPEA | Referência nacional | Onde está a vulnerabilidade no padrão científico nacional? |
| IVS-H | Aplicação local progressiva | Onde está a vulnerabilidade no município, com os dados já disponíveis? |
| IPST-H | Leitura operacional | Onde essa vulnerabilidade está pressionando a rede e exigindo reforço da prefeitura? |

> *"O IPEA nos dá a base. O IVS-H territorializa essa base. O IPST-H mostra onde essa realidade já está pressionando a prefeitura."*

---

### Slide 10b — Dois índices, duas funções

| | IVS-H | IPST-H |
| --- | --- | --- |
| Natureza | Índice estrutural | Índice operacional |
| Âncora | IPEA — 16 variáveis | Município — pressão territorial |
| Pergunta | Onde está a vulnerabilidade? | Onde a vulnerabilidade está pressionando a rede? |
| Atualização | Por fase de dados | Contínua |

> *"O IVS-H mostra onde está a vulnerabilidade. O IPST-H mostra onde essa vulnerabilidade se transforma em pressão sobre a prefeitura."*

**Como os dois se combinam:**

| Situação | Interpretação | Ação |
| --- | --- | --- |
| IVS-H alto + IPST-H alto | Alta vulnerabilidade e rede pressionada | Prioridade máxima |
| IVS-H alto + IPST-H baixo | Vulnerabilidade alta, rede ainda absorvendo | Monitorar |
| IVS-H baixo + IPST-H alto | Pressão operacional sem leitura estrutural suficiente | Investigar causa |
| IVS-H baixo + IPST-H baixo | Situação estável | Manutenção |

---

### Slide 10c — IVS-IPEA × IVS-H: o que muda e por que  
*Lâmina de apoio*

**O que é igual:**

| Elemento | IVS-IPEA | IVS-H |
| --- | --- | --- |
| Número de variáveis | 16 | 16 |
| Dimensões | 3 (IU / CH / RT) | 3 (IU / CH / RT) |
| Base científica | IPEA, 2015 | IPEA, 2015 |
| Comparabilidade intermunicipal | Sim | Sim, via âncora IPEA |

**O que muda:**

| Elemento | IVS-IPEA | IVS-H |
| --- | --- | --- |
| Recorte de análise | Nacional / municipal | Loteamento → RP → Núcleo |
| Fonte de dados | Censo IBGE | CadÚnico + Censo + CAGED |
| Atualização | Decenal | Mais frequente, conforme bases locais |
| Construção | Completa | Progressiva |

**Cinco variáveis já disponíveis no CadÚnico dez/2025:**

| Código | Variável | Dimensão |
| --- | --- | --- |
| CH_05 | % mães chefes de família, sem fund. completo, com filho menor de 15 anos | Capital Humano |
| CH_06 | Taxa de analfabetismo — 15 anos ou mais | Capital Humano |
| CH_07 | % crianças em domicílios sem nenhum morador com fund. completo | Capital Humano |
| RT_01 | % pessoas com renda per capita ≤ 1/2 SM | Renda e Trabalho |
| RT_04 | % domicílios com renda ≤ 1/2 SM dependentes de idosos | Renda e Trabalho |

---

### Slide 10d — Estrutura da Cidade e Funcionamento da Rede de Atendimento

> **Subtítulo:** "Uma mesma base de loteamentos — múltiplas formas de organização e atendimento"

> **Frase central:** "Os loteamentos são a base comum. As formas de organização e atendimento variam conforme o serviço público."

**Painel esquerdo — organização administrativa**
- Região de Planejamento
- Núcleo
- Loteamento

**Painel direito — cobertura da rede de atendimento**
- CRAS / CREAS / demais equipamentos
- cobertura compartilhada
- áreas de fronteira
- sobreposição operacional

**Rodapé:** 6 Regiões de Planejamento · 141 Loteamentos · Cobertura compartilhada entre unidades

**Nota arquitetural:** a tabela de cobertura entre unidade e loteamento exige `data_inicio` e `data_fim` para preservar histórico quando a abrangência operacional mudar.

---

## Bloco 3 — O Modelo (Slides 11–15)

### Slide 11 — Por que adaptar o índice?

- saneamento relativamente desenvolvido → menor poder discriminatório relativo;
- reprodução intergeracional da pobreza como desafio central;
- polo de emprego formal convivendo com alta vulnerabilidade;
- construção progressiva preservando credibilidade científica e relevância local.

---

### Slide 12 — O que o IVS-H permite identificar

- loteamentos com maior concentração de famílias vulneráveis;
- possibilidade de fila invisível;
- pressão crescente sobre a rede;
- políticas públicas já incidentes;
- gaps entre vulnerabilidade identificada e cobertura efetiva.

---

### Slide 13 — Do indicador ao loteamento

- a análise parte da cadeia: **Pessoa → Família → Loteamento**
- vulnerabilidades individuais se concentram territorialmente;
- CadÚnico não é população total: revela demanda identificada;
- a demanda real é maior, o que reforça a busca ativa como política permanente.

---

### Slide 14 — Programas públicos e vulnerabilidade

| Dimensão | Exemplos de programas |
| --- | --- |
| Capital Humano | Programa Cuidar, Bolsa Creche, SCFV, Enfrentamento ao Trabalho Infantil |
| Renda e Trabalho | PAT, Banco do Povo, Bolsa Família, BPC, DECOLA |
| Infraestrutura | Agora a Casa é Sua, PHLIS, MCMV |
| Multidimensional | PAIF, PAEFI, CRAS, CREAS |

---

### Slide 15 — Um novo olhar sobre a gestão pública

O Atlas Social permite que hoje ainda depende de percepção:

- identificar loteamentos com muita demanda e pouca cobertura;
- separar percepção de evidência;
- justificar reforço territorial com base técnica;
- priorizar busca ativa;
- medir evolução ao longo do tempo.

---

## Bloco 4 — A Proposta Institucional (Slides 16–18)

### Slide 16 — Vocês já fazem o trabalho mais difícil

A Secretaria de Inclusão atende diariamente as famílias mais vulneráveis da cidade.  
Nos CRAS, no CREAS, no CadÚnico, na abordagem social, no acompanhamento de casos complexos.

**O Atlas Social não cria uma nova atribuição para a Secretaria de Inclusão.  
Ele torna visível, comparável e acionável o conhecimento que a Secretaria já produz todos os dias.**

O IVS-H e o IPST-H são instrumentos para que esse conhecimento acumulado — hoje disperso em relatórios, planilhas e memória institucional — passe a orientar decisões de governo em todas as secretarias.

---
### Slide 16A — O que muda na prática do CRAS

## Na rotina de quem atende

> *"O IVS-H não muda o que o técnico faz. Muda o que o técnico consegue ver antes de agir."*
---
### Situação 1 - Busca ativa com foco

**Antes:**
A equipe do CRAS define as visitas por percepção, histórico de casos e demanda espontânea.

**Com o IVS-H:**
O técnico acessa quais loteamentos do seu núcleo concentram mais famílias com renda abaixo de meio salário mínimo, chefia feminina e crianças fora da escola — e prioriza a busca ativa com base nesse mapa.

---

### Situação  2 - Encaminhamento intersetorial com argumento

**Antes:**
Quando o técnico percebe que uma família precisa de apoio de Saúde ou Educação, o encaminhamento depende de relato verbal e histórico de caso.

**Com o IVS-H:**
O técnico apresenta o indicador territorial do loteamento e mostra que aquela situação não é isolada — é padrão. O encaminhamento deixa de ser pedido individual e passa a ser argumento coletivo.

---

### Situação 3 — Resposta a perguntas da gestão

**Antes:**
Quando a coordenação pergunta *"por que esse loteamento demanda tanto?"*, a resposta é qualitativa — baseada na experiência da equipe.

**Com o IVS-H:**
A resposta é *"porque esse loteamento concentra X% de famílias com renda abaixo de meio salário e Y% de mães chefes de família sem ensino fundamental — os dados mostram isso."*

---

> *"O conhecimento que a rede já tem ganha linguagem técnica compartilhada."*

---

**Nota de posicionamento na palestra:**
Este slide se encaixa após o Slide 16 ("Vocês já fazem o trabalho mais difícil") — reforça a mesma mensagem com exemplos concretos da rotina.

---
### Slide 17 — O papel da tecnologia

A tecnologia não é o objetivo.  
Ela é a infraestrutura que permite:

- integrar bases de dados;
- organizar informações sociais;
- gerar indicadores por loteamento;
- tornar o diagnóstico auditável e reproduzível.

**O Atlas Social começa com SQLite e scripts versionados — não com promessa tecnológica.  
Começa com dados confiáveis, não com espetáculo.**

---

### Slide 18 — O resultado esperado

Um sistema capaz de apoiar decisões como:

- priorizar loteamentos para busca ativa com base em evidência;
- identificar famílias vulneráveis sem acompanhamento proporcional;
- justificar reforço territorial e articulação com OSCs;
- dar base técnica para diálogo intersetorial;
- comprovar redução de vulnerabilidade ao longo do tempo.

---

## Bloco 5 — Visão de Futuro e Conclusão (Slides 19–28)

### Slide 19 — Visão de futuro

Hortolândia pode construir um sistema de Inteligência Social Municipal capaz de integrar:

- dados sociais;
- políticas públicas;
- planejamento territorial;
- fontes externas.

---

### Slide 20 — O que isso representa para a Secretaria de Inclusão

> *"A Secretaria de Inclusão passa a ter linguagem técnica para dialogar com qualquer outra secretaria sobre qualquer loteamento da cidade."*

Hoje, quando a Inclusão precisa de apoio de Saúde, Educação ou Desenvolvimento, esse diálogo muitas vezes acontece por caso, por relato ou por urgência.

Com o IVS-H e o IPST-H, esse diálogo passa a ocorrer por evidência.

*Nota institucional:* em março de 2025, a Prefeitura assumiu, no diagnóstico do PPA 2026–2029, o compromisso de implantar Data Lakehouse Municipal e uso de IA na gestão pública.  
O Atlas Social entrega, com método e baixo custo, o primeiro produto concreto dessa direção.

---

### Slide 21 — Conclusão

> *"O IVS municipal não é apenas um indicador. Ele pode se tornar uma ferramenta de integração do governo."*

Quando a vulnerabilidade passa a orientar o planejamento:

- as secretarias deixam de competir por agendas;
- passam a cooperar por loteamentos e prioridades comuns;
- o governo passa a falar a mesma língua sobre a mesma realidade.

---

### Slide 22 — O limite dos sistemas atuais

> *"A maioria dos sistemas responde onde a vulnerabilidade aparece.  
> Poucos respondem se a capacidade da prefeitura está proporcional à intensidade dessa vulnerabilidade."*

**O Atlas Social responde as duas coisas.**

| Camada | O que responde | Fonte principal |
| --- | --- | --- |
| Camada 1 — IVS-H | Onde está a vulnerabilidade e qual sua intensidade | CadÚnico + IBGE |
| Camada 2 — Capacidade | A prefeitura tem estrutura para responder? | Sistemas municipais / rede |
| Camada 3 — Lacuna | Onde há vulnerabilidade sem resposta proporcional? | Cruzamento das duas camadas |

---

### Slide 23 — Exemplo: três camadas em ação

**AVISO METODOLÓGICO:** esta lâmina é ilustrativa.  
Os valores não representam resultado empírico validado.  
Sua função é demonstrar a lógica do modelo.

| Camada | Situação identificada | Resultado |
| --- | --- | --- |
| Camada 1 — IVS-H | Alta proporção de baixa renda, chefia feminina, baixa escolaridade | Alta vulnerabilidade |
| Camada 2 — Capacidade | Unidade com demanda elevada, programas ativos | Cobertura parcial |
| Camada 3 — Lacuna | Famílias elegíveis sem acompanhamento regular | Vulnerabilidade alta + cobertura insuficiente |

**Decisões que passam a ser possíveis:**
- reforçar busca ativa;
- redirecionar cobertura;
- priorizar visitas;
- justificar expansão de equipe;
- acionar outras secretarias com base técnica.

---

### Slide 24 — Arquitetura do Atlas Social

| Camada | Conteúdo |
| --- | --- |
| Fontes de dados | CadÚnico / IBGE / CAGED / sistemas municipais |
| Ingestão e padronização | Limpeza / deduplicação / padronização |
| Modelo analítico | Pessoa / Família / Loteamento / Programa / Variável IVS |
| Indicadores | IVS-H / IPST-H / cobertura / lacunas |
| Visualização e decisão | Painéis / relatórios / alertas |

**Princípio central: a unidade mínima de análise é a Pessoa.**

**Pessoa → Família → Loteamento → Unidade / Núcleo / RP**

| Fase | Descrição |
| --- | --- |
| Hoje — MVP | IVS-H parcial + IPST-H v0.1 + primeiros indicadores |
| Próximo passo | 16 variáveis + integrações complementares |
| Futuro | Pipeline analítico em camadas + monitoramento contínuo |

---

### Slide 25 — O que muda na prática

| Dimensão | Antes do Atlas Social | Com o Atlas Social |
| --- | --- | --- |
| Base da decisão | Percepção e experiência | Evidência territorial mensurável |
| Visão do município | Agregada por secretaria | Por loteamento, núcleo e RP |
| Integração de dados | Fragmentada | Visão unificada por pessoa e família |
| Identificação de lacunas | Dependente de relato | Calculada e rastreável |
| Prestação de contas | Relatório narrativo | Indicador auditável |
| Ciclo de melhoria | Eventual | Contínuo |

> *"Não é apenas um painel. É uma infraestrutura de dados para governar com precisão."*

---

### Slide 26 — Duas camadas de análise: administrativa x censitária

| Camada | Base | Fonte | Função |
| --- | --- | --- | --- |
| Administrativa | Loteamento / Núcleo / RP | Prefeitura / rede | Gestão operacional |
| Estatística | Setor censitário | IBGE | Precisão científica e comparabilidade |

**Evidência já disponível:**  
setores com cobertura de esgoto muito inferior à média municipal coexistem com bons indicadores agregados.  
Ou seja: o agregado esconde bolsões.

> *"Os microdados ampliarão a precisão. Eles não inauguram o modelo; apenas o aprofundam. O modelo já está de pé."*

---

### Slide 27 — Uma nova camada de inteligência para o município

A TI municipal automatiza processos, desenvolve sistemas e sustenta a infraestrutura digital.  
Essa é a camada operacional.

**O Atlas Social ocupa outra camada — inteligência estratégica:**

- integra dados de múltiplas secretarias;
- produz diagnóstico territorial contínuo;
- orienta alocação de recursos;
- comprova resultados com metodologia auditável.

**Essa camada ainda não existe formalmente no município.**

---

### Slide 28 — O que está ao alcance

> *"O município pode se tornar uma das primeiras experiências do Brasil a medir, de forma contínua, a redução da vulnerabilidade social."*

Não como promessa. Como entrega.

O primeiro produto já existe:  
cinco variáveis calculáveis hoje, com dados já disponíveis no CadÚnico de dezembro de 2025.

**O Atlas Social não começa quando o orçamento chegar.**  
**Ele começa quando a cidade decide tratar vulnerabilidade como objeto de governo, e não apenas como objeto de atendimento.**

---

## Referências

COSTA, M. A.; MARGUTI, B. O. *Atlas da Vulnerabilidade Social nos Municípios Brasileiros*. Brasília: IPEA, 2015.

FUNARI, A. P. et al. *Atualização do IVS a partir dos dados da PNAD Contínua 2022*. Boletim Regional, Urbano e Ambiental, IPEA, 2024.

JANNUZZI, P. M. *Indicadores Sociais no Brasil: conceitos, fontes de dados e aplicações*. 5. ed. Campinas: Alínea, 2012.

OECD. *Handbook on Constructing Composite Indicators*. Paris: OECD Publishing, 2008.

World Bank. *Whole-of-Government Approaches to Public Sector Reform*.

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v11 | "30/03/2026" | Revisão de linguagem oral, reforço das condições de contorno, separação mais nítida entre entrega atual, hipótese e roadmap, substituição de "Estado" por "prefeitura" em trechos centrais, racionalização dos slides conceituais. |

---

*Documento técnico vivo — Projeto Atlas Social de Hortolândia*  
*Versão 11 — palestra de março de 2026*
