# NOTAS ARQUITETURAIS — Programas Sociais de Hortolândia
**Versão:** v01  
**Data:** 2026-03-11  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 00_governanca  
**Origem:** Extraído de `dim_programas_sociais_v12.md`

> Este arquivo concentra o conhecimento operacional e institucional do
> catálogo de programas sociais que **não é cadastro puro**:
> pontos cegos de dados, dependências de convênio, trajetórias típicas,
> fluxos institucionais e pendências de governança.
>
> **É um documento vivo** — deve ser atualizado a cada novo ciclo
> jornalístico, reunião técnica ou decisão arquitetural que afete
> a modelagem dos programas.

---

## 1. Notas Arquiteturais Consolidadas

| # | Nota | Impacto no modelo |
|---|------|-----------------|
| 01 | Centro POP atende sem documentação | Ponto cego no CadÚnico — CPF = PENDENTE em FATO_ATENDIMENTO |
| 02 | Fluxo: Centro POP → Casa de Passagem (triagem, até 30 dias) → Alta Complexidade | Mesma pessoa gera múltiplos registros — CPF é âncora obrigatória para deduplicação |
| 03 | Banco do Povo e SEBRAE: dados ficam nos operadores externos (Desenvolve SP, SEBRAE-SP) | Integração futura requer convênio específico com cada operador |
| 04 | SINE / Seguro Desemprego: dados ficam no MTE federal (Emprega Brasil) | Integração futura requer API federal — prazo indefinido |
| 05 | MEI não aparece no CAGED | Ponto cego no monitoramento de transição produtiva — formalização via MEI não é capturada automaticamente |
| 06 | Seguro Desemprego esgotado sem recolocação → tendência de entrada no CadÚnico | Fluxo de entrada previsível — modelar alerta em FATO_ATENDIMENTO |
| 07 | Feiras Livres: renda informal não declarada ao CadÚnico | Impacto na classificação de vulnerabilidade — subestimação de renda real |
| 08 | `base_legal_principal` em DIM_PROGRAMA é atalho analítico — denormalização consciente | Não substitui REL_NORMA_PROGRAMA (a criar) |
| 09 | `id_orgao_executor` é FK para JOIN | Liga DIM_PROGRAMA → DIM_ORGAO_EXECUTOR → FATO_ATENDIMENTO |
| 10 | Operadores externos (EXT_) sem dimensão interna no modelo | Integração futura via convênio ou API — dados não estão no SIGAS municipal |
| 11 | MCMV Amanda: divergência 421×576 documentações coletadas | Validar junto à Secretaria de Habitação antes de inserir em FATO_ATENDIMENTO |
| 12 | Fluxo CRAM → Conselho Tutelar → CREAS confirmado em 08/03/2026 (dois casos documentados) | Modelar campo `id_encaminhamento_destino` em FATO_ATENDIMENTO — encaminhamento como dado estruturado |
| 13 | Fatec: dados de matrícula ficam no Centro Paula Souza (operador estadual) | Cruzamento CadÚnico × matrículas Fatec futuro — requer convênio estadual |
| 14 | Alta Complexidade executada por OSCs — maioria sem `id_orgao_executor` confirmado | Pendência #19: identificar e cadastrar OSCs executoras antes de inserir registros em FATO_ATENDIMENTO |
| 15 | PEI: dados ficam na Secretaria Estadual de Direitos da PCD | Parceria via Termo de Cooperação Técnica — integração futura requer convênio estadual |

---

## 2. Pontos Cegos Estruturais

| Tipo | Descrição | Variável IVS afetada | Mitigação possível |
|---|---|---|---|
| **Sem documentação** | Centro POP atende sem CPF obrigatório | RT_01, IU_01, CH_06 | Registrar CPF = PENDENTE + deduplicação posterior |
| **MEI** | Trabalhadores que se formalizam como MEI não aparecem no CAGED | RT_02, RT_03 | Cruzamento eventual com Receita Federal (CNPJ MEI) |
| **Renda informal** | Feirantes e informais não declaram renda ao CadÚnico | RT_01, RT_03 | Censo 2022 como referência externa |
| **Jovens fora do CadÚnico** | Geração nem-nem não cadastrada — ponto cego em CH_08 | CH_08 | IBGE Censo 2022 para estimativa territorial |
| **Alta Complexidade** | OSCs executoras sem dados integrados ao SIGAS municipal | Todos | Convênio + integração de sistemas (médio prazo) |
| **Operadores externos** | Banco do Povo, SEBRAE, SINE: dados fora do alcance municipal | RT_02, RT_03 | Convênios e API federais (longo prazo) |
| **Renda Censo 2022** | Dados de renda por setor censitário ainda não publicados pelo IBGE | RT_01 | CadÚnico como fonte primária — limitação reconhecida |

---

## 3. Fluxo Institucional do SUAS em Hortolândia

```
Entrada (3 vias):
  Busca Ativa | Demanda Espontânea | Encaminhamento
       ↓
🟢 PROTEÇÃO BÁSICA (CRAS × 7)
   PAIF · SCFV · BPC · Bolsa Família · Cesta Básica
       ↓ (violação de direitos confirmada)
🟡 PROTEÇÃO ESPECIAL — MÉDIA COMPLEXIDADE (CREAS / Centro POP)
   PAEFI · Medida Socioeducativa · Abordagem Social
   Centro POP → Casa de Passagem Triagem (até 30 dias)
       ↓ (acolhimento necessário)
🔴 PROTEÇÃO ESPECIAL — ALTA COMPLEXIDADE (OSCs conveniadas)
   SAICA (crianças/adolescentes)
   Abrigo Adultos / Famílias em situação de rua (Instituto Esperançar)
   Abrigo Mulheres em situação de violência (OSC a confirmar)
   Residência Inclusiva (PCD — OSC a confirmar)
   Casa-Lar / ILPI (idosos — OSC a confirmar)
   República (jovens/adultos em saída da rua — OSC a confirmar)
```

> **Nota arquitetural:** a Casa de Passagem de Triagem (até 30 dias)
> é subcomponente do Centro POP — distinta da Casa de Passagem como
> modalidade de Alta Complexidade. A mesma pessoa transita pelos dois
> registros — CPF é âncora obrigatória.

---

## 4. Trajetória Típica de Transição Produtiva

```
CadÚnico (entrada)
    ↓
PAIF — acompanhamento familiar (CRAS)
    ↓
Projeto Capacita / Costura Industrial / DECOLA — qualificação
    ↓
PEI — inclusão produtiva para PCD (quando aplicável)
    ↓
[futuro] Fatec Hortolândia — ensino superior tecnológico gratuito
    ↓
PAT / SINE — intermediação de mão de obra
    ↓
BIFURCAÇÃO:
  → Inserção formal (CAGED registra)
  → OU Formalização MEI (Receita Federal registra — ponto cego no CAGED)
    ↓
Banco do Povo — crédito produtivo (opcional)
    ↓
Saída do perfil CadÚnico
(resultado_final = 'emancipado' em FATO_PARTICIPACAO_PROGRAMA)
```

> **Caso documentado:** Suelen — CRAS → ACERTE → assistente administrativa
> → emprego no próprio CRAS. (Tribuna Liberal, 08/03/2026)

---

## 5. Trajetória Típica de Saída da Situação de Rua

```
Busca Ativa / Demanda Espontânea
    ↓
Centro POP — acolhimento, higiene, alimentação, documentação
    ↓
Casa de Passagem Triagem (até 30 dias) — identificação de perfil
    ↓
BIFURCAÇÃO por perfil:
  → Adulto 24–59 anos           → Abrigo Institucional (Instituto Esperançar)
  → Mulher em violência         → Abrigo Mulheres (OSC a confirmar)
  → PCD                         → Residência Inclusiva (OSC a confirmar)
  → Idoso 60+                   → Casa-Lar / ILPI (OSC a confirmar)
  → Jovem/adulto com emprego    → República masc./fem. (OSC a confirmar)
    ↓
Programa Ressignifica — bolsa R$ 700 + cesta + auxílio aluguel
    ↓
ACERTE / DECOLA — qualificação e inserção produtiva
    ↓
Autonomia
```

---

## 6. Fluxo Confirmado CRAM → Conselho Tutelar → CREAS (08/03/2026)

Dois casos documentados pela Tribuna Liberal em 08/03/2026:

- **Caso 1:** violência doméstica → filho do casal encaminhado ao Conselho Tutelar
  → fluxo CRAM → CT ativado
- **Caso 2:** companheiro preso em flagrante → vítima buscou medida protetiva
  → fluxo CRAM → CREAS ativado

> **Implicação para FATO_ATENDIMENTO:**
> Modelar campo `id_encaminhamento_destino` como dado estruturado
> (não texto livre). O fluxo CRAM → CT → CREAS é cadeia operacional
> real confirmada — não apenas arquitetural.

---

## 7. Dependências de Convênio e Integração

| Programa | Dado disponível em | Requisito para integração | Prazo estimado |
|---|---|---|---|
| Banco do Povo | Desenvolve SP (estadual) | Convênio com Desenvolve SP | Médio prazo |
| SEBRAE Aqui | SEBRAE-SP (estadual) | Convênio com SEBRAE | Médio prazo |
| SINE / Emprega Brasil | MTE federal | API federal (quando liberada) | Longo prazo |
| Seguro Desemprego | MTE federal | API federal | Longo prazo |
| Fatec | Centro Paula Souza (estadual) | Convênio estadual | Dependente de implantação |
| PEI | Sec. Est. Direitos PCD (estadual) | Extensão do Termo de Cooperação | Curto prazo |
| Alta Complexidade (OSCs) | Sistemas das OSCs | Convênio de compartilhamento de dados | Médio prazo |
| CAGED | MTE federal | Já disponível — extração mensal | Imediato |
| DATASUS | MS federal | Já disponível — solicitação formal | Imediato |

---

## 8. Dado de Contexto — Mercado Formal e CadÚnico

| Indicador | Valor | Fonte |
|---|---|---|
| Empregos formais | 49.100 | CAGED jan–mar/2023 |
| Remuneração média formal | R$ 4.700 | CAGED jan–mar/2023 |
| Saldo CAGED jan/2026 | +140 vagas (+57,3% vs jan/2025) | CAGED jan/2026 |
| CadÚnico out/2022 | 29.698 famílias / 70.456 pessoas | CECAD |
| CadÚnico dez/2025 | ~73.000 pessoas | CECAD |
| População estimada | ~240.000 habitantes | IBGE |
| Cobertura CadÚnico/população | ~30% | Estimativa |

> **Tensão analítica central do projeto:** 49.100 empregos formais com
> R$ 4.700 de remuneração média convivem com ~73.000 pessoas no CadÚnico.
> Essa tensão é o ponto de partida do IVS-H e da análise de emancipação assistida.

---

## 9. Pendências Abertas

| # | Pendência | Prioridade | Arquivo impactado |
|---|---|---|---|
| 01 | Confirmar distinção Projeto Capacita × Capacita Hortolândia (Fundo Social) | Alta | dim_programa |
| 02 | Confirmar distinção Escola Comunitária × Cozinha Comunitária | Média | dim_programa |
| 03 | Confirmar se Atend. Domiciliar e Proteção Especial PCD/Idosos são modalidades distintas | Média | dim_programa |
| 04 | Detalhar critério de acesso da Farmácia Solidária — vínculo CadÚnico? | Média | dim_programa |
| 05 | Verificar registro de matrículas nas Formações Culturais para FATO_ATENDIMENTO | Baixa | dim_programa |
| 06 | Confirmar vínculo CadÚnico para acesso ao Banco do Povo | Média | dim_programa |
| 07 | DECOLA Juventude — confirmar relação com Aprendiz Social | Alta | dim_programa |
| 08 | Vila da Saúde — monitorar confirmação de secretaria e prazo | Baixa | dim_programa |
| 09 | Cruzar cobertura territorial dos 7 CRAS com `loteamentosregiao.xls` | Alta | dim_territorio |
| 10 | Levantar leis municipais de criação dos CRAS, Centro POP, ACERTE e Ressignifica | Alta | dim_programa |
| 11 | Confirmar `id_orgao_executor` para ESPACO_INCLUIR e EMPORIO_JACUBA | Média | dim_orgao_executor |
| 12 | Catalogar 12 OSCs parceiras dos CRAS individualmente (Pendência #12 NOTAS) | Média | dim_orgao_executor |
| 13 | MCMV Amanda: confirmar número oficial de documentações (576?) | Alta | dim_programa |
| 14 | Closet Solidário: confirmar base legal municipal e critérios formais de acesso | Média | dim_programa |
| 15 | Confirmar `id_orgao_executor` DEP_MULHERES | Média | dim_orgao_executor |
| 16 | Programa Vida Longa: monitorar negociações com o Estado | Média | dim_programa |
| 17 | Fatec Hortolândia: monitorar evolução do estudo de viabilidade | Alta | dim_programa |
| 18 | Monte Sinai: confirmar número oficial de famílias beneficiadas (~650) | Média | dim_programa |
| 19 | Identificar OSCs executoras das 5 modalidades de Alta Complexidade (SAICA, Abrigo Mulheres, Residência Inclusiva, ILPI, República) | Alta | dim_orgao_executor + dim_programa |
| 20 | Confirmar se Aprendiz Social é denominação atual do DECOLA Juventude ou programa distinto | Alta | dim_programa |
| 21 | Confirmar quais dados de Alta Complexidade vão ao SIGAS e quais ao CadÚnico | Alta | fato_atendimento |
| 22 | Fatec — conflito de fonte sobre local da reunião de 09/03/2026: TL (10/03 e 11/03) registra "Câmara Municipal"; v11 corrigiu para "SMIDS" com base em Caio [RH PMH Lima] | Média | dim_programa |
| 23 | PEI — confirmar `id_orgao_executor` definitivo (DEP_PCD provisório), base legal municipal, critérios de acesso e outros programas do Termo de Cooperação | Alta | dim_programa + dim_orgao_executor |

---

## 10. Notas sobre Infraestrutura Urbana — Dependência Estrutural

A distribuição dos programas por dimensão IVS revela uma assimetria estratégica:

```
infraestrutura_urbana = 6 programas (9,2% do total)
```

Isso significa que a prefeitura de Hortolândia tem **baixa capacidade de política própria**
na dimensão Infraestrutura Urbana — os programas dependem majoritariamente de:

- **CDHU** (Estado de SP) — habitação
- **União** (MCMV) — habitação
- **SABESP** — saneamento
- **Cidade Legal** (Estado) — regularização fundiária

> **Implicação para o IVS-H:** variáveis IU_01 e IU_02 têm baixo poder discriminatório
> entre territórios de Hortolândia justamente porque a cobertura de saneamento
> é elevada (~100% água, ~96% esgoto) — resultado dessas parcerias estruturais.
> Essa dependência é, paradoxalmente, um indicador de desenvolvimento relativo.

---

## 11. Fundamento Metodológico IVS / IVS-H

O campo `dimensao_ivs` presente em cada programa está fundamentado no **IVS (Índice de
Vulnerabilidade Social)**, desenvolvido pelo IPEA em parceria com o IBGE e publicado no
**Atlas da Vulnerabilidade Social (2015)**. O IVS organiza a vulnerabilidade social em três
dimensões — **Infraestrutura Urbana**, **Capital Humano** e **Renda e Trabalho**.

O **IVS-H** mantém a estrutura conceitual do IVS nacional, adaptando a escala territorial
(de setores censitários do Brasil para loteamentos de Hortolândia) e as fontes de dados
disponíveis no nível municipal (CadÚnico, CAGED, Saúde, Educação municipais).

> A classificação `dimensao_ivs` de cada programa não é arbitrária — ela registra
> **em qual dimensão do IVS-H o programa atua**, permitindo futuramente cruzar
> cobertura programática com intensidade de vulnerabilidade territorial.

**Referências:**
- COSTA, M. A.; MARGUTI, B. O. *Atlas da Vulnerabilidade Social nos Municípios Brasileiros*. IPEA, 2015.
- NARDO, M. et al. *Handbook on Constructing Composite Indicators*. OECD, 2008.

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | 2026-03-11 | Criação — extraído de `dim_programas_sociais_v12.md`; 15 notas arquiteturais; 7 pontos cegos; 2 trajetórias típicas; fluxo CRAM confirmado; tabela de dependências de convênio; 23 pendências; nota sobre dependência estrutural em IU |

---

*Documento de governança — 00_governanca/*  
*Atlas Social de Hortolândia — uso interno*
