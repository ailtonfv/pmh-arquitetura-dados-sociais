[ivs_vs_ivsh_comparativo_v05 (3).md](https://github.com/user-attachments/files/26192471/ivs_vs_ivsh_comparativo_v05.3.md)
# IVS × IVS-H — Comparativo das 16 Variáveis de Vulnerabilidade Social

**Arquivo:** `00_governanca/ivs_vs_ivsh_comparativo_v05.md`  
**Versão:** v05  
**Data:** "23/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia  
**Fonte metodológica:** COSTA, MA; MARGUTI, BO. *Atlas da Vulnerabilidade Social nos Municípios Brasileiros*. Brasília: IPEA, 2015.  
**Referência metodológica adicional:** NARDO, M. et al. *Manual sobre Construção de Indicadores Compostos*. Paris: OCDE, 2008.

> **IVS-H:** ocorrência local — hipóteses iniciais, a validar com dados reais do CadÚnico dez/2025 e Censo 2022.

---

## ⚠️ Nota Metodológica — Fase do Projeto

Este documento apresenta a proposta de calibração do IVS-H
com base em hipóteses estruturais locais.

**Para o MVP (Fase 1), o índice será calculado utilizando
exatamente a ponderação original do IVS/IPEA**, garantindo:

- comparabilidade nacional
- consistência metodológica
- execução rápida com dados reais

A calibração de pesos apresentada neste documento será aplicada
na Fase 2, após validação empírica com dados do CadÚnico e Censo 2022.

---

## Nota Arquitetural — Dois Índices Complementares

O Atlas Social de Hortolândia opera com dois índices distintos:

**IVS-H (Índice de Vulnerabilidade Social de Hortolândia)**
O IVS-H adota como referência metodológica as 16 variáveis do IVS/IPEA.

No entanto, sua implementação é progressiva:

- **Fase 1 (MVP):** cálculo com subconjunto de variáveis disponíveis no CadÚnico
- **Fase 2:** incorporação das demais variáveis (IBGE, CAGED, Saúde, Educação)
- **Fase final:** replicação integral da metodologia do IVS/IPEA

Essa abordagem garante execução imediata com dados reais,
sem comprometer a comparabilidade metodológica no longo prazo.

**IPST-H (Índice de Pressão Social Territorial de Hortolândia)**
Índice próprio municipal. Mede pressão sobre o Estado em três eixos:
pressão territorial, pressão operacional sobre a rede e lacunas de
cobertura. Variáveis de deslocamento (RT_06/RT_07) pertencem ao
IPST-H — não ao IVS-H.

> *"O IVS mostra onde está a vulnerabilidade. O IPST-H mostra onde a
> vulnerabilidade se transforma em pressão sobre o Estado."*

Referências: `dim_variavel_IVS_v01r7.md` e `ipst_h_v02.md`

---

## Resumo Executivo por Dimensão

| Dimensão | Variáveis | Peso IPEA | Peso IVS-H (hipótese) | Implicação estratégica |
| --- | --- | --- | --- | --- |
| Infraestrutura Urbana | 3 | 33% | ~15–20% | Saneamento e coleta de lixo com alta cobertura em Hortolândia — baixo poder discriminatório entre loteamentos. Mantida IU_03 (mobilidade) por relevância estratégica. |
| Capital Humano | 8 | 33% | ~40–45% | Dimensão mais relevante localmente. A reprodução intergeracional da pobreza é o desafio central. 5 variáveis disponíveis imediatamente no CadÚnico. |
| Renda e Trabalho | 5 | 33% | ~35–40% | Tensão entre polo de emprego formal (49.100 empregos, R$ 4.700/mês) e 72.424 pessoas no CadÚnico. Desemprego e informalidade são determinantes. |
| **TOTAL** | **16** | **100%** | **100%** | — |

> ⚠️ Pesos IVS-H são hipóteses iniciais. A calibração definitiva seguirá as diretrizes da OCDE (*Handbook on Constructing Composite Indicators*, 2008).

**Nota:** No Atlas Social de Hortolândia, o IVS-H é calculado na escala mínima de loteamento e posteriormente agregado para Núcleo (área de CRAS) e Região de Planejamento (RP).

> ⚠️ O CadÚnico não cobre a totalidade da população municipal. As variáveis derivadas dessa fonte representam a população cadastrada ou elegível ao cadastro.

---

## Linha de Base Empírica — IVS IPEA para Hortolândia (2000/2010)

**Fonte:** Dataset `basedosdados.br_ipea_avs.municipio` — Google BigQuery | Código: `3519071`  
**Arquivo:** `referencias_ipea/ivs_ipea_hortolandia/bq-results-20260313-195741.csv`  
**Obtido em:** "13/03/2026"

| Dimensão | IVS 2000 | IVS 2010 | Variação | Interpretação |
| --- | --- | --- | --- | --- |
| IVS Geral | 0,399 | 0,293 | −0,106 | Melhora significativa — município avançou em vulnerabilidade geral |
| Infraestrutura Urbana | 0,349 | 0,354 | +0,005 | Estável — quase sem variação entre os dois Censos |
| Capital Humano | 0,445 | 0,258 | −0,187 | Maior melhoria absoluta — dimensão mais dinâmica em Hortolândia |
| Renda e Trabalho | 0,405 | 0,266 | −0,139 | Melhora expressiva — segunda dimensão mais relevante |

> Quanto menor o índice, menor a vulnerabilidade.

### Validação Empírica das Hipóteses de Peso IVS-H

| Dimensão | Variação IPEA (2000–2010) | Hipótese peso IVS-H | Fundamento empírico |
| --- | --- | --- | --- |
| Infraestrutura Urbana | +0,005 (estável) | ~15–20% (reduzido) | Confirmado: quase sem variação — baixo poder discriminatório. Reduzir o peso é metodologicamente justificado. |
| Capital Humano | −0,187 (maior melhoria) | ~40–45% (elevado) | Confirmado: dimensão que mais variou — maior impacto da política pública e maior vulnerabilidade residual. |
| Renda e Trabalho | −0,139 (segunda maior) | ~35–40% (elevado) | Confirmado: segunda dimensão mais dinâmica. Tensão entre polo de emprego e vulnerabilidade persistente. |

**Conclusão metodológica:** a distribuição histórica da variação do IVS por dimensão é consistente com as hipóteses de peso do IVS-H. Os pesos propostos não são arbitrários — estão ancorados no comportamento real das dimensões em Hortolândia ao longo de uma década.

> A calibração definitiva será realizada após o cálculo do IVS-H com dados reais (CadÚnico dez/2025 + Censo 2022), confrontando os resultados com esta linha de base.

---

## Dimensão 1 — Infraestrutura Urbana

*3 variáveis | Peso IPEA: 33% | Peso IVS-H (hipótese): ~15–20%*

| N | Código | Variável | Fonte Municipal | Peso IPEA | Peso IVS-H | Observação |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | IU_01 | % pessoas em domicílios com água e esgoto inadequados | IBGE Censo 2022 / SAAE | 6,25% | ~4% | Cobertura elevada em Hortolândia — baixo poder discriminatório. Peso reduzido no IVS-H. |
| 2 | IU_02 | % população em domicílios sem coleta de lixo | IBGE Censo 2022 / Serviços Urbanos | 6,25% | ~4% | Mesmo raciocínio de IU_01. |
| 3 | IU_03 | % pessoas com renda menor ou igual a meio SM e deslocamento maior que 1h até o trabalho | CadÚnico (renda) + Censo 2022 / SIDRA (mobilidade) | 6,25% | ~7% | Indicador híbrido: restrição de renda + dificuldade de mobilidade. Hortolândia é polo de emprego — mobilidade é estratégica. Peso levemente elevado no IVS-H. |

---

## Dimensão 2 — Capital Humano

*8 variáveis | Peso IPEA: 33% | Peso IVS-H (hipótese): ~40–45%*

| N | Código | Variável | Fonte Municipal | Peso IPEA | Peso IVS-H | Observação |
| --- | --- | --- | --- | --- | --- | --- |
| 4 | CH_01 | Mortalidade infantil até 1 ano de idade | Secretaria de Saúde / DATASUS | 6,25% | ~5% | Disponível no DATASUS. Solicitar série histórica à Saúde Municipal. |
| 5 | CH_02 | % crianças de 0 a 5 anos fora da escola | Secretaria de Educação / CadÚnico | 6,25% | ~5% | CadÚnico registra frequência escolar. Cruzar com matrículas da Educação. |
| 6 | CH_03 | % crianças de 6 a 14 anos fora da escola | Secretaria de Educação / CadÚnico | 6,25% | ~6% | Evasão escolar — interface direta com CRAS e Conselho Tutelar. |
| 7 | CH_04 | % mulheres de 10 a 17 anos que tiveram filhos | Secretaria de Saúde / CadÚnico | 6,25% | ~5% | CadÚnico + registros de parto adolescente. |
| 8 | CH_05 | % mães chefes de família, sem fund. completo e com filho menor de 15 anos | CadÚnico — disponível imediatamente | 6,25% | ~8% | Disponível imediatamente. Alta relevância local — peso elevado no IVS-H. |
| 9 | CH_06 | Taxa de analfabetismo — população de 15 anos ou mais | CadÚnico — disponível imediatamente / IBGE Censo 2022 | 6,25% | ~7% | Disponível imediatamente. Censo 2022 permite validação para população fora do cadastro. |
| 10 | CH_07 | % crianças em domicílios sem nenhum morador com fund. completo | CadÚnico — disponível imediatamente | 6,25% | ~8% | Disponível imediatamente. Indicador mais poderoso de reprodução intergeracional da pobreza. |
| 11 | CH_08 | % jovens de 15 a 24 anos que não estudam, não trabalham e renda menor ou igual a meio SM | CadÚnico + CAGED | 6,25% | ~6% | Geração nem-nem em situação de vulnerabilidade econômica. Jovens fora do CadÚnico são ponto cego estrutural. |

---

## Dimensão 3 — Renda e Trabalho

*5 variáveis | Peso IPEA: 33% | Peso IVS-H (hipótese): ~35–40%*

| N | Código | Variável | Fonte Municipal | Peso IPEA | Peso IVS-H | Observação |
| --- | --- | --- | --- | --- | --- | --- |
| 12 | RT_01 | % pessoas com renda domiciliar per capita menor ou igual a meio SM | CadÚnico — disponível imediatamente | 6,25% | ~9% | Disponível imediatamente. Ponto de entrada natural do IVS-H. |
| 13 | RT_02 | Taxa de desocupação — população de 18 anos ou mais | CadÚnico + CAGED | 6,25% | ~8% | CadÚnico: situação declarada. CAGED: vínculos formais. Trabalhadores informais e MEI não aparecem no CAGED. |
| 14 | RT_03 | % pessoas 18+ sem fund. completo em ocupação informal | CadÚnico | 6,25% | ~7% | Subestimação provável — cruzar com CAGED para identificar vínculo formal. |
| 15 | RT_04 | % pessoas em domicílios com renda menor ou igual a meio SM dependentes de idosos | CadÚnico — disponível imediatamente | 6,25% | ~8% | Disponível imediatamente. Captura fragilidade da renda do idoso como sustentação familiar. |
| 16 | RT_05 | Taxa de atividade das pessoas de 10 a 14 anos (trabalho infantil) | CadÚnico / IBGE Censo 2022 | 6,25% | ~3% | Interface direta com CREAS e Conselho Tutelar. Censo 2022 é fonte mais robusta. |

---

## Disponibilidade das Variáveis

| Status | Qtd | Variáveis | Próximo passo |
| --- | --- | --- | --- |
| Disponível imediatamente — CadÚnico | 5 | CH_05, CH_06, CH_07, RT_01, RT_04 | Calcular IVS-H Fase 1 com CadÚnico dez/2025 |
| Parcial — curto prazo | 10 | IU_01, IU_02, IU_03, CH_01, CH_02, CH_03, CH_08, RT_02, RT_03, RT_05 | Integrar IBGE Censo 2022, SIDRA, CAGED e Saúde/Educação municipal |
| Parcial — médio prazo | 1 | CH_04 | Registro de parto adolescente — integração intersetorial com Saúde |
| **TOTAL** | **16** | — | — |

> ⚠️ A renda domiciliar por setor censitário não foi publicada no Censo 2022.
> A dimensão Renda e Trabalho do IVS-H utiliza como fonte primária o CadÚnico
> municipal, complementado por dados administrativos (CAGED).

---

## Referências Cruzadas

| Documento | Localização |
| --- | --- |
| `dim_variavel_IVS_v01r7.md` — detalhe técnico completo | `01_modelagem_conceitual/` |
| `ipst_h_v02.md` — índice complementar | `01_modelagem_conceitual/` |
| `schema_IVS_v06.sql` — modelagem relacional | `02_modelagem_lógica/` |
| `programa_dim_v06.md` — campo dimensao_ivs | `01_modelagem_conceitual/` |
| `palestra_marco_2026_v10.md` | `00_governança/` |
| `arquitetura_dados_IVS_IBGE_Horto_v10.md` | `00_governança/` |
| Linha de base empírica IVS IPEA | `referencias_ipea/ivs_ipea_hortolandia/bq-results-20260313-195741.csv` |

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "10/03/2026" | Criação — comparativo das 16 variáveis IVS x IVS-H; resumo executivo por dimensão; tabela de disponibilidade municipal |
| v02 | "11/03/2026" | Correção: 3 para 5 variáveis disponíveis no CadÚnico; padronização de meio SM; redação CH_08; nota territorial; nota limitações CadÚnico |
| v03 | "11/03/2026" | RT_02: observações CAGED e MEI; IU_03: indicador híbrido; referência Nardo et al. (OCDE, 2008) |
| v04 | "13/03/2026" | Linha de Base Empírica adicionada: IVS IPEA 2000/2010 via BigQuery; tabela de validação empírica dos pesos |
| v05 | "23/03/2026" | Nota Arquitetural adicionada: dois índices complementares (IVS-H e IPST-H); RT_06/RT_07 explicitamente fora do IVS-H; IU_03 corrigida para curto prazo (alinhado com dim_variavel_IVS_v01r7); Referências Cruzadas atualizadas com versões corretas de todos os documentos; "território/territorial" substituído por "loteamento" |

---

*Documento de comunicação institucional — 00_governança/*  
*Atlas Social de Hortolândia — uso interno*
