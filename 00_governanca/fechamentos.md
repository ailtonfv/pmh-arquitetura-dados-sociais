# Fechamento — 31 de março de 2026

**Responsável:** Ailton Vendramini  
**Repositório:** ailtonfv/Atlas-Social-de-Hortolandia  
**Sessão:** dia longo — palestra + ajustes de arquivos + séries jornalísticas + 1ª aula Python

---

## 1. Contexto da Sessão

Último dia útil antes do feriado de Páscoa. Semana curta com alta produtividade.
Dois objetivos principais cumpridos: fechar todos os arquivos atrasados e iniciar
a formação em Python com dados reais do projeto.

---

## 2. Arquivos Atualizados no Repositório

| Arquivo | Versão | Status | Alteração |
| --- | --- | --- | --- |
| `palestra_plan_estrat_07_04_2026_v03.md` | v03 | ✅ GitHub | Palestra para reunião de planejamento estratégico 07/04 |
| `loteamento_dim_v04.md` | v04 | ✅ GitHub | Nota arquitetural SIGAS × codbairro; TAB_NORMALIZA_LOCALIDADE com campo `fonte`; P08 ampliada |
| `programa_dim_v08.md` | v08 | ✅ GitHub | CENTROPOP, EMERGENCIAS e FUNDO_EMERG: observacoes enriquecidas com dados operacionais do SIGAS |
| `rel_programa_indicador_v02.sql` | v02 | ✅ GitHub | Nota arquitetural de governança de acesso ao SIGAS; Query 6 adicionada |
| `palestra_abril_2026_v12.md` | v12 | ✅ GitHub | Slide 16A adicionado — "O que muda na prática do CRAS" (3 situações concretas da rotina do técnico) |

---

## 3. Séries Jornalísticas — Corpus Atualizado

### 3.1 CSV 31/03/2026 criado

Três registros da Tribuna Liberal de 31/03/2026:

| item | dimensao_ivs | codigo_variavel | tipo_relacao_variavel |
| --- | --- | --- | --- |
| Homicídio em madeireira Jd. Amanda II | multidimensional | RT_01 | indireta |
| Adolescente morre — colisão moto Vila Verde | capital_humano | CH_01 | contextual |
| Violência doméstica com arma — Parque Santo André | multidimensional | CH_05 | direta |

### 3.2 Nova coluna `tipo_relacao_variavel` adicionada a todos os CSVs

Valores possíveis: `direta` | `indireta` | `contextual`

**Definição operacional:**
- **direta** → vínculo claro e imediato com a variável IVS; entra na leitura principal
- **indireta** → sugere padrão quando repetido; não explica sozinho
- **contextual** → abre hipótese sobre o núcleo; não é vulnerabilidade estrutural

**Regra de relevância:** indireto só ganha força quando vira padrão (≥3 ocorrências no mesmo loteamento)

### 3.3 Classificação automática aplicada

Script `classificar_tipo_relacao.py` executado — todos os 34 registros classificados.
9 registros revisados manualmente. 1 registro `a_revisar` remanescente a verificar.

### 3.4 Estado do corpus

| Métrica | Valor |
| --- | --- |
| Total de registros | 34 |
| Arquivos CSV | 10 |
| Período | 14/03/2026 a 31/03/2026 |
| Diretos | 24 |
| Contextuais | 6 |
| Indiretos | 3 |
| A revisar | 1 |

**Distribuição por dimensão IVS:**
- capital_humano: 14
- renda_trabalho: 7
- infraestrutura_urbana: 6
- multidimensional: 5
- SMIDS_EXT: 2

---

## 4. Palestra 07/04/2026 — Planejamento Estratégico

Palestra concluída e commitada como `palestra_plan_estrat_07_04_2026_v03.md`.

**Decisões tomadas:**
- Respeitou o template do secretário (11 slides estruturados)
- 10 ajustes políticos aplicados: "linha de trabalho" em vez de "projeto", linguagem de construção coletiva, humildade estratégica, Data Lakehouse presente sem ser nomeado, secretário trazido para dentro da narrativa
- Frase invisível inserida no Slide 9: "esse esforço só faz sentido se for útil para as secretarias"

---

## 5. Palestra Abril 2026 — Inclusão (v12)

**Ajuste principal:** Slide 16A adicionado após Slide 16.
Três situações concretas da rotina do técnico do CRAS:
1. Busca ativa com foco territorial
2. Encaminhamento intersetorial com argumento técnico
3. Resposta à gestão com evidência quantitativa

**Frase central do slide:** *"O IVS-H não muda o que o técnico faz. Muda o que o técnico consegue ver antes de agir."*

---

## 6. Levantamento Técnico SIGAS (Ata Caio — 27/03/2026)

Ata lida e processada. Principais achados incorporados aos arquivos:

- SIGAS usa padrão Correios (via CEP) para nomear loteamentos — diverge do codbairro oficial
- Acesso ao banco exige solicitação formal via DOCS + consulta ao Departamento de Sistemas
- Parte dos dados tem sigilo profissional (relatórios de evolução/acompanhamento de famílias)
- SIGAS possui chave própria CMC além do CPF
- Campos de Educação, Saúde e Processos Judiciais são subutilizados pelos técnicos
- Georreferenciamento nativo existe mas apresenta inconsistências conhecidas
- Power BI interno não é considerado confiável pela própria equipe

**7 perguntas encaminhadas ao Caio** para segunda visita ao SIGAS:
1. Nome completo e geração do CMC
2. Campos ignorados — obrigatórios ou opcionais? Percentual de preenchimento?
3. Benefício Eventual Recâmbio — operação e registro de município de destino
4. `id_atendimento` — sequencial contínuo ou reseta por período/unidade?
5. Oficinas coletivas — o que fica registrado além da presença?
6. SGTS — quais secretarias utilizam? Acessível para consulta?
7. Georreferenciamento — dados brutos de localização preservados no banco?

---

## 7. Discussão Estratégica — SIGAS e Codbairro

**Tema:** Como equacionar a divergência de nomenclatura entre SIGAS e o cadastro mobiliário municipal.

**Opções discutidas:**
1. Exigir exportação com CEP original preservado (mais viável no curto prazo)
2. Solicitar campo adicional `codigo_bairro_municipal` no SIGAS
3. Exigir que o SIGAS adote o cadastro oficial de loteamentos como tabela de referência (mais elegante e correto — linguagem de contrato: "o sistema deve utilizar o cadastro oficial de loteamentos do município como tabela de referência para o campo endereço/bairro")

**Decisão:** munição para o momento oportuno. Solicitação deve partir da Secretaria de Inclusão formalmente ao fornecedor — não do projeto diretamente.

---

## 8. Primeira Aula de Python

**Foco:** dados reais do Atlas Social — séries jornalísticas  
**Abordagem:** código direto com explicação linha a linha

**Conceitos trabalhados:**
- `import` — carregar bibliotecas
- variáveis — guardar valores com nome
- `r'...'` — raw string para caminhos Windows
- `glob.glob()` — lupa para encontrar arquivos por padrão
- `len()` — contar elementos (não tamanho de arquivo)
- `pd.read_csv()` — carregar CSV como tabela
- list comprehension — `[... for x in lista]`
- `pd.concat()` — empilhar múltiplas tabelas
- `df.head()` — visualizar primeiras linhas
- `df['coluna'].value_counts()` — contar ocorrências por valor
- filtragem: `df[df['coluna'] == 'valor']`

**Resultado do exercício:** `df['codigo_variavel'].value_counts()` — executado corretamente de forma autônoma.

**Problema identificado para aula 2:** colunas fantasmas `observacao\t\t\t` em alguns CSVs — causadas por tabulação misturada no campo `observacao`. Correção pendente para próxima sessão.

---

## 9. Pendências para Próxima Sessão

| Pendência | Prioridade |
| --- | --- |
| Corrigir colunas fantasmas `observacao\t\t\t` nos CSVs | Alta |
| Aula 2 Python — limpeza de dados + visualização | Alta |
| Verificar 1 registro `a_revisar` remanescente no corpus | Média |
| Aguardar retorno do Caio com 7 respostas sobre SIGAS | Média |
| Apresentação Inclusão — aguardar Produto 1 calculado (~mid-abril) | Média |
| Retomar cálculo IVS-H Fase 1 (CH_05, CH_06, CH_07, RT_04) após feriado | Alta |

---

## 10. Observação do Dia

Hoje foi o primeiro dia em que Python deixou de ser abstrato e passou a fazer sentido
no contexto do projeto. O corpus jornalístico — construído registro a registro nas últimas
semanas — produziu hoje os primeiros resultados analíticos automatizados.

34 registros. 10 arquivos. Uma tabela consolidada. Um `value_counts()` escrito de forma autônoma.

Isso é o início.

---

*Fechamento gerado em 31/03/2026 — fim do primeiro trimestre de 2026*  
*Atlas Social de Hortolândia — uso interno*

[fechamento_dia_31_03_2026.md](https://github.com/user-attachments/files/26387115/fechamento_dia_31_03_2026.md)



















































































































[fechamento_dia_22_03_2026.md](https://github.com/user-attachments/files/26169203/fechamento_dia_22_03_2026.md)
[Uploading fe# Fechamento do Dia — 22/03/2026

**Projeto:** Atlas Social de Hortolândia  
**Repositório:** `ailtonfv/Atlas-Social-de-Hortolandia`  
**Sessão:** Domingo, 22 de março de 2026

---

## 1. Contexto da Sessão

Sessão de domingo com caráter estratégico e reflexivo — sem mergulho
em código, mas com entrega de valor real. O tema central foi a
**governança da implementação**: como garantir que os meses de
discussão conceitual no GitHub não se percam no momento em que o
Jupyter for aberto pela primeira vez.

A sessão produziu três artefatos normativos que formam a espinha
dorsal da rastreabilidade do projeto, além de uma versão refinada
do documento de variáveis mais crítico do modelo.

---

## 2. Decisões Definitivas da Sessão

### 2.1 Arquitetura de governança da implementação

Três camadas complementares e obrigatórias antes de qualquer código:

| Artefato | Papel |
| --- | --- |
| `convencao_nomenclatura_v01.md` | Vocabulário único — nomes de notebooks, variáveis, tabelas, outputs |
| `matriz_rastreabilidade_operacional_v02.md` | Ponte entre GitHub e Jupyter — quem executa o quê, com base em quê |
| Cabeçalho padrão de notebook | Identidade e rastreabilidade de cada notebook individual |

**Princípio consolidado:**
> O GitHub responde o que e por quê. O Jupyter responde como e com
> quais dados. A matriz conecta os dois mundos.

### 2.2 Fronteira GitHub × Jupyter

Arquivos do GitHub **não migram** para o Jupyter — eles **geram**
correspondentes no Jupyter. A relação é de derivação, não de migração.
Decisões conceituais nunca devem ser armazenadas dentro de notebooks.

### 2.3 Estrutura de pastas do Jupyter consolidada

A estrutura observada em `/cadunico_projeto/` foi mapeada e
incorporada à matriz:

```
cadunico_projeto/
├── notebooks/     → 01, 02, 03, 04 (todos vazios — prontos para receber código)
├── script/        → funcoes_gerais.py
├── outputs/
│   ├── tabelas/   → ivs_variaveis.csv, ivs_resultado_final.csv, familias_vulneraveis.csv
│   └── graficos/  → vulnerabilidade_por_familia.png, ivs_por_nucleo.png, distribuicao_renda.png
├── dados/         → bruto.csv, externo.parquet, processado.xlsx
├── docs/          → metodologia_ivsh.md
└── README.md
```

### 2.4 Tipologia de outputs formalizada

| tipo_output | Significado | Pode commitar? |
| --- | --- | --- |
| exploratorio | Inspeção e validação — não oficial | Não |
| analitico | Resultado de cálculo — dado individual | Não |
| operacional | Uso restrito à rede CRAS | Não |
| institucional | Dado agregado — apresentável | Sim |

### 2.5 Risco de schema CadÚnico — formalizado

Todas as colunas do CadÚnico usadas no modelo são dependentes do
dicionário oficial versão dez/2025. Qualquer atualização do
Ministério pode invalidar notebooks silenciosamente.
**Mitigação obrigatória:** registrar versão do dicionário no
cabeçalho de cada notebook a cada nova carga.

---

## 3. Arquivos Produzidos

| Arquivo | Versão | Destino no Repositório | Status |
| --- | --- | --- | --- |
| `convencao_nomenclatura_v01.md` | v01 | `04_documentacao_tecnica/` | Aguarda upload |
| `matriz_rastreabilidade_operacional_v02.md` | v02 | `04_documentacao_tecnica/` | Aguarda upload |
| `dim_variavel_IVS_v01r7.md` | v01r7 | `01_modelagem_conceitual/` | Aguarda upload — substitui v01r5 |

### Pendência de sessões anteriores ainda em aberto

| Arquivo | Status |
| --- | --- |
| `ipst_h_v02.md` | Aguarda upload |
| `palestra_marco_2026_v10.md` | Aguarda upload |

---

## 4. O que Mudou em Cada Arquivo

### `convencao_nomenclatura_v01.md`
Documento novo. Define:
- Faixas numéricas de notebooks (01–09 exploração, 10–19 dimensões,
  20–29 índices, 30–39 territorial, 90–99 rascunhos)
- Prefixos de tabelas SQLite (DIM_, FATO_, REL_, STG_)
- Padrão de variáveis Python (var_rt01, var_ch05...)
- Padrão de outputs com data no nome
- Regras de documentação GitHub já praticadas

### `matriz_rastreabilidade_operacional_v02.md`
Evolução da v01. Incorporações da v02:
- `id_rastreabilidade` (RTB_001 a RTB_045) — endereço único citável
- Separação `Tabela leitura` vs. `Tabela escrita`
- `tipo_output` — exploratorio / analitico / operacional / institucional
- `periodo_referencia` como coluna obrigatória em todas as seções
- Risco de schema CadÚnico formalizado com mitigação
- RTB_001 marcado como output exploratório — conflito de nome com RTB_003 sinalizado

### `dim_variavel_IVS_v01r7.md`
Evolução da v01r6 (que já havia corrigido IU_03 e removido RT_06/RT_07).
Refinamentos metodológicos da v01r7:
- `peso_ipea` corrigido para estrutura hierárquica real:
  IU ÷ 3, CH ÷ 8, RT ÷ 5 — pesos por variável distintos entre dimensões
- Fórmulas min-max formalizadas matematicamente para `maior_pior`
  e `maior_melhor`
- Nota de conversão de escala: CH_01 (taxa por 1.000) requer
  conversão antes da normalização
- P10 adicionada às pendências: separar `nivel_analise` em unidade
  de cálculo e unidade de agregação (melhoria futura)

---

## 5. Situação do Projeto — Etapas

| Etapa | Status |
| --- | --- |
| Catálogo de programas (66 programas) | Concluído |
| DIM_ORGAO_EXECUTOR v05 | Concluído |
| DIM_NUCLEO v01 | Concluído |
| REL_PROGRAMA_INDICADOR v01 | Concluído |
| DIM_DINAMICA_METROPOLITANA v03 | Concluído |
| Arquitetura dados IVS v10 | Concluído |
| IPST-H v02 | Concluído |
| Palestra marco 2026 v10 | Concluído |
| Slides SVG bloco IVS (5 slides) | Concluído |
| dim_variavel_IVS_v01r7 | Concluído hoje |
| convencao_nomenclatura_v01 | Concluído hoje |
| matriz_rastreabilidade_operacional_v02 | Concluído hoje |
| Cabeçalho padrão de notebook | Pendente — próxima sessão |
| README.md e docs/ do Jupyter | Pendente — próxima sessão |
| id_programa = SISTEMA em DIM_PROGRAMA | Pendente |
| Dicionário domicilio1/2/3 — variáveis IU | Pendente |
| Reunião com Cláudia — sobreposições territoriais | Bloqueado — externo |
| Sign-off Jesus José — planilha territorial v03 | Pendente |
| Cálculo IVS-H MVP — Produto 1 (CadÚnico) | Próximas sessões |
| Apresentação para equipe da Inclusão | Esta semana |

---

## 6. Agenda para a Próxima Sessão

| Prioridade | Ação |
| --- | --- |
| 1 | Subir os 5 arquivos pendentes no GitHub |
| 2 | Produzir cabeçalho padrão de notebook |
| 3 | Preencher README.md e docs/metodologia_ivsh.md no Jupyter |
| 4 | Resolver conflito de nome `ivs_variaveis.csv` (RTB_020 vs RTB_021) |
| 5 | Iniciar cálculo das 4 variáveis restantes do MVP (CH_05, CH_06, CH_07, RT_04) |

---

## 7. Nota de Encerramento

A sessão de hoje não produziu código — e foi exatamente o que
precisava ser feito. Os três artefatos de governança entregues
valem mais do que uma semana de notebooks sem rastreabilidade.

O risco identificado foi real: sem a matriz e a convenção, o
código produzido nas próximas sessões poderia divergir
silenciosamente de tudo que foi acordado nos últimos meses.
Esse risco foi endereçado antes de acontecer.

O projeto está pronto para receber código com consciência limpa.

---

*Fechamento — Atlas Social de Hortolândia*  
*Sessão de 22 de março de 2026*  
*"Não começamos com promessa. Começamos com prova."*
chamento_dia_22_03_2026.md…]()











[files (1).zip](https://github.com/user-attachments/files/26161486/files.1.zip)
[fechamento_dia_21_03_2026.md](https://github.com/user-attachments/files/26161663/fechamento_dia_21_03_2026.md)
# Fechamento do Dia — 21/03/2026

**Projeto:** Atlas Social de Hortolândia  
**Repositório:** `ailtonfv/Atlas-Social-de-Hortolandia`  
**Sessão:** Sábado, 21 de março de 2026

---

## 1. Contexto da Sessão

Sessão de sábado com dupla frente: leitura e análise das edições do jornal
Tribuna Liberal (21 e 22/03/2026) e avanço conceitual e documental do projeto,
com três entregas principais — IPST-H v02, palestra v10 e cinco slides SVG do
bloco metodológico IVS.

---

## 2. Decisões Definitivas da Sessão

Estas decisões são estruturantes e não devem ser revertidas sem registro explícito.

### 2.1 Arquitetura dos índices — definição final

O Atlas Social opera com dois índices distintos e complementares:

**Índice 1 — IVS (Base Estrutural)**

| Camada | Descrição |
| --- | --- |
| IVS-IPEA | 16 variáveis oficiais, metodologia IPEA, comparabilidade nacional |
| IVS-H | Mesmas 16 variáveis, dados locais, construção progressiva por fases |

O IVS-H não altera o modelo do IPEA. Altera apenas a cobertura de dados.

**Índice 2 — IPST-H (Leitura Operacional)**

Índice próprio municipal. Mede pressão sobre o Estado em três eixos:
pressão territorial, pressão operacional sobre a rede e lacunas de cobertura.

### 2.2 As 16 variáveis oficiais do IVS-IPEA — fechadas

| Dimensão | Código | Variável |
| --- | --- | --- |
| Infraestrutura Urbana | IU_01 | % pessoas em domicílios com água/esgoto inadequados |
| Infraestrutura Urbana | IU_02 | % população urbana sem coleta de lixo |
| Infraestrutura Urbana | IU_03 | % pessoas com renda ≤ ½ SM e deslocamento ao trabalho > 1h |
| Capital Humano | CH_01 | Mortalidade infantil (até 1 ano) |
| Capital Humano | CH_02 | % crianças de 0 a 5 anos fora da escola |
| Capital Humano | CH_03 | % crianças de 6 a 14 anos fora da escola |
| Capital Humano | CH_04 | % mulheres de 10 a 17 anos que tiveram filhos |
| Capital Humano | CH_05 | % mães chefes de família, sem fund. completo, filho < 15 anos |
| Capital Humano | CH_06 | Taxa de analfabetismo — 15 anos ou mais |
| Capital Humano | CH_07 | % crianças em domicílios sem morador com fund. completo |
| Capital Humano | CH_08 | % jovens 15–24 que não estudam, não trabalham, renda ≤ ½ SM |
| Renda e Trabalho | RT_01 | % pessoas com renda domiciliar per capita ≤ ½ SM |
| Renda e Trabalho | RT_02 | Taxa de desocupação — 18 anos ou mais |
| Renda e Trabalho | RT_03 | % pessoas 18+ sem fund. completo em ocupação informal |
| Renda e Trabalho | RT_04 | % pessoas em domicílios com renda ≤ ½ SM dependentes de idosos |
| Renda e Trabalho | RT_05 | Taxa de atividade de crianças de 10 a 14 anos (trabalho infantil) |

### 2.3 Estrutura de fases do IVS-H

- **Fase 1 — MVP:** 5 variáveis imediatamente disponíveis no CadÚnico
  (CH_05, CH_06, CH_07, RT_01, RT_04)
- **Fase 2 — Expansão:** variáveis adicionais conforme acesso às fontes
- **Fase 3 — Horizonte metodológico** (não é fase operacional):
  *"O modelo converge para a incorporação das 16 variáveis do IVS/IPEA
  à medida que as fontes forem disponibilizadas, preservando a estrutura
  original do índice."*

### 2.4 Frase síntese oficial IVS × IPST-H

> *"O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde a
> vulnerabilidade se transforma em pressão sobre o Estado."*

### 2.5 RT_06 e RT_07 — destino definido

RT_06 (deslocamento para trabalho) e RT_07 (deslocamento para estudo)
**não pertencem ao IVS-H**. Pertencem ao IPST-H (eixo Pressão
Territorial, variáveis PT_05 e PT_06). O IVS-H preserva as 16
variáveis do IPEA sem acréscimos.

---

## 3. Arquivos Produzidos

| Arquivo | Versão | Destino no Repositório | Status |
| --- | --- | --- | --- |
| `ipst_h_v01.md` | v01 | `01_modelagem_conceitual/` | Commitado |
| `ipst_h_v02.md` | v02 | `01_modelagem_conceitual/` | Aguarda upload |
| `palestra_marco_2026_v10.md` | v10 | `00_governança/` | Aguarda upload |
| `slide_07_ivs_ipea.svg` | v01 | uso externo / PowerPoint | Gerado |
| `slide_10_ivsh_proposta.svg` | v01 | uso externo / PowerPoint | Gerado |
| `slide_10a_tres_indices.svg` | v01 | uso externo / PowerPoint | Gerado |
| `slide_10b_comparativo.svg` | v01 | uso externo / PowerPoint | Gerado |
| `slide_10c_dois_indices.svg` | v01 | uso externo / PowerPoint | Gerado |

### Pendência crítica

A `dim_variavel_IVS_v01r5.md` precisa de revisão para v01r6:

- Restaurar IU_03 na dimensão Infraestrutura Urbana
- Remover RT_06 e RT_07 do arquivo (pertencem ao IPST-H)
- Ajustar total de variáveis IVS-H para 16 (não 17)

---

## 4. O que Mudou em Cada Arquivo

### `ipst_h_v02.md`

Alterações em relação à v01:

- Eixo 2 renomeado: "Sobrecarga da Rede" → "Pressão Operacional sobre a Rede"
- PT_01 redefinido: proporção sobre população total → densidade sobre
  domicílios Censo 2022 (CadÚnico ≠ população total)
- Seção 2 expandida: CadÚnico como demanda identificada, não demanda real
- Seção 3 criada: "O que o IPST-H NÃO é" — 4 itens com justificativa
  (não é ranking, não é avaliação, não é punição, não é produtividade)
- Pesos: de fixos para "pesos iniciais sugeridos (MVP)" com nota de
  recalibração empírica
- Frase síntese atualizada para versão definitiva

### `palestra_marco_2026_v10.md`

Alterações em relação à v09:

- Público redefinido: secretário adjunto, diretores e corpo técnico da Inclusão
- Slide 1 reescrito: abre com a pergunta da rede, não com argumento metodológico
- Slide 10 reescrito: pesos como leitura progressiva (sem calibração prematura)
- Slide 10a criado: três índices, três funções
- Slide 10c criado: dois índices para o público da Inclusão + matriz IVS-H × IPST-H
- Slides 12, 13, 15, 18: reescritos com vocabulário da rotina da Inclusão
  (fila invisível, busca ativa, cobertura, lacuna, priorização)
- Slide 16 reescrito: Inclusão como núcleo de inteligência social do município
- Slide 20 reescrito: argumento para a Secretaria (não para o prefeito)
- Slide 22 expandido: frase de fechamento adicional
- Slide 23 expandido: decisões práticas da Inclusão
- Referências ao número de variáveis removidas da palestra

---

## 5. Análise do Jornal — Tribuna Liberal 21 e 22/03/2026

### Itens com impacto direto no projeto

**Hortolândia — alta relevância:**

- Exposição "Mulheres que Inspiram" (SMIDS/DPP PcD) — abre segunda-feira (23/03)
  no Palácio dos Migrantes. Quézia Garcia (DPP PcD) citada nominalmente.
- Reajuste do funcionalismo: Lei 4.606/2026 — 2,51% para 5.200 servidores,
  IPCA de 10 meses (data-base antecipada para março por período eleitoral).
- Residencial sênior Terça da Serra — segunda unidade no Parque Ortolândia,
  30 leitos. Contexto: envelhecimento demográfico, Economia Prateada,
  impacto futuro em RT_04.
- Saúde recebeu equipamentos na 17ª Caravana Federativa — fisioterapia,
  reabilitação, oftalmologia. Impacta capacidade de resposta Capital Humano.

**Região — relevância contextual:**

- Paradoxo hídrico bacias PCJ — rios cheios mas risco estrutural de longo prazo.
  Sustenta peso reduzido mas não nulo de IU no IVS-H.
- SEAS de Sumaré amplia abordagem social via Bom Prato — modelo operacional
  comparativo para o eixo SR do IPST-H.

---

## 6. Situação do Projeto — Etapas

| Etapa | Status |
| --- | --- |
| Catálogo de programas (66 programas) | Concluído |
| DIM_ORGAO_EXECUTOR v05 | Concluído |
| DIM_NUCLEO v01 | Concluído |
| REL_PROGRAMA_INDICADOR v01 | Concluído |
| DIM_DINAMICA_METROPOLITANA v03 | Concluído |
| Arquitetura dados IVS v10 | Concluído |
| IPST-H v02 | Concluído hoje |
| Palestra marco 2026 v10 | Concluído hoje |
| Slides SVG bloco IVS (5 slides) | Concluído hoje |
| dim_variavel_IVS_v01r6 | Pendente — próxima sessão |
| id_programa = SISTEMA em DIM_PROGRAMA | Pendente |
| Dicionário domicilio1/2/3 — variáveis IU | Pendente |
| Reunião com Cláudia — sobreposições territoriais | Bloqueado — externo |
| Sign-off Jesus José — planilha territorial v03 | Pendente |
| Cálculo IVS-H MVP — Produto 1 (CadÚnico) | Próximas sessões |
| Apresentação para equipe da Inclusão | Esta semana |

---

## 7. Agenda para a Próxima Sessão

| Prioridade | Ação |
| --- | --- |
| 1 | Subir `ipst_h_v02.md` e `palestra_marco_2026_v10.md` no GitHub |
| 2 | Produzir `dim_variavel_IVS_v01r6.md` — restaurar IU_03, remover RT_06/RT_07, ajustar total para 16 |
| 3 | Adicionar `id_programa = SISTEMA` em DIM_PROGRAMA |
| 4 | Verificar dicionário domicilio1/2/3 — localizar IU_01, IU_02 |
| 5 | Preparar apresentação para equipe da Inclusão |
| 6 | Retomar pipeline IVS-H — avançar no Produto 1 (5 variáveis CadÚnico) |

---

## 8. Nota Estratégica — Apresentação para a Inclusão

A sessão produziu três argumentos novos especificamente calibrados para
o público técnico da Secretaria:

1. **A frase da rede:** *"A rede já conhece muitos casos. O problema é
   transformar esse conhecimento disperso em leitura territorial
   comparável e acionável."* — posiciona o Atlas Social como
   organização do que já existe, não como descoberta externa.

2. **O IPST-H como instrumento de proteção:** o índice mede condições
   estruturais do território — não desempenho de equipes. Alta pressão
   é argumento para reforço, nunca para responsabilização.

3. **Três promessas práticas:** o Atlas Social ajuda a enxergar melhor,
   priorizar territórios e comprovar resultados. Cada uma tem resposta
   direta para a rotina do CRAS.

---

*Fechamento — Atlas Social de Hortolândia*  
*Sessão de 21 de março de 2026*
