[conceito_vulnerabilidade_v02.md](https://github.com/user-attachments/files/26125868/conceito_vulnerabilidade_v02.md)[Uploading concei# Conceito de Vulnerabilidade Social — Atlas Social de Hortolândia
**Arquivo:** `conceito_vulnerabilidade_v02.md`
**Localização:** `01_modelagem_conceitual/`
**Versão:** 02 | **Data:** "19/03/2026"
**Responsável:** Ailton Vendramini / Claude (Anthropic)

**Atualizações v02:**
- Duas definições distintas: vulnerabilidade contextual (A) e individual (B)
- Marcações de origem: [GF], [IPEA], [Local]
- Renda em B marcada como [futuro] com justificativa metodológica completa
- Distinção domicílio × entorno formalizada
- Estratégia de triangulação de renda documentada
- Relação com convênios institucionais explicitada

---

## 1. Por que este documento existe

O governo federal opera com definições de vulnerabilidade **fragmentadas por sistema** — cada programa tem seu critério. O CadÚnico usa renda per capita. O SUAS usa fragilização de vínculos. O IVS-IPEA usa índice territorial composto. Nenhum deles, isoladamente, responde à pergunta que a gestão municipal precisa fazer:

> *"Quem são as pessoas mais vulneráveis de Hortolândia, onde estão, e o Estado está chegando até elas?"*

Este documento estabelece a **definição operacional unificada** adotada pelo Atlas Social — articulando os critérios federais existentes com decisões metodológicas locais, e sendo explícito sobre o que é cada coisa.

---

## 2. Duas Definições Necessárias

O projeto adota duas definições complementares de vulnerabilidade, que operam em escalas diferentes e respondem perguntas distintas:

```
┌─────────────────────────────────────────────────────────────┐
│  (A) Vulnerabilidade Contextual — IVS-H                     │
│  Nível: Loteamento / Núcleo / RP                            │
│  Pergunta: ONDE o problema está?                            │
│  Instrumento: IVS-H (Índice de Vulnerabilidade Social)      │
├─────────────────────────────────────────────────────────────┤
│  (B) Vulnerabilidade Individual                             │
│  Nível: Pessoa / Família                                    │
│  Pergunta: QUEM precisa de intervenção?                     │
│  Instrumento: Score de vulnerabilidade individual           │
└─────────────────────────────────────────────────────────────┘

        B é uma decomposição operacional de A.
```

O IVS-H (A) aponta o território. O score individual (B) identifica, dentro desse território, as pessoas e famílias prioritárias. Os dois instrumentos se alimentam mutuamente — não são concorrentes.

### Correspondência entre as dimensões

| IVS-H (A) — linguagem IPEA | Pessoa (B) — linguagem operacional |
|---|---|
| Capital Humano | Educação + Estrutura familiar |
| Infraestrutura Urbana | Condições do entorno |
| Renda e Trabalho | Renda *(futuro — ver Seção 5)* |

---

## 3. Definição A — Vulnerabilidade Contextual (IVS-H)

> **Um loteamento é vulnerável quando apresenta concentração de privações
> nas dimensões de Capital Humano, Infraestrutura Urbana e Renda e
> Trabalho, medidas pelo IVS-H.**

Os eixos, variáveis e pesos estão especificados em
`dim_variavel_IVS_v01r5.md` e `ivs_vs_ivsh_comparativo_v05.md`.
Este documento não repete essa especificação — apenas posiciona
conceitualmente o IVS-H na arquitetura analítica do projeto.

**Fontes principais:** CadÚnico agregado + IBGE Censo 2022
**Frequência de atualização:** Semestral (CadÚnico) / Decenal (IBGE)
**Produto:** Mapa de vulnerabilidade por loteamento e RP

---

## 4. Definição B — Vulnerabilidade Individual

> **Pessoa vulnerável é aquela exposta a múltiplos fatores de privação
> simultaneamente, nos eixos de educação, estrutura familiar e condições
> do entorno.**

A vulnerabilidade não é binária — não se está vulnerável ou não
vulnerável. É uma **gradação** determinada pelo acúmulo de fatores de
privação. Nenhum fator isolado classifica uma pessoa como vulnerável.

### 4.1 Origem dos critérios — marcações

Cada fator de risco é marcado com sua origem:

- **`[GF]`** — Critério explícito do Governo Federal (CadÚnico, SUAS, normativas MDS)
- **`[IPEA]`** — Variável da metodologia IVS-IPEA (2015)
- **`[Local]`** — Decisão metodológica do Atlas Social de Hortolândia

### 4.2 Eixo 1 — Educação

Privações que comprometem a capacidade de superação da vulnerabilidade
no longo prazo. Corresponde ao eixo **Capital Humano** do IVS-H.

| Fator de risco | Origem | Variável IVS-H |
|---|---|---|
| Responsável sem ensino fundamental completo, com filho menor de 15 anos | `[IPEA]` `[GF]` | CH_05 |
| Analfabetismo — não sabe ler ou escrever, 15 anos ou mais | `[IPEA]` `[GF]` | CH_06 |
| Criança em domicílio sem nenhum morador com fundamental completo | `[IPEA]` | CH_07 |
| Gravidez na adolescência | `[IPEA]` | CH_04 |

> **O que o governo federal define aqui:** O CadÚnico coleta escolaridade
> do responsável familiar e de todos os membros. A Tipificação SUAS
> (CNAS 109/2009) inclui "precário acesso a serviços públicos" — onde
> educação está implícita. O critério de mãe sem fundamental com filho
> menor é explicitamente usado como indicador de vulnerabilidade
> intergeracional pelo IPEA.

### 4.3 Eixo 2 — Estrutura Familiar

Configurações familiares que amplificam o risco social e a dependência
de serviços públicos. Corresponde à parte demográfica do eixo
**Capital Humano** do IVS-H.

| Fator de risco | Origem | Critério operacional |
|---|---|---|
| Monoparentalidade | `[GF]` `[IPEA]` | Responsável sem cônjuge com filho(s) e/ou enteado(s) |
| Dependência de idosos | `[IPEA]` | Domicílio com renda principal proveniente de idoso |
| Alta razão de dependência | `[Local]` | Mais de 3 dependentes por responsável |
| Família unipessoal em situação de risco | `[GF]` | Pessoa sozinha sem renda formal identificada |

> **O que o governo federal define aqui:** A monoparentalidade é
> reconhecida pelo SUAS como fator de vulnerabilidade no PAIF. A
> dependência de idosos está explícita na variável RT_04 do IPEA. A
> alta razão de dependência (mais de 3 dependentes) é **decisão local**
> — o governo federal não usa esse limiar explicitamente, mas ele
> emerge como padrão nos dados de Hortolândia.

### 4.4 Eixo 3 — Condições do Entorno

Privações de infraestrutura que agravam a vulnerabilidade e limitam as
condições de vida. Corresponde ao eixo **Infraestrutura Urbana** do IVS-H.

| Fator de risco | Origem | Referência |
|---|---|---|
| Sem esgotamento sanitário adequado | `[IPEA]` `[GF]` | IU_02 |
| Sem coleta de lixo regular | `[IPEA]` `[GF]` | IU_01 |
| Sem acesso adequado à água | `[IPEA]` `[GF]` | IU_01 |
| Esgoto a céu aberto no entorno do domicílio | `[Local]` | v05215 (IBGE Censo 2022) |
| Coabitação — múltiplas famílias no mesmo endereço | `[Local]` | DIM_DOMICILIO |

> **Distinção fundamental:**
>
> **Domicílio** → condições internas à moradia → responsabilidade do
> indivíduo e da família.
>
> **Entorno** → condições externas à moradia (esgoto, lixo, pavimentação,
> iluminação) → **responsabilidade da Prefeitura**.
>
> Quando o IVS-H aponta vulnerabilidade de entorno elevada em um
> loteamento, o Estado não pode atribuir isso à família — é dele a
> obrigação de agir.

> **O que o governo federal define aqui:** Os indicadores de saneamento
> e coleta de lixo são usados tanto pelo IPEA quanto pelos critérios do
> SNIS (Sistema Nacional de Informações sobre Saneamento). A variável
> v05215 (esgoto a céu aberto no entorno) e a coabitação são
> **contribuições locais** do Atlas Social — o governo federal usa
> indicadores agregados municipais, que escondem os bolsões internos de
> privação. A análise do Censo 2022 de Hortolândia identificou 9 setores
> censitários com 100% de esgoto a céu aberto no entorno, dentro de um
> município com média geral de 97,59% de cobertura de esgoto — bolsão
> invisível no agregado municipal.

---

## 5. Eixo 4 — Renda (futuro)

A renda é o eixo mais direto de vulnerabilidade — e o mais problemático
do ponto de vista da qualidade do dado. Por isso ocupa seção própria.

### 5.1 O critério federal

O governo federal define elegibilidade ao CadÚnico por renda per capita
domiciliar:

- Até **½ salário mínimo** por pessoa → elegível ao Bolsa Família
- Até **3 salários mínimos** (total familiar) → elegível ao cadastro

**Exemplo operacional:** Uma família com renda bruta de R$ 3.200/mês e
4 moradores tem renda per capita de R$ 800 — abaixo do limiar de ½ SM
(R$ 811 em 2026). Essa família **é elegível e deve ser tratada como
vulnerável no eixo renda**, independentemente do valor bruto declarado
pelo responsável.

### 5.2 O problema da renda autodeclarada

A renda registrada no CadÚnico é **autodeclarada pela família** no
momento do cadastro ou atualização. Isso cria três problemas
documentados:

**Subdeclaração deliberada:** A família sabe que declarar renda abaixo
de ½ SM mantém o acesso a benefícios. O incentivo para subdeclarar é
real e reconhecido pelo próprio MDS. Uma família pode declarar R$ 400
de renda per capita quando a renda real é R$ 900.

**Desatualização:** O cadastro pode ter sido realizado há dois ou três
anos. A renda declarada era a da época. Hoje a pessoa pode estar
empregada formalmente, desempregada ou com renda completamente
diferente — e o dado original permanece no sistema sem atualização.

**Renda informal não declarada:** Trabalho por diária, bico, prestação
de serviços, economia informal — não aparecem na declaração. Em
Hortolândia, com informalidade coexistindo com polo industrial formal,
esse gap é estrutural.

### 5.3 Estratégia de triangulação — MVP expandido

A solução não é substituir a renda declarada do CadÚnico, mas
**triangulá-la** com fontes externas:

```
Renda declarada CadÚnico (autodeclarada)
    +
Vínculo formal CAGED (existe ou não existe — e qual salário)
    +
Benefício recebido SIBEC (Bolsa Família, BPC)
    =
Renda estimada com maior confiabilidade
```

Se uma pessoa tem vínculo formal registrado no CAGED com salário de
R$ 3.200 e declarou R$ 400 per capita no CadÚnico, há uma
inconsistência que pode ser sinalizada para revisão técnica — sem
acusação, como alerta de qualidade cadastral.

| Fonte | O que oferece | Limitação |
|---|---|---|
| CadÚnico | Renda declarada pela família | Autodeclarada — sujeita a subdeclaração |
| CAGED `[GF]` | Renda formal registrada em carteira | Só emprego formal — não captura informalidade |
| RAIS `[GF]` | Histórico de vínculos formais | Defasagem de até 1 ano |
| SIBEC `[GF]` | Valor do benefício recebido | Só beneficiários Bolsa Família |
| BPC/DATAPREV `[GF]` | Valor do BPC pago | Requer convênio INSS |

### 5.4 Dependência de convênios institucionais

A triangulação de renda depende diretamente dos convênios federais
listados na apresentação de março de 2026:

- **MTE/CAGED** → vínculo formal e salário declarado
- **INSS/DATAPREV** → BPC e histórico contributivo

Enquanto esses convênios não estiverem formalizados, a renda permanece
como `[futuro]` na definição B — presente conceitualmente, ausente
operacionalmente.

> **Nota para a gestão:** A imprecisão da renda autodeclarada não é
> falha do Atlas Social — é uma limitação estrutural do CadÚnico
> reconhecida nacionalmente. O projeto documenta essa limitação com
> transparência e apresenta o caminho para superá-la. Isso é diferente
> de ignorá-la.

---

## 6. O que o governo federal define vs. o que o Atlas Social adiciona

| Dimensão | Critério federal existente | Contribuição local `[Local]` | O que perderíamos sem ela |
|---|---|---|---|
| Educação | Escolaridade do responsável (CadÚnico) | — | — |
| Estrutura familiar | Monoparentalidade, dependência de idosos | Alta razão de dependência (>3 dep.) | Famílias numerosas em risco não capturadas |
| Condições do entorno | Saneamento agregado municipal | v05215 — esgoto a céu aberto por setor / Coabitação | Bolsões internos de privação invisíveis no agregado |
| Renda | Renda per capita ≤ ½ SM (autodeclarada) | Triangulação CAGED + SIBEC | Subdeclaração e desatualização não detectadas |
| Mobilidade | Não existe critério federal | RT_06 (trabalho fora) / RT_07 (estudo fora) | 58.472 deslocamentos diários de Hortolândia ignorados |
| Gradação | Elegível / não elegível (binário) | Score com 4 faixas de intensidade | Priorização dentro do universo cadastrado impossível |
| Temporal | Foto estática | Monitoramento de saída da vulnerabilidade | Impossível medir se as políticas estão funcionando |

**Conclusão:** Usar exclusivamente os critérios federais significaria
ter um sistema que identifica os mesmos beneficiários que o governo
federal já identifica — sem nenhuma inteligência adicional para a
gestão municipal. O valor do Atlas Social está nas contribuições
`[Local]`, que tornam visível o que as definições nacionais não
conseguem enxergar na escala do município.

---

## 7. Score de Vulnerabilidade Individual

### 7.1 Princípio

Cada pessoa recebe um **score** baseado na presença de fatores de risco
nos eixos disponíveis (educação, estrutura familiar, condições do
entorno). O score não é julgamento moral — é classificação operacional
para priorização de política pública.

### 7.2 Classificação por faixa

| Faixa | Classificação | Implicação operacional |
|---|---|---|
| 0 — 1 fator | Baixa vulnerabilidade | Monitoramento preventivo |
| 2 — 3 fatores | Média vulnerabilidade | Acompanhamento ativo — PAIF |
| 4 — 5 fatores | Alta vulnerabilidade | Prioridade — PAIF intensivo / PAEFI |
| 6+ fatores | Vulnerabilidade crítica | Ação imediata — intersetorialidade obrigatória |

### 7.3 Relação entre A e B

```
IVS-H alto no loteamento (A)
    → identifica onde concentrar recursos
        → score individual (B)
            → identifica quem dentro do loteamento
                → priorização operacional da equipe do CRAS
```

---

## 8. Aplicações

### 8.1 Identificação de público prioritário `[GF]` `[Local]`
Famílias com score elevado em loteamentos com IVS-H crítico são
candidatas prioritárias a inclusão no PAIF, encaminhamento ao PAEFI,
acesso a transferência de renda e busca ativa.

### 8.2 Cruzamento com serviços `[Local]`
O score permite responder: quais famílias vulneráveis **não** estão
sendo atendidas? Há concentração de casos críticos em loteamentos sem
cobertura adequada? Quais programas estão alcançando os fatores de
risco corretos?

### 8.3 Monitoramento de saída da vulnerabilidade `[Local]`

**Esta é a aplicação mais inovadora do projeto** — inexistente nos
índices nacionais, incluindo o IVS-IPEA, que medem vulnerabilidade de
forma estática.

O Atlas Social mede **mobilidade social**:

```
Pessoa vulnerável
    → recebe serviço / programa
        → reavaliação periódica do score
            → score reduz
                → saída monitorada e documentada
```

Isso permite responder:
- Quantas pessoas saíram da vulnerabilidade no último semestre?
- Quais programas estão associados à redução do score?
- A saída é sustentável ou há reincidência?

> Esta aplicação depende da atualização periódica do CadÚnico e da
> integração com CAGED. É produto do MVP expandido.

---

## 9. Relação com Outros Documentos do Projeto

| Documento | Relação |
|---|---|
| `glossario_conceitual_v01.md` | Definições de Pessoa, Família, Domicílio |
| `dim_variavel_IVS_v01r5.md` | Especificação técnica das variáveis CH, RT, IU |
| `ivs_vs_ivsh_comparativo_v05.md` | Comparação IVS-IPEA × IVS-H — eixo A |
| `ind_densidade_vulnerabilidade_v02.md` | Indicador territorial que agrega o eixo A |
| `nota_tecnica_ibge_censo2022_entorno.md` | Origem e validação da variável v05215 |
| `03_indicadores_mvp/README.md` | Posição deste conceito na cadeia analítica |

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | "19/03/2026" | Criação — conceito, quatro eixos, score, três aplicações |
| v02 | "19/03/2026" | Reescrita completa. Duas definições A e B. Marcações [GF][IPEA][Local]. Renda separada como seção própria com justificativa de subdeclaração e estratégia de triangulação. Distinção domicílio × entorno formalizada. Tabela comparativa federal × local. |

---

*Documento técnico vivo — Projeto Atlas Social de Hortolândia*
*Versão 02 — base conceitual para os indicadores do MVP*
to_vulnerabilidade_v02.md…]()
