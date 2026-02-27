# 00 — Governança e Direção Arquitetural

---

## 1. Princípios Arquiteturais

- Pessoa → Família → Território como eixo estruturante  
- Separação entre ambiente conceitual e ambiente técnico  
- Evolução incremental (MVP → Escala)  
- Interoperabilidade como direção central  
- Arquitetura independente de sistemas legados  

---

## 2. LGPD e Ética de Dados

- Nenhum dado pessoal armazenado no repositório  
- Uso exclusivo de amostras sintéticas  
- Estrutura preparada para controle de acesso  
- Rastreabilidade e auditabilidade  

---

## 3. Escopo do MVP

- 3 dimensões principais  
- 1 fato central  
- 3 indicadores estratégicos  
- 1 dashboard simples  
- 1 documento técnico  

---

## 4. Premissas

- Não dependência inicial de convênios federais  
- Prioridade para bases municipais disponíveis  
- Arquitetura preparada para futura integração via API

---

# Diretrizes Estratégicas — Registro de Decisões
**Data:** 27/02/2026  
**Responsável:** Ailton Vendramini  
**Status:** Diretrizes aprovadas — a implementar nas próximas fases

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

---

## Diretriz 2 — O sistema deve responder: quais benefícios o vulnerável está acessando?

### O problema
Hoje a Secretaria de Inclusão não consegue responder com precisão:
- Quais programas uma família está acessando simultaneamente
- Quais benefícios ela recebe (cesta básica, BPC, Bolsa Família, vaga em creche, etc.)
- Qual é a renda total da família considerando todos os benefícios
- Se essa renda já ultrapassa o critério de elegibilidade do CadÚnico

### O que o sistema deve permitir

**Visão por família:**
```
Família X — Bairro Y — CRAS Z
├── Bolsa Família: R$ 600/mês
├── BPC (membro com deficiência): R$ 1.412/mês
├── Cesta básica: 1x/mês
├── Criança na rede pública: sim
├── Adulto no ACERTE: sim
├── Renda per capita total estimada: R$ X
└── Situação em relação ao critério CadÚnico: dentro / limiar / acima
```

**Visão por programa:**
- Quantas famílias estão no Programa X
- Quantos benefícios distintos cada família acessa
- Cruzamento: quem está em múltiplos programas

### A pergunta estratégica central
> Quando essa família deve ou pode sair do CadÚnico?

Não é expulsão — é **emancipação planejada**. O sistema precisa identificar famílias que já atingiram condições de saída e acompanhar sua transição para autonomia.

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

## Diretriz 3 — O número 73.000 é enganoso: o sistema tem vazamentos graves

### O problema real
Hortolândia tem ~73.000 pessoas inscritas no CadÚnico. Mas esse número **não significa** que 73.000 pessoas estão sendo atendidas pela política social municipal.

Existem pelo menos três distorções graves:

**Distorção 1 — Cadastros desatualizados**
Pessoas que mudaram de situação (conseguiram emprego, aumentaram renda, saíram do município) mas permanecem no cadastro. O dado de dezembro/2025 já mostrou isso: 25.395 pessoas classificadas como "acima do perfil" ainda constam no CadÚnico.

**Distorção 2 — Duplicação de benefícios**
O sistema atual é deficiente o suficiente para permitir que um mesmo vulnerável retire, por exemplo, mais de uma cesta básica — deixando outro sem receber. Isso não é fraude necessariamente: é falha de controle. Sem cruzamento de CPF entre programas, a duplicação é invisível para a gestão.

**Distorção 3 — Subatendimento invisível**
Famílias que estão no CadÚnico, são elegíveis, mas nunca foram alcançadas por nenhum serviço. O dado de ontem mostrou que a maioria das 72.424 pessoas não tem CRAS de referência preenchido — o que sugere que uma parcela significativa nunca teve contato ativo com a rede.

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
> "Das 73.000 pessoas no CadÚnico, quantas estão recebendo algum benefício municipal hoje — e quantas não estão recebendo nada?"

Essa pergunta simples, respondida com dados reais, já justifica o projeto inteiro para a Secretaria de Inclusão.

---

## Síntese das três diretrizes

| Diretriz | Problema que resolve | Fase de implementação |
|---|---|---|
| Staging | Rastreabilidade e auditabilidade do dado bruto | MVP — modelagem lógica |
| Visão de benefícios por família | Gestão integrada e emancipação planejada | Fase 2 — enriquecimento |
| Controle de duplicação e subatendimento | Eficiência e equidade na distribuição de benefícios | MVP — primeiros indicadores |

---

*Registro gerado a partir de discussão estratégica em 27/02/2026.*  
*Estas diretrizes orientam as decisões técnicas das próximas fases do projeto.*

