# FATO_CONCESSAO_BENEFICIO — Registro de Concessão de Benefícios
**Versão:** 01
**Data de criação:** 03/03/2026
**Responsável:** Ailton Vendramini / Claude (Anthropic)
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Objetivo

Registrar cada concessão, suspensão, cancelamento ou
encerramento de benefício vinculado a uma pessoa ou família.

**Natureza:** Evento com vigência — tem data de início
e data de fim (ou está ativo).

**Distinção fundamental:**
- FATO_ATENDIMENTO → evento pontual (uma data)
- FATO_CONCESSAO_BENEFICIO → período com vigência (início e fim)
- FATO_PARTICIPACAO_PROGRAMA → trajetória longitudinal

---

## Posição na cadeia relacional
```
DIM_PESSOA ──────────────┐
DIM_FAMILIA ─────────────┤
DIM_PROGRAMA ────────────┼──→ FATO_CONCESSAO_BENEFICIO
DIM_UNIDADE ─────────────┤
DIM_NORMA_JURIDICA ──────┘
```

---

## Estrutura da FATO_CONCESSAO_BENEFICIO
```
id_concessao         (chave surrogate)
cpf                  (chave principal — obrigatória)
id_pessoa            (FK → DIM_PESSOA)
id_familia           (FK → DIM_FAMILIA)
id_programa          (FK → DIM_PROGRAMA — benefício concedido)
id_unidade           (FK → DIM_UNIDADE — unidade concessora)
id_norma             (FK → DIM_NORMA_JURIDICA — base legal)
tipo_beneficio       (Transferência de Renda | Cesta Básica |
                      Auxílio Habitação | Bolsa | Kit |
                      Crédito | Vaga | Outro)
valor_mensal         (quando aplicável)
data_inicio
data_fim             (null = ativo)
status               (Ativo | Suspenso | Cancelado |
                      Encerrado | Pendente)
motivo_suspensao     (quando aplicável)
motivo_cancelamento  (quando aplicável)
origem_concessao     (CadÚnico | Cadastro Municipal |
                      Judicial | Outro)
profissional_responsavel
data_registro
observacoes
```

---

## Regras de negócio

1. **CPF é obrigatório.** Concessões sem CPF identificado
   devem usar `cpf = PENDENTE` e ser atualizadas
   assim que a documentação for obtida.

2. **Histórico preservado.** Quando um benefício é
   suspenso ou cancelado, o registro não é apagado —
   o campo `status` é atualizado e `data_fim` preenchida.
   O histórico completo deve ser mantido.

3. **Uma pessoa pode ter vários benefícios simultâneos.**
   Exemplo: Bolsa Família + Cesta Básica + Auxílio Habitação.
   Cada concessão é um registro independente.

4. **Permanência no benefício** é calculada como:
   `data_fim - data_inicio` (ou data atual se `data_fim = null`).
   Este é um dos três indicadores estruturantes do MVP.

---

## Indicadores que esta tabela viabiliza

| Indicador | Descrição |
|-----------|-----------|
| Permanência média no benefício | Tempo médio entre data_inicio e data_fim por programa |
| Taxa de reincidência de benefício | Pessoas que retornam ao mesmo benefício após encerramento |
| Concentração territorial | Volume de benefícios ativos por território |
| Acumulação de benefícios | Pessoas com mais de N benefícios simultâneos |
| Emancipação assistida | Pessoas que encerraram benefício e não retornaram |

---

## Alinhamento com o MVP

Esta tabela alimenta diretamente dois dos três
indicadores estruturantes do primeiro ciclo:

- **Permanência média no benefício** → `data_fim - data_inicio`
- **Concentração territorial de vulnerabilidade** →
  benefícios ativos cruzados com DIM_TERRITORIO

---

## Pendências

1. Confirmar lista completa de benefícios municipais
   com valores vigentes (via Secretaria de Inclusão)
2. Verificar campos disponíveis no SIGAS para
   alimentar esta tabela
3. Definir critério de `data_fim` para benefícios
   sem prazo formal (ex: cesta básica contínua)
4. Avaliar integração futura com SIBEC
   (Bolsa Família federal)

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 03/03/2026 | Criação da tabela |

---

*Documento de registro interno. Uso restrito ao projeto.*
