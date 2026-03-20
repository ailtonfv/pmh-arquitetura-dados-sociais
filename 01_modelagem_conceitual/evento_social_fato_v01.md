[fato_evento_social_v01.md](https://github.com/user-attachments/files/26141695/fato_evento_social_v01.md)
# FATO_EVENTO_SOCIAL
**Arquivo:** `fato_evento_social_v01.md`
**Localização:** `01_modelagem_conceitual/`
**Versão:** 01 | **Data:** "20/03/2026"
**Responsável:** Ailton Vendramini / Claude (Anthropic)

---

## 1. Propósito

Registra ocorrências concretas de eventos sociais observados no
município — com data, localização, fonte, valor e confiança — permitindo
cruzamento com o IVS-H e geração de indicadores executivos territoriais.

Esta tabela **não substitui** sistemas operacionais de segurança,
saúde ou educação. Ela absorve dados relevantes desses sistemas —
e de fontes como imprensa e relatórios — para enriquecer a leitura
analítica por loteamento.

---

## 2. Princípio de Uso

Um registro nesta tabela representa **uma ocorrência específica**,
de um tipo catalogado, em uma escala geográfica definida, em um
momento no tempo, com uma fonte identificada.

O mesmo loteamento pode ter dezenas de registros ao longo do tempo.
A série temporal é o produto analítico principal desta tabela.

---

## 3. Estrutura

```
FATO_EVENTO_SOCIAL
  id_evento              PK — gerado automaticamente
                              padrão: EVS_{ANO}{MES}{SEQ}
                              ex: EVS_202603_001

  -- CLASSIFICAÇÃO (via dimensão)
  id_tipo_evento         FK → DIM_TIPO_EVENTO
                              determina categoria, subcategoria, polaridade,
                              dimensao_ivsh e escala_registro esperada

  -- LOCALIZAÇÃO (apenas um campo preenchido por registro, conforme escala)
  id_loteamento          FK → DIM_LOTEAMENTO   — quando escala = Loteamento
  id_nucleo              FK → DIM_NUCLEO        — quando escala = Núcleo
  id_rp                  FK → DIM_REGIAO_PLANEJAMENTO — quando escala = RP
  id_municipio           fixo: 3519071          — quando escala = Município

  -- TEMPORALIDADE
  data_evento            data da ocorrência ou da publicação da fonte
  data_referencia        período a que o dado se refere
                              pode diferir de data_evento
                              ex: série jan-mar/2026 registrada em 20/03/2026

  -- VALOR
  valor_referencia       valor numérico da ocorrência
                              ex: 28 | 5 | 70 | 1
  unidade_medida         Ocorrências | Famílias | Pessoas | Escolas |
                         Alunos | Cestas | Reais | Outro

  -- QUALIDADE E INTENSIDADE
  gravidade              Baixa | Média | Alta
                              gravidade real desta ocorrência específica —
                              pode diferir de gravidade_padrao da dimensão
  confianca_fonte        Alta | Média | Baixa
                              Alta   = fonte oficial (BO, sistema, secretaria)
                              Média  = imprensa com citação de fonte oficial
                              Baixa  = relato, observação de campo, não confirmado
  fonte_registro         Boletim Oficial | Imprensa | Secretaria Municipal |
                         Sistema Municipal | Observação de Campo | Outro

  -- RASTREABILIDADE
  referencia_fonte       texto livre — URL, número do BO, nome do relatório
                              ex: "Tribuna Liberal 20/03/2026 p.09"
                              ex: "BO 2026/001234 — 1o Distrito Policial"
  observacoes

  -- CONTROLE
  data_registro          data de inserção no sistema
  usuario_registro       quem registrou
  ativo                  S | N
```

---

## 4. Regra de Preenchimento das FKs de Localização

Apenas um campo de localização deve ser preenchido por registro,
conforme o campo `escala_registro` do tipo de evento referenciado:

| escala_registro | campo preenchido | campos nulos |
| --- | --- | --- |
| Loteamento | id_loteamento | id_nucleo, id_rp |
| Núcleo | id_nucleo | id_loteamento, id_rp |
| RP | id_rp | id_loteamento, id_nucleo |
| Município | id_municipio = 3519071 | id_loteamento, id_nucleo, id_rp |

Exceção documentada em `observacoes` quando necessário registrar
em escala diferente da esperada pelo tipo.

---

## 5. Exemplos de Registros

### Registro 1 — Onda de furtos no Jardim Rosolém

| campo | valor |
| --- | --- |
| id_evento | EVS_202603_001 |
| id_tipo_evento | EVT_SEG_PATRIMONIAL_FURTO_VEICULO |
| id_loteamento | LOT_071 |
| data_evento | 20/03/2026 |
| data_referencia | jan-mar/2026 |
| valor_referencia | 28 |
| unidade_medida | Ocorrências |
| gravidade | Alta |
| confianca_fonte | Média |
| fonte_registro | Imprensa |
| referencia_fonte | Tribuna Liberal 20/03/2026 p.09 — dados do 1o Distrito Policial |

### Registro 2 — Apreensão de tráfico na Vila São Pedro

| campo | valor |
| --- | --- |
| id_evento | EVS_202603_002 |
| id_tipo_evento | EVT_SEG_TRAFICO_APREENSAO |
| id_loteamento | LOT_068 |
| data_evento | 19/03/2026 |
| data_referencia | 19/03/2026 |
| valor_referencia | 121 |
| unidade_medida | Ocorrências |
| gravidade | Alta |
| confianca_fonte | Alta |
| fonte_registro | Boletim Oficial |
| referencia_fonte | Tribuna Liberal 20/03/2026 p.09 — operação DISE Americana |

### Registro 3 — Premiação escolar (5 EMEFs)

| campo | valor |
| --- | --- |
| id_evento | EVS_202603_003 |
| id_tipo_evento | EVT_EDU_DESEMPENHO_PREMIACAO |
| id_loteamento | a mapear por endereço de cada EMEF |
| data_evento | 20/03/2026 |
| data_referencia | ciclo 2025 |
| valor_referencia | 5 |
| unidade_medida | Escolas |
| gravidade | Alta |
| confianca_fonte | Alta |
| fonte_registro | Secretaria Municipal |
| referencia_fonte | Tribuna Liberal 20/03/2026 p.07 — Prêmio Excelência Educacional |

### Registro 4 — Distribuição PAA em Monte Mor (referência regional)

| campo | valor |
| --- | --- |
| id_evento | EVS_202603_004 |
| id_tipo_evento | EVT_ALI_TRANSFERENCIA_PAA |
| id_municipio | 3519071 |
| data_evento | 20/03/2026 |
| data_referencia | 1o semestre 2026 |
| valor_referencia | 70 |
| unidade_medida | Famílias |
| gravidade | Média |
| confianca_fonte | Alta |
| fonte_registro | Imprensa |
| referencia_fonte | Tribuna Liberal 20/03/2026 p.04 — CATI Regional Campinas |
| observacoes | Registro de referência regional — Hortolândia elegível via CADInsans |

---

## 6. Indicadores Executivos que esta Tabela Viabiliza

| indicador | descrição | cruzamento |
| --- | --- | --- |
| Pressão social por loteamento | Frequência de eventos negativos por loteamento no período | FATO_EVENTO_SOCIAL x DIM_LOTEAMENTO |
| IVS-H x pressão social | Loteamentos com baixo IVS-H e alta pressão — sinal de mudança não capturada | FATO_EVENTO_SOCIAL x FATO_IVS_LOTEAMENTO |
| Cobertura positiva por loteamento | Eventos positivos por loteamento — políticas funcionando | polaridade = Positiva por id_loteamento |
| Série temporal de criminalidade | Evolução de ocorrências por loteamento ao longo do tempo | data_referencia + id_loteamento |
| Loteamentos sem evento registrado | Ausência de registro — pode indicar invisibilidade ou ausência de problema | ausência de FK em determinado período |

---

## 7. Relação com Outros Documentos

| Documento | Relação |
| --- | --- |
| `dim_tipo_evento_v01.md` | Dimensão que classifica cada tipo de evento |
| `dim_municipio_regioes_loteamentos_v03.md` | FK id_loteamento, id_rp |
| `dim_nucleo_v01.md` | FK id_nucleo |
| `fato_ivs_loteamento_v01.md` | Cruzamento IVS-H x pressão social |

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "20/03/2026" | Criação. Estrutura completa com 4 exemplos reais derivados da Tribuna Liberal 20/03/2026. |

---

*Documento técnico vivo — Projeto Atlas Social de Hortolândia*
