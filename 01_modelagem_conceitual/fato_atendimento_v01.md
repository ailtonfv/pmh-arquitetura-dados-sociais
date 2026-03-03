# FATO_ATENDIMENTO — Registro de Atendimentos
**Versão:** 01
**Data de criação:** 03/03/2026
**Responsável:** Ailton Vendramini / Claude (Anthropic)
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Objetivo

Registrar cada atendimento prestado por uma unidade
socioassistencial a uma pessoa ou família.

**Natureza:** Evento pontual com data, local, serviço e resultado.

**Distinção fundamental:**
- FATO_ATENDIMENTO → evento de atendimento (pontual)
- FATO_CONCESSAO_BENEFICIO → concessão com vigência (período)
- FATO_PARTICIPACAO_PROGRAMA → vínculo com trajetória (longitudinal)

---

## Posição na cadeia relacional
```
DIM_PESSOA ──────────────┐
DIM_FAMILIA ─────────────┤
DIM_UNIDADE ─────────────┼──→ FATO_ATENDIMENTO
DIM_SERVICO ─────────────┤
DIM_TERRITORIO ──────────┘
```

---

## Estrutura da FATO_ATENDIMENTO
```
id_atendimento       (chave surrogate)
id_pessoa            (FK → DIM_PESSOA)
id_familia           (FK → DIM_FAMILIA)
id_unidade           (FK → DIM_UNIDADE — onde ocorreu)
id_servico           (FK → DIM_SERVICO — qual serviço)
id_territorio        (FK → DIM_TERRITORIO — território de origem)
data_atendimento
tipo_atendimento     (Espontâneo | Encaminhado | Domiciliar |
                      Abordagem | Emergencial)
origem_encaminhamento (CRAS | CREAS | Centro POP | Saúde |
                       Educação | Conselho Tutelar | Outros | N/A)
resultado            (Orientado | Encaminhado | Acolhido |
                      Documentado | Sem resolução)
destino_encaminhamento (FK → DIM_UNIDADE — se encaminhado)
profissional_responsavel
observacoes
data_registro
```

---

## Regras de negócio

1. `id_pessoa` pode ser nulo — Centro POP atende sem documentação.
   Nesses casos, `id_familia` também será nulo.
   O atendimento deve ser registrado mesmo sem identificação.

2. Uma pessoa encaminhada do Centro POP para a Casa de Passagem
   gera dois registros distintos — um em cada unidade.
   A chave `id_pessoa` vincula os registros à mesma pessoa
   quando identificada.

3. Atendimentos emergenciais (chuvas, desastres) devem registrar
   `tipo_atendimento = Emergencial` e `origem_encaminhamento = Defesa Civil`.

---

## Indicadores que esta tabela viabiliza

| Indicador | Descrição |
|-----------|-----------|
| Volume de atendimentos | Total por unidade, serviço, território e período |
| Taxa de reincidência | Pessoas com mais de N atendimentos no período |
| Tempo médio entre atendimentos | Frequência de retorno por pessoa/família |
| Origem dos encaminhamentos | De onde vêm as demandas por serviço |
| Cobertura territorial | Atendimentos por território versus população vulnerável |

---

## Pendências

1. Confirmar campos disponíveis no SIGAS para
   alimentar esta tabela
2. Definir tratamento para atendimentos sem
   identificação (pop. rua sem documentação)
3. Validar lista de tipos de atendimento com
   equipe técnica da Secretaria de Inclusão

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 03/03/2026 | Criação da tabela |

---

*Documento de registro interno. Uso restrito ao projeto.*
