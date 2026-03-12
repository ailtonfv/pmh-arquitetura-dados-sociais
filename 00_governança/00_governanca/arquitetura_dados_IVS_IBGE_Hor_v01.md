# Arquitetura de Obtenção de Dados — IVS / IBGE / Hortolândia
**Versão:** v01  
**Data:** "12/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 00_governanca  
**Origem:** Pesquisa documental — `arquitetura_obtenção_de_dados_IVS.docx`

> Este arquivo documenta **de onde vêm os dados** necessários para construir
> o IVS-H (Índice de Vulnerabilidade Social de Hortolândia).
> Não é modelagem conceitual — é decisão de governança de fontes.
> Responde à pergunta: *quais arquivos baixar, de quais sistemas, com qual filtro?*

---

## 1. Premissas Fundamentais

### 1.1 IBGE e IPEA têm papéis distintos

| Organização | Papel |
|---|---|
| **IBGE** | Fornece os dados brutos — Censo Demográfico, agregados por município |
| **IPEA** | Calcula o IVS a partir dos dados brutos do IBGE |

O IVS **não é produzido pelo IBGE**. Ele foi desenvolvido pelo Instituto de Pesquisa
Econômica Aplicada no projeto **Atlas da Vulnerabilidade Social** (2015).

> Implicação direta: não existe um arquivo "IVS.csv" no site do IBGE.
> O IVS é um índice calculado — seus insumos são os microdados e agregados censitários.

---

### 1.2 O IVS não é calculado anualmente

O IVS depende de variáveis censitárias profundas. Ele só existe quando há Censo Demográfico.

Versões disponíveis até hoje:

| Ano | Situação |
|---|---|
| 2000 | Disponível no Atlas IPEA |
| 2010 | Disponível no Atlas IPEA |
| 2022 | Censo concluído — processamento do IVS em andamento no IPEA |

Não existe IVS 2015, IVS 2018, IVS 2020 ou qualquer ano intercensal.

> **Esta é a razão de existência do IVS-H:**
> o município não pode esperar 10 anos entre medições.
> O IVS-H substitui a periodicidade censitária por atualização anual
> via dados administrativos municipais.

---

### 1.3 O código IBGE de Hortolândia

```
codigo_municipio = 3519071
```

> ⚠️ Atenção: este é o código correto. Qualquer script de filtro deve usar
> exatamente este valor. Código incorreto resulta em dados de outro município.

---

## 2. O que o Censo 2022 fornece para o IVS-H

Das 16 variáveis do IVS nacional, o Censo 2022 cobre diretamente entre **9 e 12**,
dependendo da granularidade disponível nos agregados municipais.

| Dimensão | Variáveis cobertas pelo Censo | Variáveis a complementar |
|---|---|---|
| Infraestrutura Urbana | Abastecimento de água, esgoto, coleta de lixo, renda domiciliar per capita | Tempo de deslocamento casa-trabalho (PNAD / estimativa) |
| Capital Humano | Analfabetismo, frequência escolar (0–5, 6–14, 15–17), estrutura etária, fecundidade | Mortalidade infantil (SIM/DATASUS) |
| Renda e Trabalho | Renda domiciliar per capita ≤ ½ SM, estrutura etária de dependência | Desocupação, carteira assinada, nem-nem (CAGED / CadÚnico / PNAD) |

> Os indicadores não cobertos pelo Censo **podem vir de fontes administrativas municipais**:
> CadÚnico, Secretaria de Saúde (e-SUS / SIM), Secretaria de Educação, CAGED.
> Essa é a espinha dorsal da integração intersetorial do IVS-H.

---

## 3. Os 5 Arquivos IBGE Necessários

Todos disponíveis em:
`https://www.ibge.gov.br/estatisticas/sociais/populacao/22827-censo-demografico-2022.html`

### 3.1 Estrutura básica da população
**Arquivo:** `Agregados_por_municipios_basico_BR_20250417.zip`  
**Contém:** população total, domicílios, estrutura demográfica básica  
**Dimensão IVS-H:** base para denominadores de todos os indicadores

### 3.2 Alfabetização
**Arquivo:** `Agregados_por_municipios_alfabetizacao_BR.zip`  
**Contém:** taxa de analfabetismo por faixa etária  
**Dimensão IVS-H:** `capital_humano` — variável CH_analfabetismo (15 anos ou mais)

### 3.3 Demografia
**Arquivo:** `Agregados_por_municipios_demografia_BR.zip`  
**Contém:** estrutura etária detalhada, fecundidade, mortalidade  
**Dimensão IVS-H:** `capital_humano` — variáveis CH_criancas, CH_jovens, CH_gravidez_precoce

### 3.4 Características dos domicílios
**Arquivo:** `Agregados_por_municipios_caracteristicas_domicilio1_BR.zip`  
**Contém:** abastecimento de água, esgotamento sanitário, coleta de lixo, condições habitacionais  
**Dimensão IVS-H:** `infraestrutura_urbana` — variáveis IU_agua, IU_esgoto, IU_lixo

### 3.5 Rendimento
**Arquivo:** `Agregados_por_municipios_rendimento_BR.zip`  
*(pode aparecer como: `Agregados_por_municipios_rendimento_responsavel_domicilio_BR.zip`)*  
**Contém:** renda domiciliar per capita, renda do responsável  
**Dimensão IVS-H:** `renda_trabalho` — variável RT_renda_pc e `infraestrutura_urbana` — variável IU_renda_domiciliar

---

### Arquivos que não são necessários neste ciclo

| Arquivo | Motivo |
|---|---|
| parentesco | Não é variável do IVS |
| cor_ou_raca | Relevante para análises específicas — fora do escopo do IVS-H inicial |
| domicilios_indigenas | Fora do escopo |
| domicilios_quilombolas | Fora do escopo |
| pessoas_indigenas | Fora do escopo |
| pessoas_quilombolas | Fora do escopo |

---

## 4. Filtro Municipal

Após download, todos os arquivos devem ser filtrados pelo código do município:

```python
codigo_municipio = "3519071"   # Hortolândia — NÃO alterar

df_hortolandia = df[df["codigo_municipio"] == codigo_municipio]
```

> O volume dos arquivos nacionais é grande. O filtro reduz cada arquivo
> a uma única linha — o registro de Hortolândia. Isso gera arquivos
> pequenos, manipuláveis e auditáveis.

---

## 5. Pipeline de Dados — IVS-H

```
raw_IBGE/
  ├─ agregados_basico.zip
  ├─ agregados_alfabetizacao.zip
  ├─ agregados_demografia.zip
  ├─ agregados_domicilios.zip
  └─ agregados_rendimento.zip
        ↓
        filtro: codigo_municipio = 3519071
        ↓
filtrado_hortolandia/
  ├─ basico_3519071.csv
  ├─ alfabetizacao_3519071.csv
  ├─ demografia_3519071.csv
  ├─ domicilios_3519071.csv
  └─ rendimento_3519071.csv
        ↓
        mapeamento para variáveis IVS-H
        (schema_IVS.sql + dim_variavel_IVS_v01r3.md)
        ↓
variaveis_ivsh/
  ├─ infraestrutura_urbana.csv
  ├─ capital_humano.csv
  └─ renda_trabalho.csv
        ↓
        cálculo do índice composto
        ↓
IVS-H
  ├─ ivsh_municipio.csv          (nível municipal — comparação com outros municípios)
  └─ ivsh_loteamento.csv         (nível loteamento — instrumento de gestão)
```

> Este pipeline é um **mini Data Lake municipal**. A separação em camadas
> (`raw → filtrado → variáveis → índice`) garante rastreabilidade,
> reprodutibilidade e auditabilidade — princípios já estabelecidos nas
> diretrizes do projeto.

---

## 6. O IVS do IPEA para Hortolândia — Referência Histórica

O IVS calculado pelo IPEA para Hortolândia (anos censitários) serve como:

- **Ponto zero** — linha de base metodológica para validar o IVS-H
- **Âncora de calibração** — comparar o IVS-H calculado localmente com o IVS IPEA
- **Referência de comunicação** — o IVS IPEA é reconhecido institucionalmente

**Como obter:**
- Site: `http://ivs.ipea.gov.br/`
- API IPEADATA: `http://www.ipeadata.gov.br/api/odata4/`
- Script pronto: `busca_ivs_hortolandia_v2.py` (disponível no projeto)

**Execução na máquina Debian:**
```bash
python3 busca_ivs_hortolandia_v2.py
```

Saída esperada: pasta `ivs_hortolandia/` com IVS geral e 3 dimensões para 2000 e 2010.

---

## 7. IVS Nacional × IVS-H — Posicionamento Estratégico

| Dimensão | IVS Nacional (IPEA) | IVS-H (este projeto) |
|---|---|---|
| **Escala** | Brasil — setores censitários | Hortolândia — loteamentos |
| **Periodicidade** | Decenal (anos censitários) | Anual (dados administrativos) |
| **Fonte principal** | Censo Demográfico IBGE | CadÚnico + CAGED + Saúde + Educação |
| **Finalidade** | Fotografia nacional comparativa | Instrumento de gestão pública local |
| **Atualização** | A cada Censo | A cada ano — IVS-H 2022, 2023, 2024, 2025... |

> Segundo levantamento realizado em "12/03/2026", a construção de um IVS
> municipal com atualização anual via dados administrativos **praticamente
> não existe em municípios brasileiros**. O IVS-H posiciona Hortolândia
> em fronteira metodológica.

---

## 8. Próximos Passos

| # | Ação | Responsável | Dependência |
|---|---|---|---|
| 1 | Baixar os 5 arquivos IBGE listados na Seção 3 | Ailton (máquina Debian) | Acesso à internet |
| 2 | Executar `busca_ivs_hortolandia_v2.py` para obter IVS IPEA 2000/2010 | Ailton (máquina Debian) | Acesso à internet |
| 3 | Aplicar filtro `3519071` e gerar `filtrado_hortolandia/` | Ailton (máquina Debian) | Passo 1 concluído |
| 4 | Mapear variáveis IBGE para `dim_variavel_IVS_v01r3.md` | Ailton + Claude | Passo 3 concluído |
| 5 | Popular `schema_IVS.sql` com dados reais | Ailton (Debian / SQLite) | Passo 4 concluído |

---

## Log de Alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | "12/03/2026" | Criação — baseado em `arquitetura_obtenção_de_dados_IVS.docx`; premissas IBGE/IPEA; 5 arquivos mapeados; pipeline completo; posicionamento IVS × IVS-H; correção do código IBGE (3529401 → 3519071) |

---

*Documento de governança — 00_governanca/*  
*Atlas Social de Hortolândia — uso interno*
