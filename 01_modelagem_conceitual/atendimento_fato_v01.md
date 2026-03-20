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
id_atendimento           (chave surrogate)
cpf                      (chave principal — obrigatória)
id_pessoa                (FK → DIM_PESSOA)
id_familia               (FK → DIM_FAMILIA)
id_unidade               (FK → DIM_UNIDADE — onde ocorreu)
id_servico               (FK → DIM_SERVICO — qual serviço)
id_territorio            (FK → DIM_TERRITORIO — território de origem)
data_atendimento
tipo_atendimento         (Espontâneo | Encaminhado | Domiciliar |
                          Abordagem | Emergencial)
origem_encaminhamento    (CRAS | CREAS | Centro POP | Saúde |
                          Educação | Conselho Tutelar | Outros | N/A)
resultado                (Orientado | Encaminhado | Acolhido |
                          Documentado | Sem resolução)
destino_encaminhamento   (FK → DIM_UNIDADE — se encaminhado)
profissional_responsavel
data_registro
observacoes
```

---

## Regras de negócio

1. **CPF é a chave obrigatória de identificação da pessoa.**
   Atendimentos sem CPF identificado devem ser registrados
   com `cpf = PENDENTE` e atualizados assim que a
   documentação for obtida.
   O Centro POP tem como meta a documentação de toda
   pessoa atendida — o registro pendente é o primeiro
   passo dessa trajetória.

2. **Histórico preservado.** Quando o CPF for obtido,
   o registro é atualizado — nunca duplicado.
   A data do atendimento original é mantida.

3. **Fluxo em cadeia — Centro POP → Casa de Passagem → Abrigo.**
   Cada etapa gera um registro distinto em FATO_ATENDIMENTO.
   O CPF é o fio condutor que une os registros à mesma pessoa
   e permite reconstruir a trajetória completa.

4. **Atendimentos emergenciais** (chuvas, desastres) devem
   registrar `tipo_atendimento = Emergencial` e
   `origem_encaminhamento = Defesa Civil`.

---

## Indicadores que esta tabela viabiliza

| Indicador | Descrição |
|-----------|-----------|
| Volume de atendimentos | Total por unidade, serviço, território e período |
| Taxa de reincidência | Pessoas com mais de N atendimentos no período |
| Tempo médio entre atendimentos | Frequência de retorno por pessoa/família |
| Origem dos encaminhamentos | De onde vêm as demandas por serviço |
| Cobertura territorial | Atendimentos por território versus população vulnerável |
| Pendências documentais | Atendimentos com cpf = PENDENTE por unidade |

---

## Alinhamento com o MVP

Esta tabela alimenta diretamente o terceiro indicador
estruturante do primeiro ciclo:

- **Mapa Territorial de Demanda por Serviço** →
  volume de atendimentos cruzado com DIM_TERRITORIO

---

## Pendências

1. Confirmar campos disponíveis no SIGAS para
   alimentar esta tabela
2. Definir fluxo de atualização de registros
   com `cpf = PENDENTE`
3. Validar lista de tipos de atendimento com
   equipe técnica da Secretaria de Inclusão
4. Definir tratamento para atendimentos de
   população em situação de rua sem qualquer
   identificação possível

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 03/03/2026 | Criação da tabela — CPF como chave obrigatória |

---

*Documento de registro interno. Uso restrito ao projeto.*
