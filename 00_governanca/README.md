[diretrizes_estrategicas_v03.md](https://github.com/user-attachments/files/26059661/diretrizes_estrategicas_v03.md)
# Diretrizes Estratégicas — Registro de Decisões
**Data de criação:** "27/02/2026"
**Última atualização:** "17/03/2026"
**Versão:** 03
**Responsável:** Ailton Vendramini
**Status:** Diretrizes aprovadas — em implementação

---

## Diretriz 1 — Staging é obrigatório na arquitetura

### O que é
Staging é a camada intermediária entre o dado bruto recebido e o modelo analítico. Todo dado externo (CadÚnico, CAGED, sistemas municipais) deve passar por essa camada antes de qualquer transformação.

### Por que é importante
O CadÚnico chega com 677 variações de nome de bairro, CPFs incompletos, campos vazios e inconsistências diversas. O staging preserva o dado exatamente como veio — antes de qualquer limpeza ou padronização. Se um número for questionado, é possível rastrear até o dado original e demonstrar de onde veio.

### Posição na arquitetura

```
Fonte bruta (CECAD, CSV, XLS)
        ↓
   STAGING — dado original, intocado
        ↓
   Trusted Layer — dado limpo e padronizado
        ↓
   Modelo analítico — DIM + FATO
        ↓
   Indicadores e painel
```

### Onde implementar
A camada de staging deve ser formalizada na pasta `02_modelagem_lógica` como parte do esquema SQL. Cada carga de dados externa gera uma tabela de staging correspondente antes de qualquer transformação.

> **Atualização v02:** A pasta `02_modelagem_lógica` foi criada e contém o primeiro
> arquivo do modelo analítico: `dim_variavel_IVS.md` (v01, "09/03/2026"), com 16
> variáveis do IVS/IPEA organizadas em 3 dimensões. O schema SQL formal é o próximo
> passo desta camada.

> **Conexão com o Atlas Social:** Os campos `fonte_calculo`, `data_referencia` e
> `versao_calculo` obrigatórios nas tabelas fato (`fato_ivs_loteamento`,
> `fato_ivs_municipio`) implementam diretamente esta diretriz — garantindo que
> cada cálculo do IVS-H seja rastreável até sua fonte bruta original.
> Ver `arquitetura_dados_IVS_IBGE_Horto_v09.md`, Seção 8.

---

## Diretriz 2 — O sistema deve responder: quais benefícios o vulnerável está acessando?

### O problema
Hoje a Secretaria de Inclusão não consegue responder com precisão:
- Quais programas uma família está acessando simultaneamente
- Quais benefícios ela recebe (cesta básica, BPC, Bolsa Família, vaga em creche, etc.)
- Qual é a renda total da família considerando todos os benefícios
- Se essa renda já ultrapassa o critério de elegibilidade do CadÚnico

### Unidade mínima de análise: a PESSOA

A cadeia analítica começa sempre pela **Pessoa** — não pela família. A família é uma agregação de pessoas. Isso importa porque:

- O BPC é concedido por **pessoa** (não por família)
- A deficiência pertence a uma **pessoa** específica
- A inserção no mercado formal acontece com uma **pessoa** com CPF
- A duplicação de benefício é cometida por uma **pessoa** identificável

```
Pessoa (CPF)
  └── pertence a → Família
        └── reside em → Loteamento
              └── referenciado a → CRAS (Núcleo)
                    └── acessa → Programas e Benefícios
```

### O que o sistema deve permitir

**Visão por pessoa e família:**
```
Pessoa → CPF → Família X — Loteamento Y — CRAS Z
├── Pessoa A (responsável familiar)
│   └── PAIF: em acompanhamento
├── Pessoa B (membro — deficiência)
│   └── BPC: R$ 1.412/mês
├── Pessoa C (criança)
│   └── Vaga na rede pública: sim
├── Família (unidade)
│   ├── Bolsa Família: R$ 600/mês
│   └── Cesta básica: 1x/mês
└── Renda per capita total estimada: R$ X
    └── Situação: dentro / limiar / acima do critério CadÚnico
```

**Visão por programa:**
- Quantas pessoas e famílias estão no Programa X
- Quantos benefícios distintos cada pessoa acessa
- Cruzamento: quem está em múltiplos programas
- Quais pessoas acumulam benefícios indevidamente (duplicação por CPF)

### A pergunta estratégica central
> Quando essa pessoa — e sua família — deve ou pode sair do CadÚnico?

Não é expulsão — é **emancipação planejada**. O sistema precisa identificar pessoas que já atingiram condições de transição e acompanhar sua saída para autonomia.

### Critério de emancipação — a definir

O critério formal que determina quando uma família está pronta para transição
**será definido em fase posterior do projeto**, com participação das secretarias
envolvidas (Inclusão, Desenvolvimento Econômico, Saúde). Possíveis dimensões a
considerar:

- Renda per capita familiar em relação ao critério CadÚnico
- Tempo de atendimento contínuo sem progressão de renda
- Existência de vínculo formal ativo (CAGED) de pelo menos um membro
- Acesso a programa de qualificação profissional concluído

> Esta lacuna é registrada para não permanecer indefinidamente em aberto.
> A definição do critério é requisito para o Produto 3 (IVS-H Consolidado Territorial).

### Integração com Secretaria de Desenvolvimento Econômico
Esta diretriz conecta diretamente a Secretaria de Inclusão com a Secretaria de Desenvolvimento Econômico. O fluxo proposto:

```
Inclusão identifica família em condição de transição
        ↓
Desenvolvimento Econômico aciona parceiros (indústria, comércio local)
        ↓
Vagas de emprego + treinamentos específicos gerados
        ↓
Vulnerável entra no mercado formal
        ↓
CAGED confirma vínculo → família sai da fila
        ↓
Vaga liberada para quem ainda precisa
```

Isso transforma a assistência social de **sistema de manutenção** em **sistema de emancipação**.

### Implementação futura
Esta visão será implementada na fase de enriquecimento externo (Camada 4 da arquitetura), cruzando:
- CadÚnico → benefícios federais
- SIBEC → Bolsa Família ativo
- Sistemas municipais → programas locais
- CAGED → inserção no mercado formal

---

## Diretriz 3 — O número 72.424 é enganoso: o sistema tem vazamentos graves

### O problema real
Hortolândia tem 72.424 pessoas inscritas no CadÚnico (dado dez/2025). Mas esse número **não significa** que 72.424 pessoas estão sendo atendidas pela política social municipal.

Existem pelo menos três distorções graves:

**Distorção 1 — Cadastros desatualizados**
Pessoas que mudaram de situação (conseguiram emprego, aumentaram renda, saíram do município) mas permanecem no cadastro. O dado de dez/2025 já mostrou isso: 25.395 pessoas classificadas como "acima do perfil" ainda constam no CadÚnico.

**Distorção 2 — Duplicação de benefícios**
O sistema atual é deficiente o suficiente para permitir que um mesmo vulnerável retire, por exemplo, mais de uma cesta básica — deixando outro sem receber. Isso não é necessariamente fraude: é falha de controle. Sem cruzamento de CPF entre programas, a duplicação é invisível para a gestão.

**Distorção 3 — Subatendimento invisível**
Famílias que estão no CadÚnico, são elegíveis, mas nunca foram alcançadas por nenhum serviço. O dado de dez/2025 mostrou que a maioria das 72.424 pessoas não tem CRAS de referência preenchido — o que sugere que uma parcela significativa nunca teve contato ativo com a rede.

### O que o sistema precisa revelar

| Grupo | Descrição | Ação |
|---|---|---|
| Atendidos adequadamente | Cadastro ativo + programas compatíveis com perfil | Monitorar |
| Em transição | Renda próxima ao limite + algum programa produtivo | Acompanhar emancipação |
| Acima do perfil | Renda já supera critério | Revisão cadastral |
| Duplicados | Recebendo o mesmo benefício mais de uma vez | Correção imediata |
| Subatendidos | No cadastro, elegíveis, sem nenhum serviço ativo | Busca ativa |
| Desatualizados | Sem atualização cadastral há mais de 48 meses | Convocação |

### A pergunta que a gestão precisa conseguir responder
> "Das 72.424 pessoas no CadÚnico, quantas estão recebendo algum benefício municipal hoje — e quantas não estão recebendo nada?"

Essa pergunta simples, respondida com dados reais, já justifica o projeto inteiro para a Secretaria de Inclusão.

---

## Síntese das três diretrizes

| Diretriz | Problema que resolve | Fase de implementação |
|---|---|---|
| Staging | Rastreabilidade e auditabilidade do dado bruto | MVP — modelagem lógica |
| Visão de benefícios por **pessoa** e família | Gestão integrada e emancipação planejada | Fase 2 — enriquecimento |
| Controle de duplicação e subatendimento | Eficiência e equidade na distribuição de benefícios | MVP — primeiros indicadores |

> **Princípio permanente:** A unidade mínima de análise é sempre a **Pessoa**.
> A Família é uma agregação de pessoas. O Loteamento é a unidade territorial de
> referência. Tudo começa com a Pessoa.

### Conexão com o Atlas Social de Hortolândia

Estas três diretrizes são os fundamentos operacionais do Atlas Social:

| Diretriz | Componente do Atlas Social |
|----------|---------------------------|
| Staging obrigatório | Campos `fonte_calculo` + `data_referencia` + `versao_calculo` nas tabelas fato — `arquitetura_dados_IVS_IBGE_Horto_v09.md`, Seção 8 |
| Visão por pessoa e família | Cadeia `Pessoa → Família → Loteamento` — unidade primária do IVS-H |
| Controle de duplicação e subatendimento | Grupo "subatendidos" da Diretriz 3 = territórios com IVS-H alto + zero programas ativos — primeiro resultado do IVS-H parcial (Produto 1) |

> A pergunta da Diretriz 3 — *"quantas pessoas não estão recebendo nada?"* —
> é a que o IVS-H parcial começa a responder no Produto 1.
> O grupo "subatendidos" cruzado com o mapa de loteamentos é o primeiro
> entregável com valor político imediato para a Secretaria de Inclusão.

---

*Registro gerado a partir de discussão estratégica em "27/02/2026".*
*Atualizado em "09/03/2026" (v02): correção terminológica (Território → Loteamento/Núcleo),
atualização do número CadÚnico (72.424), remoção de referência ao ACERTE, registro do
avanço na 02_modelagem_lógica.*
*Atualizado em "17/03/2026" (v03): Diretriz 1 — conexão explícita com campos temporais
das tabelas fato (arquitetura_dados_IVS_IBGE_Horto_v09.md, Seção 8). Diretriz 2 —
seção "Critério de emancipação" adicionada: lacuna registrada formalmente com as
dimensões possíveis e dependência do Produto 3. Síntese — tabela de conexão com o
Atlas Social adicionada: cada diretriz ancorada no componente técnico correspondente.*
*Estas diretrizes orientam as decisões técnicas das próximas fases do projeto.*
