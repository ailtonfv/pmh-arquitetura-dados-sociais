[ivs_vs_ivsh_comparativo_v05.md](https://github.com/user-attachments/files/26085680/ivs_vs_ivsh_comparativo_v05.md)
# IVS × IVS-H — Comparativo das Variáveis de Vulnerabilidade Social
**Arquivo:** `00_governanca/ivs_vs_ivsh_comparativo.md`  
**Versão:** v05  
**Data:** "18/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia  
**Fonte metodológica:** COSTA, MA; MARGUTI, BO. Atlas da Vulnerabilidade Social nos Municípios Brasileiros. Brasília: IPEA, 2015.  
**Referência metodológica adicional:** NARDO, M. et al. Manual sobre Construção de Indicadores Compostos. Paris: OCDE, 2008.

> IVS-H: ocorrência local — hipóteses iniciais, a validar com dados reais do CadÚnico dez/2025 e Censo 2022.

---

## Resumo Executivo por Dimensão

| Dimensão | Variáveis IVS | Variáveis IVS-H | Peso IPEA | Peso IVS-H (hipótese) | Implicação estratégica |
| --- | --- | --- | --- | --- | --- |
| Infraestrutura Urbana | 3 | 2 | 33% | ~15-20% | IU_03 migrada para RT como variável local superior. IU_01 e IU_02 com baixo poder discriminatório — saneamento com alta cobertura em Hortolândia. |
| Capital Humano | 8 | 8 | 33% | ~40-45% | Dimensão mais relevante localmente. A reprodução intergeracional da pobreza é o desafio central. 5 variáveis disponíveis imediatamente no CadÚnico. |
| Renda e Trabalho | 5 | 7 | 33% | ~35-40% | RT_06 e RT_07 substituem IU_03 com metodologia superior — fluxo intermunicipal real (SIDRA/IBGE) em vez de proxy de tempo de deslocamento. |
| TOTAL | 16 | 17 | 100% | 100% | IVS-H incorpora 1 variável local adicional (mobilidade intermunicipal desagregada). Comparabilidade nacional preservada via ancora IPEA. |

> Pesos IVS-H são hipóteses iniciais. A calibração definitiva seguirá as diretrizes da OCDE (Handbook on Constructing Composite Indicators, 2008).

**Nota territorial:** No Atlas Social de Hortolândia, o IVS-H é calculado na escala mínima de loteamento e posteriormente agregado para Núcleo (área de CRAS) e Região de Planejamento (RP).

> O CadÚnico não cobre a totalidade da população municipal. As variáveis derivadas dessa fonte representam a população cadastrada ou elegível ao cadastro.

---

## Linha de Base Empírica — IVS IPEA para Hortolândia (2000/2010)

**Fonte:** Dataset `basedosdados.br_ipea_avs.municipio` — Google BigQuery | Código: `3519071`  
**Arquivo:** `referencias_ipea/ivs_ipea_hortolandia/bq-results-20260313-195741.csv`  
**Obtido em:** "13/03/2026"

| Dimensão | IVS 2000 | IVS 2010 | Variação | Interpretação |
| --- | --- | --- | --- | --- |
| IVS Geral | 0,399 | 0,293 | -0,106 | Melhora significativa — município avançou em vulnerabilidade geral |
| Infraestrutura Urbana | 0,349 | 0,354 | +0,005 | Estável — quase sem variação entre os dois Censos |
| Capital Humano | 0,445 | 0,258 | -0,187 | Maior melhoria absoluta — dimensão mais dinâmica em Hortolândia |
| Renda e Trabalho | 0,405 | 0,266 | -0,139 | Melhora expressiva — segunda dimensão mais relevante |

> Quanto menor o índice, menor a vulnerabilidade.

### Validação Empírica das Hipóteses de Peso IVS-H

| Dimensão | Variação IPEA (2000 a 2010) | Hipótese de peso IVS-H | Fundamento empírico |
| --- | --- | --- | --- |
| Infraestrutura Urbana | +0,005 (estável) | ~15-20% (reduzido) | Confirmado: quase sem variação — baixo poder discriminatório entre territórios de Hortolândia. |
| Capital Humano | -0,187 (maior melhoria) | ~40-45% (elevado) | Confirmado: foi a dimensão que mais variou — onde a vulnerabilidade residual é mais relevante. |
| Renda e Trabalho | -0,139 (segunda maior melhoria) | ~35-40% (elevado) | Confirmado: segunda dimensão mais dinâmica. Tensão entre polo de emprego e vulnerabilidade persistente. |

> Conclusão metodológica: a distribuição histórica da variação do IVS por dimensão é consistente com as hipóteses de peso do IVS-H. A calibração definitiva será realizada após o cálculo com dados reais (CadÚnico dez/2025 + Censo 2022).

---

## Dimensão 1 — Infraestrutura Urbana

**2 variáveis no IVS-H | Peso IPEA: 33% | Peso IVS-H (hipótese): ~15-20%**

> IU_03 foi migrada para a dimensão Renda e Trabalho como RT_06/RT_07. Ver seção específica abaixo.

| N | Código | Variável | Fonte Municipal | Peso IPEA | Peso IVS-H | Direcao Risco | Observação |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | IU_01 | % pessoas em domicílios com água e esgoto inadequados | IBGE Censo 2022 / SAAE | 6,25% | ~6% | maior = pior | Cobertura elevada em Hortolândia — baixo poder discriminatório municipal. Mantém poder discriminatório territorial (entre loteamentos). Peso reduzido no IVS-H. |
| 2 | IU_02 | % população em domicílios sem coleta de lixo | IBGE Censo 2022 / Serviços Urbanos | 6,25% | ~6% | maior = pior | Mesmo raciocínio de IU_01. Peso revisável se obras futuras alterarem cobertura em loteamentos específicos. |

**Nota sobre IU_03 (variável IPEA original):**  
A variável original "% pessoas com renda menor ou igual a meio SM e deslocamento maior que 1h até o trabalho" foi descontinuada no IVS-H por ser um indicador híbrido que mistura restrição de renda (dimensão RT) com mobilidade urbana (dimensão IU). A migração para RT, com desagregação em RT_06 e RT_07 usando dados SIDRA/IBGE de fluxo intermunicipal real, representa melhoria metodológica em relação à variável original do IPEA.

---

## Dimensão 2 — Capital Humano

**8 variáveis | Peso IPEA: 33% | Peso IVS-H (hipótese): ~40-45%**

| N | Código | Variável | Fonte Municipal | Peso IPEA | Peso IVS-H | Direcao Risco | Observação |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 3 | CH_01 | Mortalidade infantil até 1 ano de idade | Secretaria de Saúde / DATASUS | 6,25% | ~5% | maior = pior | Disponível no DATASUS. Solicitar série histórica à Saúde Municipal. |
| 4 | CH_02 | % crianças de 0 a 5 anos fora da escola | Secretaria de Educação / CadÚnico | 6,25% | ~5% | maior = pior | CadÚnico registra frequência escolar. Cruzar com matrículas da Educação. |
| 5 | CH_03 | % crianças de 6 a 14 anos fora da escola | Secretaria de Educação / CadÚnico | 6,25% | ~6% | maior = pior | Evasão escolar — interface direta com CRAS e Conselho Tutelar. |
| 6 | CH_04 | % mulheres de 10 a 17 anos que tiveram filhos | Secretaria de Saúde / CadÚnico | 6,25% | ~5% | maior = pior | Variável relevante porém de disponibilidade menos estável — depende de integração intersetorial e validação com base de saúde. Sujeita a revisão de fonte. |
| 7 | CH_05 | % maes chefes de familia, sem fund. completo e com filho menor de 15 anos | CadUnico — disponivel imediatamente | 6,25% | ~8% | maior = pior | Disponível imediatamente. Alta relevância local — peso elevado no IVS-H. |
| 8 | CH_06 | Taxa de analfabetismo — populacao de 15 anos ou mais | CadUnico — disponivel imediatamente / IBGE Censo 2022 | 6,25% | ~7% | maior = pior | Disponível imediatamente. Censo 2022 permite validação para população fora do cadastro. |
| 9 | CH_07 | % criancas em domicilios sem nenhum morador com fund. completo | CadUnico — disponivel imediatamente | 6,25% | ~8% | maior = pior | Disponível imediatamente. Indicador mais poderoso de reprodução intergeracional da pobreza. |
| 10 | CH_08 | % jovens de 15 a 24 anos: nao estudam, nao trabalham e renda menor ou igual a meio SM | CadÚnico + CAGED | 6,25% | ~6% | maior = pior | Geração nem-nem em situação de vulnerabilidade econômica. Jovens fora do CadÚnico são ponto cego. CadÚnico identifica bem vulnerabilidade mas não cobre todos os jovens 15-24 do município. |

---

## Dimensão 3 — Renda e Trabalho

**7 variáveis no IVS-H (5 originais + RT_06 + RT_07) | Peso IPEA: 33% | Peso IVS-H (hipótese): ~35-40%**

| N | Código | Variável | Fonte Municipal | Peso IPEA | Peso IVS-H | Direcao Risco | Observação |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 11 | RT_01 | % pessoas com renda domiciliar per capita menor ou igual a meio SM | CadUnico — disponivel imediatamente | 6,25% | ~9% | maior = pior | Disponível imediatamente. Ponto de entrada natural do IVS-H. Renda domiciliar per capita por setor censitário não publicada pelo IBGE no Censo 2022 — CadÚnico confirmado como fonte primária. |
| 12 | RT_02 | Taxa de desocupacao — populacao de 18 anos ou mais | CadÚnico + CAGED | 6,25% | ~8% | maior = pior | CadÚnico: situação declarada. CAGED registra vínculos formais. Trabalhadores informais e parte dos MEI não aparecem no CAGED. |
| 13 | RT_03 | % pessoas 18+ sem fund. completo em ocupacao informal | CadÚnico | 6,25% | ~7% | maior = pior | Subestimação provável — cruzar com CAGED para identificar vínculo formal. |
| 14 | RT_04 | % pessoas em domicilios com renda menor ou igual a meio SM dependentes de idosos | CadUnico — disponivel imediatamente | 6,25% | ~8% | maior = pior | Disponível imediatamente. Captura fragilidade da renda do idoso como sustentação familiar. |
| 15 | RT_05 | Taxa de atividade das pessoas de 10 a 14 anos (trabalho infantil) | CadÚnico / IBGE Censo 2022 | 6,25% | ~3% | maior = pior | Interface direta com CREAS e Conselho Tutelar. Peso local reduzido decorre de: criticidade ética alta, incidência estatística menor, menor capacidade de explicar variação global do índice. |
| 16 | RT_06 | % de pessoas ocupadas que trabalham fora do municipio (condicionada: renda menor ou igual a meio SM) | IBGE Censo 2022 / SIDRA — Tabela de deslocamento intermunicipal | — | ~4% | maior = pior | Variável local — sem equivalente direto no IVS IPEA. Substitui IU_03 com dado estrutural em vez de proxy temporal. Condicionada à renda para medir vulnerabilidade real — alta mobilidade com baixa renda. Dado disponível no SIDRA. |
| 17 | RT_07 | % de pessoas que estudam fora do municipio | IBGE Censo 2022 / SIDRA — Tabela de deslocamento intermunicipal | — | ~3% | maior = pior | Variável local — sem equivalente direto no IVS IPEA. Mede déficit de oferta educacional local. Conecta com CH_02 e CH_03. Sinal de dependência territorial na formação. Dado disponível no SIDRA. |

---

## RT_06 e RT_07 — Mobilidade Intermunicipal como Variável Local

### Origem da decisão

A variável original do IPEA (IU_03) — percentual de pessoas com renda menor ou igual a meio SM e deslocamento maior que 1 hora até o trabalho — é um indicador híbrido que mistura:

- restrição de renda (dimensão Renda e Trabalho)
- dificuldade de mobilidade urbana (dimensão Infraestrutura Urbana)

A convivência dessas duas dimensões em uma única variável dentro de IU reduz a clareza conceitual da dimensão e dificulta a normalização e a auditoria do índice.

### Superioridade metodológica das variáveis locais

Os dados disponíveis no SIDRA/IBGE para Hortolândia — fluxo de pessoas que trabalham fora do município e fluxo de pessoas que estudam fora do município — permitem construir variáveis estruturalmente superiores à variável original:

| Aspecto | IU_03 IPEA original | RT_06 / RT_07 IVS-H |
| --- | --- | --- |
| Natureza do dado | Proxy (tempo de deslocamento > 1h) | Medida estrutural (fluxo real intermunicipal) |
| Disponibilidade | Censo 2022 microdados | SIDRA — tabela agregada disponivel |
| Interpretacao | Indireta | Direta |
| Dimensao conceitualmente correta | IU (discutivel) | RT (dependencia economica territorial) |
| Poder analitico | Moderado | Alto — conecta com planejamento economico |

### Interpretação territorial

| Situação | Leitura analítica |
| --- | --- |
| Alto % trabalha fora | Economia local não absorve a força de trabalho residente |
| Alto % estuda fora | Déficit de oferta educacional local |
| Ambos altos com baixa renda | Território com alta dependência funcional da região |

> Alta mobilidade com alta renda = oportunidade.  
> Alta mobilidade com baixa renda = vulnerabilidade.  
> Por isso RT_06 é condicionada: % de pessoas com renda menor ou igual a meio SM que trabalham fora do município.

### Conexão estratégica

RT_06 e RT_07 conectam o IVS-H diretamente com o planejamento econômico municipal, permitindo responder:

- Quais loteamentos dependem mais de emprego externo?
- Onde investir em geração de emprego local?
- Onde há maior custo de transporte sobre renda vulnerável?
- Onde a oferta educacional local é insuficiente?

Essa conexão transforma o IVS-H em instrumento de diálogo entre a Inclusão Social e o Desenvolvimento Econômico — integração intersetorial direta.

---

## Disponibilidade das Variáveis

| Status | Qtd | Variáveis | Próximo passo |
| --- | --- | --- | --- |
| Disponível imediatamente — CadÚnico | 5 | CH_05, CH_06, CH_07, RT_01, RT_04 | Calcular subíndice IVS-H parcial com CadÚnico dez/2025 |
| Disponível — SIDRA/IBGE | 2 | RT_06, RT_07 | Extrair tabela de deslocamento intermunicipal do SIDRA |
| Parcial — curto prazo | 9 | IU_01, IU_02, CH_01, CH_02, CH_03, CH_08, RT_02, RT_03, RT_05 | Integrar IBGE Censo 2022, CAGED e Saúde/Educação municipal |
| Parcial — prazo médio | 1 | CH_04 | Registro de parto adolescente — integração Saúde |
| TOTAL IVS-H | 17 | — | — |

> A renda domiciliar por setor censitário ainda não foi publicada no Censo 2022. A dimensão Renda e Trabalho do IVS-H utiliza como fonte primária o CadÚnico municipal, complementado por dados administrativos (CAGED).

---

## Evolução Incremental do IVS-H

| Versão | Cobertura | Variáveis |
| --- | --- | --- |
| IVS-H v1 (parcial CadÚnico) | 5 variáveis CadÚnico + 2 SIDRA | CH_05, CH_06, CH_07, RT_01, RT_04, RT_06, RT_07 |
| IVS-H v2 (expandido) | 8-10 variáveis | + IBGE Censo 2022, CAGED |
| IVS-H v3 (intersetorial) | 12+ variáveis | + Saúde, Educação municipal |
| IVS-H v4 (consolidado) | 17 variáveis — sistema completo | Todas as fontes integradas |

---

## Referências Cruzadas

| Documento | Localização no repositório |
| --- | --- |
| DIM_VARIAVEL_IVS v01r5 (detalhe técnico completo) | `02_modelagem_lógica/dim_variavel_IVS_v01r5.md` |
| nota_tecnica_fato_ivs_loteamento v04 | `02_modelagem_lógica/nota_tecnica_fato_ivs_loteamento_v04.sql` |
| DIM_PROGRAMA v04 | `01_modelagem_conceitual/dim_programa_v04.md` |
| Palestra marco 2026 v05 | `00_governanca/palestra_marco_2026_v05.md` |
| Linha de base empírica IVS IPEA | `referencias_ipea/ivs_ipea_hortolandia/bq-results-20260313-195741.csv` |

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "10/03/2026" | Criação — comparativo das 16 variáveis IVS x IVS-H; resumo executivo por dimensão; tabela de disponibilidade municipal |
| v02 | "11/03/2026" | Correção: 3 variáveis para 5 variáveis disponíveis no CadÚnico; padronização de meio SM; redação CH_08; nota territorial; nota CadÚnico; nota RT expandida |
| v03 | "11/03/2026" | RT_02: observações sobre CAGED e MEI; IU_03: caracterizado como indicador híbrido; referência Nardo et al. (OCDE, 2008) |
| v04 | "13/03/2026" | Seção Linha de Base Empírica: IVS IPEA 2000/2010 via BigQuery; tabela de validação empírica das hipóteses de peso; conclusão metodológica |
| v05 | "18/03/2026" | IU_03 migrada para RT: criadas RT_06 (% ocupados que trabalham fora do municipio, condicionada a renda menor ou igual a meio SM) e RT_07 (% que estudam fora do municipio), com fonte SIDRA/IBGE — variáveis locais superiores à variável original do IPEA. Coluna direcao_risco adicionada a todas as dimensões. IVS-H passa de 16 para 17 variáveis. Resumo executivo, tabela de disponibilidade e referências cruzadas atualizados. Seção RT_06/RT_07 adicionada com justificativa metodológica e interpretação territorial. |

---

*Documento de comunicação institucional — `00_governanca/`.*  
*Atlas Social de Hortolândia — uso interno.*
