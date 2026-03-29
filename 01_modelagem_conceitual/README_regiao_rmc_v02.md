# README — DIM_REGIAO_RMC

**Versão:** v02  
**Data:** "29/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 01_modelagem_conceitual  
**Status:** planejada — não implementada

---

## 1. Motivação

Hortolândia não existe como município autônomo — ela funciona como nó
de um sistema urbano mais amplo, a Região Metropolitana de Campinas (RMC).
O crescimento populacional acelerado do município não é fenômeno isolado:
há fortes indícios de que esteja associado à dinâmica imobiliária e
econômica da RMC, especialmente Campinas — hipótese que será testada a
partir dos microdados do Censo 2022 e bases complementares. Ao mesmo
tempo, o parque industrial de Hortolândia — um dos maiores do interior
paulista — possivelmente atrai trabalhadores que residem em outros
municípios e se deslocam diariamente para trabalhar aqui, gerando riqueza
que pode não se converter em moradia ou consumo local. Esse duplo fluxo
— suburbanização da pobreza em um sentido, drenagem de renda em outro —
sugere um paradoxo que o IVS municipal sozinho não consegue resolver:
município com base industrial forte e IVS alto coexistindo no mesmo
território. Sem o modelo regional, o Atlas Social descreve sintomas.
Com ele, poderá passar a explicar causas — desde que as hipóteses
sejam confirmadas pelos dados.

---

## 2. Estrutura Prevista

### DIM_REGIAO_RMC
*conceitual — não implementada*

```
id_regiao
nome_regiao
tipo_regiao         (metropolitana | administrativa | planejamento)
municipios_associados
populacao_total
area_km2
pib_regional        (fonte SEADE — roadmap)
fonte
ano_referencia
```

### DIM_POPULACAO
*conceitual — não implementada*

> **Nota técnica:** esta dimensão possui natureza híbrida — é uma dimensão
> temporal agregada, não um atributo estático. Contém série temporal
> (ano, população, taxa de crescimento) e poderá futuramente evoluir para
> tabela fato (`FATO_POPULACAO_MUNICIPAL`). Mantida como dimensão por
> simplicidade nesta fase conceitual.

```
id_municipio
ano
populacao_total
taxa_crescimento_anual
densidade_demografica
migracao_liquida      (entradas - saídas — fonte Censo microdados)
origem_predominante   (município de origem dos migrantes recentes)
fonte                 (IBGE Censo | IBGE Estimativa | SEADE)
```

### DIM_FLUXO_REGIONAL
*conceitual — não implementada*

```
id_fluxo
municipio_origem
municipio_destino
tipo_fluxo          (moradia | trabalho | renda | estudo)
sentido             (entrada | saída)
volume_estimado     (pessoas/dia ou pessoas/ano)
renda_media_fluxo   (se disponível)
fonte               (Censo microdados | RAIS | CAGED)
ano_referencia
```

---

## 3. Hipóteses Centrais a Verificar

| # | Hipótese | Dado necessário | Fonte | status_validacao |
| --- | --- | --- | --- | --- |
| H1 | Migrantes recentes para Hortolândia têm renda per capita menor que a média local | Microdados Censo 2022 — pergunta de migração + renda | IBGE | não testada |
| H2 | Origem predominante dos migrantes é Campinas e RMC | Microdados Censo 2022 — município de residência anterior | IBGE | não testada |
| H3 | Trabalhadores do parque industrial residem fora de Hortolândia | RAIS cruzada com CEP de residência | Ministério do Trabalho | não testada |
| H4 | Loteamentos próximos ao anel viário concentram migrantes recentes | Microdados Censo 2022 georreferenciados | IBGE | não testada |
| H5 | Crescimento populacional pressiona CRAS com defasagem de 2-3 anos | CadÚnico série histórica + estimativas IBGE | MDS / IBGE | não testada |

> **Nota:** o campo `status_validacao` assumirá os valores:
> `não testada | em teste | validada | refutada`.
> Hipóteses refutadas permanecem no registro — a ausência de evidência
> também é dado metodológico.

---

## 4. Dependência de Dados

| Fonte | O que entrega | Status | Caminho |
| --- | --- | --- | --- |
| CadÚnico municipal | Endereço, composição familiar, renda declarada, atualização temporal | Já disponível (parcial) | Uso imediato |
| IBGE Censo 2022 — microdados | Migração recente, pendularidade, renda por setor censitário | Disponível — acesso via FTP IBGE | Fase 2 |
| IBGE Estimativas populacionais | Série histórica 2000–2024 por município | Disponível | Imediato |
| RAIS / CAGED | Fluxo de trabalhadores por município de estabelecimento | Depende de convênio ou acesso via plataforma do Ministério do Trabalho | Roadmap |
| SEADE | PIB municipal, VAB setorial, renda per capita municipal | Disponível publicamente | Fase 2 |
| CONDEMAT | Dados regionais RMC — mobilidade e planejamento | Depende de contato institucional | Roadmap |
| Microdados Censo — município de trabalho | Pendularidade saída (moradores de Hortolândia que trabalham fora) | Disponível via microdados | Fase 2 |
| Microdados Campinas — município de trabalho | Pendularidade entrada (moradores de Campinas que trabalham em Hortolândia) | Disponível via microdados | Fase 2 |

> **Nota sobre CadÚnico:** não substitui o IBGE — opera como sensor
> em tempo quase real da população cadastrada. Permite monitorar pressão
> sobre a rede antes que os dados censitários estejam disponíveis.
> Limitação estrutural: cobre apenas a população inscrita no cadastro,
> não a população total do município.

---

## 5. Impacto no Modelo

A incorporação do modelo regional transforma o Atlas Social em dois aspectos:

**Analítico:** o IVS-H deixa de ser apenas descritivo e passa a ser
explicativo — conectando vulnerabilidade local a dinâmicas metropolitanas
que estão fora do controle municipal mas dentro do escopo de planejamento
regional.

**Político:** oferece ao município argumento técnico para demandas junto
ao Estado e à RMC — especialmente no que se refere a financiamento de
CRAS, habitação social e mobilidade urbana. A vulnerabilidade de
Hortolândia é, em parte, produzida fora de Hortolândia.

---

## 6. Conexão com Instrumentos Existentes

| Instrumento | Conexão |
| --- | --- |
| IVS-H | Variável IU_03 já captura deslocamento > 1h com renda baixa — interface direta com fluxo regional |
| IPST-H | Eixo de mobilidade intermunicipal (RT_06/RT_07) alimentado por DIM_FLUXO_REGIONAL |
| FATO_VARIAVEL_IVS_LOTEAMENTO | Loteamentos próximos ao anel viário devem concentrar migrantes recentes — hipótese H4 |

---

## 7. Próximos Passos

1. Incorporar série histórica populacional (IBGE estimativas) em
   `DIM_POPULACAO` assim que estrutura for aprovada
2. Acessar microdados Censo 2022 via FTP IBGE para testar H1 e H2
3. Avaliar acesso à RAIS via plataforma do Ministério do Trabalho para H3
4. Contato institucional com CONDEMAT para dados regionais de mobilidade

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "29/03/2026" | Criação — motivação, estrutura conceitual de três dimensões (DIM_REGIAO_RMC, DIM_POPULACAO, DIM_FLUXO_REGIONAL), cinco hipóteses centrais, mapa de dependência de dados. Originado de análise de padrões imobiliários metropolitanos e hipótese de suburbanização da pobreza na RMC. |
| v02 | "29/03/2026" | Quatro ajustes: (1) Motivação reescrita — tom causal substituído por hipótese estruturada; (2) DIM_POPULACAO: nota técnica de natureza híbrida adicionada, com menção à evolução futura para FATO_POPULACAO_MUNICIPAL; (3) Hipóteses: campo status_validacao adicionado (não testada / em teste / validada / refutada); (4) Dependência de dados: CadÚnico incluído como sensor em tempo quase real, com nota de limitação de cobertura. |

---

*Documento conceitual — 01_modelagem_conceitual/*  
*Atlas Social de Hortolândia — uso interno*
