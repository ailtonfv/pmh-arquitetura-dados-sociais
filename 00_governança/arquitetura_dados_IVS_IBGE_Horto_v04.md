[arquitetura_dados_IVS_IBGE_Horto_v05.md](https://github.com/user-attachments/files/26024741/arquitetura_dados_IVS_IBGE_Horto_v05.md)
*Documento de governança — 00_governanca/*  
*Atlas Social de Hortolândia — uso interno*

Arquitetura de Obtenção de Dados — IVS / IBGE / Hortolândia
Versão: v05  
Data: 2026-03-16  
Responsável: Ailton Vendramini  
Repositório: Atlas-Social-de-Hortolândia / 00_governanca  
Origem: Pesquisa documental — `arquitetura_obtenção_de_dados_IVS.docx`
> Este arquivo documenta **de onde vêm os dados** necessários para construir
> o IVS-H (Índice de Vulnerabilidade Social de Hortolândia).
> Não é modelagem conceitual — é decisão de governança de fontes.
> Responde à pergunta: *quais arquivos baixar, de quais sistemas, com qual filtro?*
---
0. Escopo Territorial do IVS-H
Este projeto opera em três escalas territoriais distintas, cada uma com finalidade própria:
Escala	Índice	Finalidade
Brasil	IVS IPEA	Referência metodológica e comparação nacional
Município	IVS-H municipal	Posicionamento de Hortolândia no contexto regional
Território	IVS-H por loteamento / núcleo / CRAS	Instrumento de gestão pública local
> A escala territorial (loteamento / núcleo / CRAS) é o diferencial
> estratégico do IVS-H. É nela que a política pública opera —
> e é nela que o Atlas Social de Hortolândia entrega valor.

---
0.1 Contexto Territorial — Hortolândia no Arranjo Populacional de Campinas

**Fonte:** IBGE. *Arranjos Populacionais e Concentrações Urbanas do Brasil*. 2ª ed. Rio de Janeiro: IBGE, 2016. Tabela 1.1, p. 78. ISBN 978-85-240-4406-9.

O IBGE classifica Hortolândia como integrante do **Arranjo Populacional de Campinas/SP** — uma das 11 grandes concentrações urbanas brasileiras na faixa de 1 a 2,5 milhões de habitantes. Em 2010, o arranjo somava **1.874.442 habitantes** e PIB de **R$ 71,4 bilhões**, com destaque para a indústria (26,9% do valor adicionado).

> O índice de integração de 0,42 indica **integração funcional elevada** com o arranjo regional — não necessariamente dependência econômica. Em regiões metropolitanas maduras como Campinas, os fluxos pendulares são bidirecionais. A natureza da relação (dormitório, polo ou município integrado) requer o saldo pendular completo (entradas − saídas), dado que será obtido na etapa 2 do roadmap desta dimensão. Ver `dim_dinamica_metropolitana_v01.md`.

A tabela abaixo reproduz os dados de Hortolândia conforme registrados na Tabela 1.1 do estudo:

| Atributo | Valor (Censo 2010) |
|---|---|
| Código IBGE | 3519071 |
| População total | 192.692 hab. |
| Núcleo do arranjo? | Não (núcleo = Campinas) |
| Pessoas que trabalham/estudam em outros municípios do arranjo | 58.472 |
| **Índice de integração** | **0,42** |
| Mancha urbanizada contígua com Campinas | Sim |
| Município desmembrado após 1988 | Sim (separou-se de Sumaré em 1991) |
| Nível de integração | 1 (integração direta com Campinas) |

**Três implicações diretas para o IVS-H:**

**a) O índice de integração 0,42 revela mobilidade estrutural da população**

Aproximadamente 30% da população de Hortolândia (58.472 de 192.692 habitantes) trabalha ou estuda em outro município do arranjo. Esse é o terceiro índice mais alto do Arranjo de Campinas — só Paulínia (0,43) é levemente superior. Isso significa que a vulnerabilidade social no município não pode ser lida apenas como fenômeno interno. Renda, emprego e mobilidade das famílias cadastradas no CadÚnico atravessam fronteiras municipais. O CAGED municipal, por exemplo, pode subestimar inserção produtiva ao capturar apenas vínculos formais internos ao município.

**b) O desmembramento de 1991 explica inconsistências territoriais**

Hortolândia separou-se de Sumaré em 1991. Esse histórico explica, ao menos parcialmente, as inconsistências territoriais já identificadas no projeto — incluindo os 12 loteamentos que aparecem simultaneamente em dois CRAS e os 39 loteamentos sem correspondência no cadastro oficial da PMH. O município ainda carrega herança de uma divisão administrativa recente, com limites que nem sempre coincidem com a identidade de bairro ou com os cadastros federais.

**c) Posicionamento numa concentração urbana de escala regional**

Hortolândia está inserida numa dinâmica econômica regional forte. Isso torna ainda mais relevante identificar *quem fica de fora* dessa dinâmica — a população vulnerável que o IVS-H pretende mapear, localizar e subsidiar com política pública qualificada.

> **Nota para apresentações institucionais:** o conceito de "arranjo populacional" (IBGE, 2016)
> pode ser citado para justificar por que o IVS-H deve, em ciclos futuros, dialogar com
> dados de municípios vizinhos (CAGED regional, comparações intermunicipais).
> Trata-se de referência IBGE oficial — não de construção própria do projeto.

---
1. Premissas Fundamentais
1.1 IBGE e IPEA têm papéis distintos
Organização	Papel
IBGE	Fornece os dados brutos — Censo Demográfico, agregados por município
IPEA	Calcula o IVS a partir dos dados brutos do IBGE
O IVS não é produzido pelo IBGE. Ele foi desenvolvido pelo Instituto de Pesquisa
Econômica Aplicada no projeto Atlas da Vulnerabilidade Social (2015).
> Implicação direta: não existe um arquivo "IVS.csv" no site do IBGE.
> O IVS é um índice calculado — seus insumos são os microdados e agregados censitários.
---
1.2 O IVS não é calculado anualmente
O IVS depende de variáveis censitárias profundas. Ele só existe quando há Censo Demográfico.
Versões disponíveis até hoje:
Ano	Situação
2000	Disponível no Atlas IPEA
2010	Disponível no Atlas IPEA
2022	Censo concluído — processamento do IVS em andamento no IPEA
Não existe IVS 2015, IVS 2018, IVS 2020 ou qualquer ano intercensal.
> **Esta é a razão de existência do IVS-H:**
> o município não pode esperar 10 anos entre medições.
> O IVS-H substitui a periodicidade censitária por atualização anual
> via dados administrativos municipais.
>
> Dados administrativos municipais possuem maior frequência temporal
> e maior granularidade territorial, permitindo monitoramento contínuo
> da vulnerabilidade social — algo que o índice nacional, por definição,
> não é capaz de oferecer.
---
1.3 O código IBGE de Hortolândia
```
codigo_municipio = 3519071
```
> ⚠️ Atenção: este é o código correto, confirmado pela base do IBGE.
> Qualquer script de filtro deve usar exatamente este valor.
> Código incorreto resulta em dados de outro município sem aviso de erro.

**Confirmação oficial — BET/IBGE 2024:**

Fonte: IBGE. *Banco de Estruturas Territoriais (BET) — Relatório de Divisão Territorial Brasileira*. Data base: 31/12/2024.

| campo | valor |
|-------|-------|
| UF | 35 — São Paulo |
| Região Geográfica Intermediária | 3510 — Campinas |
| Região Geográfica Imediata | 350038 — Campinas |
| Código Município Completo | **3519071** — Hortolândia |

> Esta é a referência oficial mais recente disponível (data base 31/12/2024).
> Confirma o código utilizado em todos os scripts e filtros do projeto.
> A Região Geográfica Intermediária de Campinas (3510) é o equivalente
> moderno — metodologia IBGE 2017 — da área de influência do
> Arranjo Populacional de Campinas documentado na Seção 0.1.
---
2. O que o Censo 2022 fornece para o IVS-H
O Censo Demográfico fornece os insumos primários para a maioria dos indicadores
do IVS, enquanto alguns dependem de estimativas complementares ou registros
administrativos.
Dimensão	Variáveis com insumos no Censo	Variáveis a complementar
Infraestrutura Urbana	Abastecimento de água, esgoto, coleta de lixo, renda domiciliar per capita	Tempo de deslocamento casa-trabalho (PNAD / estimativa)
Capital Humano	Analfabetismo, frequência escolar (0–5, 6–14, 15–17), estrutura etária, fecundidade	Mortalidade infantil (SIM/DATASUS)
Renda e Trabalho	Renda domiciliar per capita ≤ ½ SM, estrutura etária de dependência	Desocupação, carteira assinada, nem-nem (CAGED / CadÚnico / PNAD)
> Os indicadores não cobertos pelo Censo **podem vir de fontes administrativas municipais**:
> CadÚnico, Secretaria de Saúde (e-SUS / SIM), Secretaria de Educação, CAGED.
> Essa é a espinha dorsal da integração intersetorial do IVS-H.
---
3. Os 7 Arquivos IBGE Necessários
Todos disponíveis em:
`https://www.ibge.gov.br/estatisticas/sociais/populacao/22827-censo-demografico-2022.html`
Os 7 arquivos foram baixados e filtrados por `3519071`. Arquivos disponíveis em `filtrado_hortolandia/`.
3.1 Estrutura básica da população
Arquivo: `Agregados_por_municipios_basico_BR_20250417.zip`  
Contém: população total, domicílios, estrutura demográfica básica  
Dimensão IVS-H: base para denominadores de todos os indicadores
3.2 Alfabetização
Arquivo: `Agregados_por_municipios_alfabetizacao_BR.zip`  
Contém: taxa de analfabetismo por faixa etária  
Dimensão IVS-H: `capital_humano` — variável CH_analfabetismo (15 anos ou mais)
3.3 Demografia
Arquivo: `Agregados_por_municipios_demografia_BR.zip`  
Contém: estrutura etária detalhada, fecundidade, mortalidade  
Dimensão IVS-H: `capital_humano` — variáveis CH_criancas, CH_jovens, CH_gravidez_precoce
3.4 Características dos domicílios (3 arquivos)
Arquivos: `domicilio1`, `domicilio2`, `domicilio3`  
Contém: abastecimento de água, esgotamento sanitário, coleta de lixo, condições habitacionais  
Dimensão IVS-H: `infraestrutura_urbana` — variáveis IU_agua, IU_esgoto, IU_lixo
> Os três arquivos foram baixados e filtrados. A distribuição exata das variáveis
> entre domicilio1/2/3 deve ser verificada via dicionário antes de descartar qualquer um.
3.5 Rendimento
Arquivo: `Agregados_por_municipios_rendimento_BR.zip`  
(pode aparecer como: `Agregados_por_municipios_rendimento_responsavel_domicilio_BR.zip`)  
Contém: renda do responsável pelo domicílio  
Dimensão IVS-H: `renda_trabalho`
> ⚠️ **Confirmado em 13/03/2026:** a renda domiciliar per capita por setor censitário
> **não está publicada pelo IBGE** no Censo 2022 até esta data.
> O arquivo disponível contém apenas `V06004` — rendimento médio mensal do responsável
> pelo domicílio — que não equivale à renda per capita familiar.
>
> **Decisão:** a variável RT_01 (renda domiciliar per capita ≤ ½ SM) terá o
> **CadÚnico como fonte primária confirmada** para o IVS-H, até que o IBGE
> publique a renda per capita por setor censitário do Censo 2022.
---
Arquivos que não são necessários neste ciclo
Arquivo	Motivo
parentesco	Não é variável do IVS
cor_ou_raca	Relevante para análises específicas — fora do escopo do IVS-H inicial
domicilios_indigenas	Fora do escopo
domicilios_quilombolas	Fora do escopo
pessoas_indigenas	Fora do escopo
pessoas_quilombolas	Fora do escopo
---
4. Filtro Municipal
Após download, todos os arquivos devem ser filtrados pelo código do município:
```python
codigo_municipio = "3519071"   # Hortolândia — NÃO alterar

df_hortolandia = df[df["codigo_municipio"] == codigo_municipio]
```
> O volume dos arquivos nacionais é grande. O filtro reduz cada arquivo
> a uma única linha — o registro de Hortolândia. Isso gera arquivos
> pequenos, manipuláveis e auditáveis.
---
5. Pipeline Analítico — IVS-H
O projeto adota um pipeline analítico estruturado em camadas
(`raw → filtrado → variáveis → índice`), que garante rastreabilidade,
reprodutibilidade e auditabilidade em cada etapa de transformação.
```
raw_IBGE/
  ├─ agregados_basico.zip
  ├─ agregados_alfabetizacao.zip
  ├─ agregados_demografia.zip
  ├─ agregados_domicilios1.zip
  ├─ agregados_domicilios2.zip
  ├─ agregados_domicilios3.zip
  └─ agregados_rendimento.zip
        ↓
        filtro: codigo_municipio = 3519071
        ↓
filtrado_hortolandia/             ✅ 7 arquivos gerados em 12/03/2026
  ├─ basico_3519071.csv
  ├─ alfabetizacao_3519071.csv
  ├─ demografia_3519071.csv
  ├─ domicilio1_3519071.csv
  ├─ domicilio2_3519071.csv
  ├─ domicilio3_3519071.csv
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

referencias_ipea/                 ✅ criada em 13/03/2026
  └─ ivs_ipea_hortolandia/
       └─ bq-results-20260313-195741.csv   (IVS IPEA 2000/2010 — Google BigQuery)

pesos/                            ✅ criada em 13/03/2026
  ├─ pesos_IVS_oficial/          (pesos originais IPEA — referência preservada)
  └─ pesos_IVS_H/                (pesos calibrados localmente para Hortolândia — a definir)
```
> Essa arquitetura em camadas (`raw → filtrado → variáveis → índice`)
> é o mesmo padrão adotado em Data Lakes e pipelines ELT modernos,
> aplicado à escala e aos recursos disponíveis no município.
> Princípios idênticos aos estabelecidos nas diretrizes do projeto:
> staging layer como etapa obrigatória antes da camada analítica.
---
6. O IVS do IPEA para Hortolândia — Referência Histórica
O IVS calculado pelo IPEA para Hortolândia (anos censitários) serve como:
Ponto zero — linha de base metodológica para validar o IVS-H
Âncora de calibração — comparar o IVS-H calculado localmente com o IVS IPEA
Referência de comunicação — o IVS IPEA é reconhecido institucionalmente
Dados obtidos em 13/03/2026 via Google BigQuery:
Dataset: `basedosdados.br_ipea_avs.municipio` | Código: `3519071`
Dimensão	2000	2010	Variação	Interpretação
IVS Geral	0,399	0,293	−0,106	Melhora significativa
Infraestrutura Urbana	0,349	0,354	+0,005	Estável (baixo poder discriminatório)
Capital Humano	0,445	0,258	−0,187	Maior melhora — confirma peso elevado no IVS-H
Renda e Trabalho	0,405	0,266	−0,139	Melhora expressiva
> Quanto menor o índice, menor a vulnerabilidade.
> Arquivo exportado: `referencias_ipea/ivs_ipea_hortolandia/bq-results-20260313-195741.csv`
Como obter (para reprodução futura):
Site: `http://ivs.ipea.gov.br/`
API IPEADATA: `http://www.ipeadata.gov.br/api/odata4/`
Google BigQuery (Base dos Dados): `basedosdados.br_ipea_avs.municipio`
Script pronto: `busca_ivs_hortolandia_v2.py` (disponível no projeto)
---
7. IVS Nacional × IVS-H — Posicionamento Estratégico
Dimensão	IVS Nacional (IPEA)	IVS-H (este projeto)
Escala	Brasil — setores censitários	Hortolândia — loteamentos
Periodicidade	Decenal (anos censitários)	Anual (dados administrativos)
Fonte principal	Censo Demográfico IBGE	CadÚnico + CAGED + Saúde + Educação
Finalidade	Fotografia nacional comparativa	Instrumento de gestão pública local
Atualização	A cada Censo	A cada ano — IVS-H 2022, 2023, 2024, 2025...
> A combinação de indicador social composto + atualização anual +
> integração intersetorial + granularidade territorial (loteamento)
> **praticamente não existe em municípios brasileiros**.
> O IVS-H posiciona Hortolândia em fronteira metodológica na
> governança de dados aplicada à política pública.
---
8. Próximos Passos
#	Ação	Responsável	Status
1	Baixar os 7 arquivos IBGE (incluindo domicilio2 e domicilio3)	Ailton (máquina Debian)	✅ Concluído 12/03/2026
2	Obter IVS IPEA 2000/2010 para Hortolândia	Ailton (máquina Debian)	✅ Concluído 13/03/2026 — via BigQuery
3	Aplicar filtro `3519071` e gerar `filtrado_hortolandia/`	Ailton (máquina Debian)	✅ Concluído 12/03/2026
4	Verificar dicionário de variáveis do domicilio1/2/3 — identificar onde estão IU_agua, IU_esgoto, IU_lixo	Ailton + Claude	⏳ Próxima sessão
5	Mapear variáveis IBGE para `dim_variavel_IVS_v01r3.md`	Ailton + Claude	⏳ Próxima sessão
6	Definir pesos IVS-H em `pesos/pesos_IVS_H/`	Ailton + Claude	⏳ Próxima sessão
7	Popular `schema_IVS.sql` com dados reais	Ailton (Debian / SQLite)	⏳ Aguarda passos 4 e 5
---
Log de Alterações
Versão	Data	Alterações
v01	2026-03-12	Criação — baseado em `arquitetura_obtenção_de_dados_IVS.docx`; premissas IBGE/IPEA; 5 arquivos mapeados; pipeline completo; posicionamento IVS × IVS-H; correção do código IBGE (3529401 → 3519071)
v02	2026-03-12	Seção 0 adicionada: escopo territorial em três escalas (Brasil / Município / Território). Frase sobre "9 a 12 variáveis" substituída por formulação metodologicamente mais cautelosa. Nota sobre domicilio1/2/3 adicionada na Seção 3.4. "mini Data Lake" substituído por "pipeline analítico estruturado em camadas". Frase sobre dados administrativos e monitoramento contínuo adicionada na Seção 1.2. Trecho de posicionamento estratégico reforçado na Seção 7. Passo 4 adicionado na Seção 8.
v03	2026-03-13	Seção 3.5: confirmação empírica de que renda per capita por setor censitário não está publicada pelo IBGE — CadÚnico definido como fonte primária de RT_01. Seção 5: pastas `referencias_ipea/` e `pesos/` registradas na estrutura do pipeline; 7 arquivos filtrados confirmados. Seção 6: dados IVS IPEA 2000/2010 obtidos via Google BigQuery (basedosdados) — tabela de resultados incluída; arquivo CSV registrado. Seção 8: passos 1, 2 e 3 marcados como concluídos; passo 6 adicionado (definir pesos IVS-H).
v04	2026-03-15	Seção 0.1 adicionada: contexto territorial de Hortolândia no Arranjo Populacional de Campinas/SP (IBGE, 2016). Índice de integração 0,42 documentado com suas três implicações para o IVS-H: mobilidade estrutural da população, herança do desmembramento de 1991 e posicionamento em concentração urbana regional. Fonte: Tabela 1.1, p. 78 do estudo IBGE.
v05	2026-03-16	Seção 1.3: adição da confirmação oficial BET/IBGE 2024 (data base 31/12/2024) — tabela com UF, Região Geográfica Intermediária (3510 — Campinas), Região Geográfica Imediata (350038 — Campinas) e código município completo (3519071). Referência mais recente disponível para o código IBGE do projeto.
---
Documento de governança — 00_governanca/  
Atlas Social de Hortolândia — uso interno
