# DIM_UNIDADE — Unidades de Atendimento Socioassistencial
**Versão:** 01
**Data de criação:** 03/03/2026
**Responsável:** Ailton Vendramini / Claude (Anthropic)
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Objetivo

Registrar todas as unidades físicas de atendimento
socioassistencial do município de Hortolândia —
independentemente do tipo ou secretaria responsável.

**Princípio estruturante:**
CRAS, CREAS, Centro POP, PAT e demais unidades são
todos instâncias do mesmo conceito: unidade de
atendimento. A diferença está no `tipo_unidade`,
não em tabelas separadas.

---

## Posição na cadeia relacional do projeto
```
DIM_PROGRAMA → DIM_SERVICO
                    ↓
              DIM_UNIDADE
                    ↓
        REL_UNIDADE_LOTEAMENTO
                    ↓
            DIM_LOTEAMENTO
```

Uma unidade executa vários serviços.
Um serviço pode ser executado em várias unidades.
Uma unidade atende vários loteamentos.
Um loteamento pode ser atendido por mais de
uma unidade (relação N:N com controle temporal).

---

## Estrutura da DIM_UNIDADE
```
id_unidade
cod_unidade          (código interno do sistema)
nome_unidade         (nome oficial)
nome_homenageado     (quando aplicável)
tipo_unidade         (CRAS | CREAS | Centro POP |
                      Abrigo | Casa de Passagem |
                      CCS | CCMI | CRAM | PAT |
                      Fundo Social | Outro)
secretaria_responsavel
id_gestor            (FK → DIM_GESTOR — coordenador)
nivel_protecao       (Básica | Especial Média Complexidade |
                      Especial Alta Complexidade |
                      Produtivo | Outro)
logradouro
numero
complemento
bairro
cep
telefone
email
horario_atendimento
capacidade_atendimento
ativo                (S/N)
data_inauguracao
data_encerramento    (null = ativa)
observacoes
```

---

## Unidades cadastradas

### CRAS — Centros de Referência de Assistência Social

| cod | Nome | Homenageado | Endereço | Telefone |
|-----|------|-------------|----------|----------|
| U001 | CRAS Jardim Santa Clara | — | Rua Estados Unidos, 217, Jd. Santa Clara do Lago II | 3865-1133 |
| U002 | CRAS Jardim Amanda | — | Av. Tarsila do Amaral, 540, Jd. Amanda II | 3819-7619 |
| U003 | CRAS Jardim Novo Ângulo | — | Rua Francisco Bereta, 330, Jd. Novo Ângulo | 3809-1945 |
| U004 | CRAS Rosolém | Joel Alves Assunção | Rua Guido Rosolém, 177, Jardim Rosolém | 3809-3164 |
| U005 | CRAS Primavera | Chico Vigilante | Rua Amoreira, 35, Jd. Primavera | 3865-1225 |
| U006 | CRAS Jardim Brasil | Maria Humilde Antunes (Zuma) | Rua da Amizade, 240, Jardim Brasil | 3909-1398 |
| U007 | CRAS Vila Real | — | Rua Ernesto Bergamasco, 185, Vila Real | 3865-4269 |

**Nível de proteção:** Básica
**Secretaria:** Inclusão e Desenvolvimento Social
**Serviço principal:** PAIF

---

### CREAS — Centro de Referência Especializado de
### Assistência Social

| cod | Nome | Endereço | Telefone |
|-----|------|----------|----------|
| U008 | CREAS | Rua Francisco Castilho, 298, Remanso Campineiro | (19) 3909-4546 |

**Nível de proteção:** Especial — Média Complexidade
**Secretaria:** Inclusão e Desenvolvimento Social
**Serviço principal:** PAEFI

---

### Centro POP — Centro de Referência Especializado
### para População em Situação de Rua

| cod | Nome | Endereço | Contato |
|-----|------|----------|---------|
| U009 | Centro POP | Rua Maria Bernardes, 505, Remanso Campineiro | centropop.smids@hortolandia.sp.gov.br / WhatsApp (19) 9 9976-1742 |

**Nível de proteção:** Especial — Alta Complexidade
**Secretaria:** Inclusão e Desenvolvimento Social
**Serviço principal:** Atendimento Social / Pop. Rua
**⚠️ Nota arquitetural:** atende sem exigência de
documentação — CPF pode ser PENDENTE.

---

### Unidades de Acolhimento

| cod | Nome | Endereço | Observação |
|-----|------|----------|------------|
| U010 | Casa de Passagem | A confirmar | Vinculada ao Centro POP |
| U011 | Abrigo Institucional | A confirmar | Parceria Instituto Esperançar |

**Nível de proteção:** Especial — Alta Complexidade
**Fluxo:** Centro POP → Casa de Passagem → Abrigo

---

### Outras Unidades

| cod | Nome | Tipo | Endereço | Secretaria |
|-----|------|------|----------|------------|
| U012 | CCS — Centro de Convivência Social | CCS | Rua Guido Rosolém, 177, Jardim Rosolém | Inclusão |
| U013 | CCMI — Centro de Convivência da Melhor Idade | CCMI | Remanso Campineiro | Governo |
| U014 | CRAM — Centro de Ref. Atendimento à Mulher | CRAM | A confirmar | Governo |
| U015 | PAT — Posto de Atendimento ao Trabalhador | PAT | Paço Municipal — Rua Profa. Celina Franceschini Bueno, 100 | Des. Econômico |
| U016 | Fundo Social de Solidariedade | Fundo Social | A confirmar | Governo |

---

## Nota sobre controle temporal

A cada criação de novo CRAS ou reorganização
de abrangência territorial, novos registros são
inseridos em REL_UNIDADE_LOTEAMENTO com
`data_inicio` e `data_fim`.

O histórico é preservado — nunca sobrescrito.

**Exemplo prático:**
Se um novo CRAS for criado em 2027 e absorver
loteamentos do CRAS Amanda, o modelo registra:
- REL antiga: CRAS Amanda × loteamento X
  → data_fim = data da reorganização
- REL nova: CRAS novo × loteamento X
  → data_inicio = data da reorganização

---

## Pendências

1. Confirmar endereço da Casa de Passagem (U010)
2. Confirmar endereço do Abrigo Institucional (U011)
3. Confirmar endereço do CRAM (U014)
4. Confirmar endereço do Fundo Social (U016)
5. Verificar se CCS Rosolém (U012) permanece
   como unidade distinta do CRAS Rosolém (U004)
6. Popular REL_UNIDADE_LOTEAMENTO cruzando
   loteamentosregiao.xls com áreas de abrangência
   dos 7 CRAS
7. Identificar coordenador de cada unidade para
   vincular ao DIM_GESTOR

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 03/03/2026 | Criação — unifica CRAS, CREAS, Centro POP, abrigos e demais unidades em dimensão única com campo tipo_unidade |

---

*Documento de registro interno. Uso restrito ao projeto.*
```

---

Com isso o repositório `01_modelagem_conceitual/` está assim:
```
dim_domicilio_v01.md
dim_gestor_v01.md
dim_norma_juridica_v01.md
dim_pl_v01.md
dim_programa_v01.md      ← atualizar para v06
dim_territorio_v01.md    ← renomeado
dim_unidade_v01.md       ← NOVO
dim_vereador_v01.md
fato_atendimento_v01.md
fato_concessao_beneficio_v01.md
fato_participacao_programa_v01.md
