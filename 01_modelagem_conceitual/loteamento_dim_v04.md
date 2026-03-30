[loteamento_dim_v04.md](https://github.com/user-attachments/files/26358947/loteamento_dim_v04.md)[Uploading loteamento_dim_v04# DIM_MUNICIPIO_REGIOES_LOTEAMENTOS
**Versão:** v04
**Data de atualização:** "31/03/2026"
**Versão anterior:** v03 (20/03/2026)
**Atualizações v04:**
- Seção 3: nota sobre divergência de nomenclatura SIGAS × codbairro oficial
- Pendência P08: escopo ampliado — TAB_NORMALIZA_LOCALIDADE deve cobrir variações do SIGAS (padrão Correios via CEP) além das variações do CadÚnico

**Responsável:** Ailton Vendramini
**Fonte primária:** `loteamentosregiao.xlsx` — Prefeitura Municipal de Hortolândia
**Fonte secundária:** Anexo IV — Plano Diretor 2017–2020
**Repositório:** ailtonfv/Atlas-Social-de-Hortolandia

---

## 0. Princípio Arquitetural — As Três Dimensões Geográficas

Este modelo organiza o município em três dimensões geográficas com naturezas distintas e complementares:

| Dimensão | Natureza | Estabilidade | Quem define |
| --- | --- | --- | --- |
| `DIM_REGIAO_PLANEJAMENTO` | Macro-organização oficial do município | Alta — definida pelo Plano Diretor | Prefeitura (instrumento legal) |
| `DIM_LOTEAMENTO` | Unidade concreta e estável — átomo espacial do modelo | Muito alta — definida por decreto cartorial | Prefeitura (aprovação de loteamento) |
| `DIM_NUCLEO` | Agrupamento analítico e operacional — flexível por setor | Variável — reorganiza conforme cobertura | Cada secretaria define seus próprios núcleos |

O **loteamento é o átomo espacial do modelo**. Ele não muda. Jardim Amanda é Jardim Amanda. Seu codbairro, seu decreto, sua Região de Planejamento — são fatos cartoriais imutáveis.

O **núcleo é uma camada de leitura** sobre os loteamentos. A Inclusão lê com uma lente (cobertura do CRAS). A Saúde lê com outra (cobertura da UBS). A Educação com outra. Cada secretaria pode compor seus próprios núcleos agrupando loteamentos conforme sua lógica operacional — sem quebrar o modelo e sem interferir nas leituras das demais.

Essa separação é o que torna o Atlas Social intersetorial sem ser caótico: **a base é compartilhada e estável. As lentes são independentes e flexíveis.**

A relação entre loteamentos e núcleos é registrada em `REL_LOTEAMENTO_NUCLEO` com campo `setor` e controle temporal — preservando o histórico a cada reorganização de cobertura.

---

## 1. Hierarquia de Análise Adotada

```
Município de Hortolândia
    ↓
Região de Planejamento (RP)     ← Plano Diretor 2017–2020 — fonte oficial
    ↓
Núcleo                          ← conceito analítico do projeto — ver dim_nucleo_v01.md
    ↓
Loteamento                      ← unidade cartorial — codbairro = chave oficial
    ↓
Domicílio
    ↓
Família (cod_familiar_fam)
    ↓
Pessoa (CPF)
```

> O termo "território" foi eliminado do projeto por ser polissêmico.
> Ver `glossario_conceitual_v01.md` para justificativa completa e substitutos adotados.

---

## 2. Princípio Estruturante

A dimensão geográfica é analítica estruturante — não é atributo textual isolado.

A relação entre loteamentos e equipamentos de atendimento é registrada em
`REL_LOTEAMENTO_NUCLEO` — com controle temporal e campo `setor`, pois cada
política pública (Inclusão, Saúde, Educação) desenha sua própria geografia
de cobertura, e essa geografia muda a cada reorganização.

---

## 3. Sobre o `codbairro` — Pendência P04 do v01 Resolvida

O `codbairro` é o **código oficial municipal** de cada loteamento, atribuído
pela Prefeitura de Hortolândia no processo de aprovação cartorial.

**Por que adotar:**
- Resolve o problema do texto livre no CadÚnico — âncora única para normalização
- É rastreável juridicamente — vinculado ao decreto de aprovação
- Já vem vinculado à Região de Planejamento na fonte oficial
- Imune a variações de grafia do nome

**Regra:** O sistema se guia pelo `codbairro` — nunca pelo nome.
O nome é atributo de exibição e busca textual.

**Divergência SIGAS × codbairro — nota arquitetural (v04):**

O sistema municipal de atendimento socioassistencial (SIGAS) utiliza o CEP
como chave de identificação de loteamentos, adotando o nome de bairro
conforme o padrão dos Correios. Esse padrão diverge sistematicamente do
cadastro mobiliário municipal — que é a fonte do `codbairro`.

Exemplos documentados de divergência: grafias com erros de digitação
migradas de períodos anteriores ao sistema atual (ex.: variações do tipo
"Jardim Amada" vs. "Jardim Amanda"). Em loteamentos mais recentes, o nome
dos Correios pode diferir do nome cartorial oficial.

Implicação para o pipeline: qualquer integração entre SIGAS e o modelo do
Atlas Social **exige normalização via `TAB_NORMALIZA_LOCALIDADE`** — não
é possível fazer JOIN direto por nome de loteamento entre as duas fontes.
Ver Pendência P08.

**Tabela de normalização CadÚnico e SIGAS:**
```
TAB_NORMALIZA_LOCALIDADE
  texto_bruto       "Jd Amanda" | "Jardim Amanda" | "Amanda" | "Jd. Amada"
  fonte             CadUnico | SIGAS | Manual
  codbairro         351
  id_loteamento     LOT_351
  confianca         Alta | Media | Baixa
```

---

## 4. Estrutura da DIM_REGIAO_PLANEJAMENTO

```
id_rp               (padrão: RP_{codigo} — ex: RP_3)
codigo_rp           (ex: 1, 2, 3, 4, 5, 6 — conforme Plano Diretor)
nome_rp             (a confirmar via texto do Plano Diretor)
municipio           Hortolândia
ativo               (S/N)
observacoes
```

| id_rp | codigo_rp | loteamentos | principais referências |
| --- | --- | --- | --- |
| RP_1 | 1 | 4 | Remanso Campineiro, Jd. Santana |
| RP_2 | 2 | 42 | Jd. Santa Clara, Parque Ortolandia |
| RP_3 | 3 | 16 | Jd. Amanda, Jd. Boa Vista |
| RP_4 | 4 | 18 | Jd. Rosolém, Jd. Lirio |
| RP_5 | 5 | 32 | Jd. Novo Ângulo, Jd. Sumarezinho |
| RP_6 | 6 | 24 | Vila Real, Jd. Nova Hortolândia |

> 11 loteamentos em fronteira entre duas RPs — campo `fronteira = S`.

---

## 5. Estrutura da DIM_LOTEAMENTO

```
id_loteamento        (padrão: LOT_{codbairro} — ex: LOT_351)
codbairro            (código oficial municipal — chave de integração)
nome_loteamento      (nome oficial conforme aprovação cartorial)
nome_normalizado     (sem acento, maiúsculo — para padronização de busca)
tipo_loteamento      (Jardim | Vila | Parque | Residencial | Conjunto |
                      Núcleo | Chácara | Bairro | Loteamento | Outro)
id_rp                (FK → DIM_REGIAO_PLANEJAMENTO — RP primária)
rp_secundaria        (quando loteamento está em fronteira entre 2 RPs)
fronteira            (S/N)
situacao             (Ativo | Inativo)
aprovacao            (Regular | Irregular | Em regularização)
processo             (número do processo de aprovação)
ano_aprovacao
data_aprovacao
decreto
ativo                (S/N)
observacoes
```

---

## 6. Estrutura da REL_LOTEAMENTO_NUCLEO

> Relação N:N — um loteamento pertence a múltiplos núcleos (um por setor).

```
id_rel
id_loteamento        (FK → DIM_LOTEAMENTO)
id_nucleo            (FK → DIM_NUCLEO)
setor                (Inclusão | Saúde | Educação | Habitação | Outro)
fonte_delimitacao    (CRAS_cobertura | UBS_cobertura | Escola_ref | OSC | Manual)
data_inicio
data_fim             (null = vigente)
ativo                (S/N)
observacoes
```

> **Controle temporal:** a cada reorganização de abrangência, os registros
> anteriores recebem `data_fim` e novos registros são criados.
> O histórico completo é preservado.

---

## 7. Cadeia Relacional do Projeto

```
DIM_REGIAO_PLANEJAMENTO
    ↓
DIM_LOTEAMENTO
    ↓
REL_LOTEAMENTO_NUCLEO ←→ DIM_NUCLEO ←→ REL_NUCLEO_EXECUTOR
    ↓                                    ↓
DIM_DOMICILIO                DIM_UNIDADES_ATENDIMENTO + DIM_OSC
    ↓
DIM_FAMILIA
    ↓
DIM_PESSOA (CPF)
```

---

## 8. DIM_LOTEAMENTO — 141 Registros Oficiais

> Fonte: `loteamentosregiao.xlsx` — Prefeitura Municipal de Hortolândia
> Todos com situação Ativa / Aprovação Regular na fonte.
> `fronteira = S` indica loteamento na divisa entre duas RPs.

| id_loteamento | codbairro | nome_loteamento | tipo | id_rp | rp_sec | front. | ano |
| --- | --- | --- | --- | --- | --- | --- | --- |
| LOT_055 | 55 | JARDIM ALINE | Jardim | RP_5 | --- | N | 2021 |
| LOT_056 | 56 | JARDIM SANTIAGO | Jardim | RP_5 | --- | N | 2021 |
| LOT_057 | 57 | JARDIM CONCEICAO | Jardim | RP_5 | --- | N | 2021 |
| LOT_058 | 58 | VILA GUEDES | Vila | RP_5 | --- | N | 2021 |
| LOT_062 | 62 | PARQUE ORTOLANDIA | Parque | RP_2 | --- | N | 1947 |
| LOT_063 | 63 | VILA REAL | Vila | RP_6 | --- | N | 1952 |
| LOT_064 | 64 | VILA REAL CONTINUACAO | Vila | RP_6 | --- | N | 1954 |
| LOT_065 | 65 | VILA SAO FRANCISCO | Vila | RP_1 | --- | N | 1953 |
| LOT_066 | 66 | REMANSO CAMPINEIRO | Bairro | RP_1 | --- | N | 1950 |
| LOT_067 | 67 | PARQUE SAO MIGUEL | Parque | RP_2 | RP_1 | S | 1955 |
| LOT_068 | 68 | VILA SAO PEDRO | Vila | RP_6 | --- | N | 1953 |
| LOT_069 | 69 | CHACARAS NOVA BOA VISTA | Chácara | RP_5 | --- | N | --- |
| LOT_070 | 70 | CHACARAS FAZENDA DO COELHO | Chácara | RP_4 | RP_5 | S | 1965 |
| LOT_071 | 71 | JARDIM ROSOLEM | Jardim | RP_4 | --- | N | 1960 |
| LOT_072 | 72 | JARDIM BOA VISTA | Jardim | RP_3 | --- | N | 1949 |
| LOT_074 | 74 | JARDIM SANTANA | Jardim | RP_1 | RP_2 | S | 1959 |
| LOT_075 | 75 | VILA REAL SANTISTA | Vila | RP_6 | --- | N | 1955 |
| LOT_077 | 77 | CHACARAS ASSAHY | Chácara | RP_4 | --- | N | --- |
| LOT_078 | 78 | CHACARAS HAVAI | Chácara | RP_3 | --- | N | --- |
| LOT_079 | 79 | CHACARAS LUZITANA | Chácara | RP_3 | --- | N | --- |
| LOT_080 | 80 | CHACARAS ACARAI | Chácara | RP_3 | --- | N | --- |
| LOT_081 | 81 | NUCLEO SANTA IZABEL | Núcleo | RP_4 | RP_5 | S | --- |
| LOT_082 | 82 | CHACARA REYMAR | Chácara | RP_5 | --- | N | --- |
| LOT_083 | 83 | CHACARAS SAO JOSE (PANAINO) | Chácara | RP_5 | --- | N | --- |
| LOT_084 | 84 | JARDIM SANTA IZABEL | Jardim | RP_4 | RP_5 | S | 1970 |
| LOT_086 | 86 | JARDIM SUMAREZINHO | Jardim | RP_5 | --- | N | 1972 |
| LOT_088 | 88 | COLEGIO ADVENTISTA CAMPINEIRO | Outro | RP_2 | --- | N | 1952 |
| LOT_089 | 89 | JARDIM NOSSA SENHORA DE FATIMA | Jardim | RP_4 | --- | N | 1973 |
| LOT_093 | 93 | JARDIM RICARDO | Jardim | RP_4 | --- | N | 1973 |
| LOT_097 | 97 | JARDIM NOSSA SENHORA DA PENHA | Jardim | RP_4 | --- | N | 1975 |
| LOT_098 | 98 | JARDIM SAO BENEDITO | Jardim | RP_4 | --- | N | 1975 |
| LOT_118 | 118 | JARDIM NOVO HORIZONTE | Jardim | RP_3 | --- | N | 1978 |
| LOT_138 | 138 | CHACARAS PLANALTO | Chácara | RP_3 | --- | N | 1982 |
| LOT_300 | 300 | CONDOMINIO CHACARAS GROTA AZUL | Condomínio | RP_3 | --- | N | 1975 |
| LOT_301 | 301 | JARDIM VIAGEM | Jardim | RP_4 | --- | N | 1976 |
| LOT_302 | 302 | JARDIM MINDA | Jardim | RP_6 | RP_5 | S | 1976 |
| LOT_303 | 303 | JARDIM SANTO ANTONIO | Jardim | RP_4 | --- | N | 1976 |
| LOT_304 | 304 | JARDIM DO LAGO | Jardim | RP_5 | --- | N | 1973 |
| LOT_306 | 306 | JARDIM SANTA CANDIDA | Jardim | RP_4 | --- | N | 1976 |
| LOT_307 | 307 | NOVO ANGULO | Bairro | RP_5 | --- | N | 1981 |
| LOT_308 | 308 | JARDIM DO BOSQUE | Jardim | RP_2 | --- | N | 1978 |
| LOT_309 | 309 | JARDIM LIRIO | Jardim | RP_4 | --- | N | 1977 |
| LOT_310 | 310 | JARDIM GIRASSOL | Jardim | RP_5 | --- | N | 1977 |
| LOT_311 | 311 | JARDIM CAMPOS VERDES | Jardim | RP_2 | --- | N | 1977 |
| LOT_312 | 312 | JARDIM SANTA LUZIA | Jardim | RP_6 | --- | N | 1977 |
| LOT_313 | 313 | JARDIM CARMEM CRISTINA | Jardim | RP_6 | RP_5 | S | 1979 |
| LOT_314 | 314 | PARQUE ODIMAR | Parque | RP_2 | --- | N | 1977 |
| LOT_315 | 315 | JARDIM SANTA CLARA DO LAGO CONTINUACAO | Jardim | RP_2 | --- | N | 1979 |
| LOT_316 | 316 | JARDIM SAO PEDRO | Jardim | RP_3 | --- | N | 1977 |
| LOT_317 | 317 | JARDIM SANTA CLARA DO LAGO | Jardim | RP_2 | --- | N | 1977 |
| LOT_318 | 318 | PARQUE SANTO ANDRE | Parque | RP_2 | --- | N | 1979 |
| LOT_319 | 319 | JARDIM NOVA HORTOLANDIA | Jardim | RP_6 | --- | N | 1976 |
| LOT_320 | 320 | SANTA RITA DE CASSIA | Bairro | RP_2 | --- | N | 1977 |
| LOT_321 | 321 | JARDIM NOSSA SENHORA AUXILIADORA | Jardim | RP_6 | --- | N | 1977 |
| LOT_322 | 322 | BAIRRO DE SANTA ESMERALDA | Bairro | RP_4 | --- | N | 1978 |
| LOT_324 | 324 | PARQUE DOS PINHEIROS | Parque | RP_2 | RP_6 | S | 1978 |
| LOT_326 | 326 | JARDIM DO BRAZ | Jardim | RP_5 | --- | N | 1979 |
| LOT_327 | 327 | CHACARAS RECREIO ALVORADA | Chácara | RP_6 | --- | N | 1986 |
| LOT_329 | 329 | BAIRRO SANTA EMILIA | Bairro | RP_5 | --- | N | 1964 |
| LOT_330 | 330 | JARDIM SANTA AMELIA | Jardim | RP_2 | --- | N | 1980 |
| LOT_331 | 331 | JARDIM MIRANTE DE SUMARE | Jardim | RP_2 | --- | N | 1980 |
| LOT_332 | 332 | JARDIM NOSSA SENHORA DE LOURDES | Jardim | RP_4 | --- | N | 1980 |
| LOT_333 | 333 | JARDIM ADELAIDE | Jardim | RP_4 | --- | N | 1981 |
| LOT_334 | 334 | JARDIM PAULISTINHA | Jardim | RP_4 | --- | N | 1980 |
| LOT_335 | 335 | JARDIM EVEREST | Jardim | RP_2 | --- | N | 1980 |
| LOT_336 | 336 | VILA INEMA | Vila | RP_5 | --- | N | 1981 |
| LOT_337 | 337 | JARDIM DAS COLINAS | Jardim | RP_6 | --- | N | 1982 |
| LOT_338 | 338 | PARQUE ORESTES ONGARO | Parque | RP_6 | --- | N | 1982 |
| LOT_339 | 339 | JARDIM DAS PAINEIRAS | Jardim | RP_1 | --- | N | 1981 |
| LOT_340 | 340 | PARQUE DO HORTO | Parque | RP_6 | --- | N | 1980 |
| LOT_341 | 341 | JARDIM SAO BENTO | Jardim | RP_3 | --- | N | 1982 |
| LOT_342 | 342 | JARDIM SAO JORGE | Jardim | RP_6 | --- | N | 1982 |
| LOT_343 | 343 | PARQUE HORIZONTE | Parque | RP_3 | --- | N | 1986 |
| LOT_344 | 344 | PARQUE RESIDENCIAL MARIA DE LOURDES | Parque | RP_2 | --- | N | 1982 |
| LOT_345 | 345 | JARDIM STELLA | Jardim | RP_3 | --- | N | 1982 |
| LOT_346 | 346 | JARDIM SANTA FE | Jardim | RP_2 | --- | N | 1982 |
| LOT_347 | 347 | JARDIM MALTA | Jardim | RP_5 | --- | N | 1982 |
| LOT_348 | 348 | VILA IPE | Vila | RP_4 | --- | N | 1982 |
| LOT_349 | 349 | JARDIM SAO SEBASTIAO | Jardim | RP_2 | --- | N | 1982 |
| LOT_350 | 350 | JARDIM DAS LARANJEIRAS | Jardim | RP_6 | --- | N | 1983 |
| LOT_351 | 351 | JARDIM AMANDA | Jardim | RP_3 | --- | N | 1982 |
| LOT_352 | 352 | JARDIM ESTEFANIA | Jardim | RP_6 | RP_5 | S | 1983 |
| LOT_353 | 353 | RESIDENCIAL JOAO LUIZ | Residencial | RP_2 | --- | N | 2021 |
| LOT_354 | 354 | JARDIM SAO CAMILO | Jardim | RP_6 | RP_5 | S | 1981 |
| LOT_357 | 357 | CHACARAS RECREIO 2000 | Chácara | RP_3 | --- | N | 1990 |
| LOT_358 | 358 | JARDIM NOVA AMERICA I | Jardim | RP_5 | --- | N | 2016 |
| LOT_359 | 359 | VILA AMERICA | Vila | RP_5 | --- | N | 1999 |
| LOT_360 | 360 | JARDIM NOVA EUROPA | Jardim | RP_5 | --- | N | 1998 |
| LOT_361 | 361 | JARDIM INTERLAGOS | Jardim | RP_2 | --- | N | 2002 |
| LOT_362 | 362 | JARDIM VILLAGIO GHIRALDELLI | Jardim | RP_2 | --- | N | 1999 |
| LOT_363 | 363 | JARDIM RESIDENCIAL FIRENZE | Jardim | RP_2 | --- | N | 2001 |
| LOT_364 | 364 | JARDIM TERRAS DE SANTO ANTONIO | Jardim | RP_4 | --- | N | 2000 |
| LOT_365 | 365 | JARDIM FLAMBOYANT | Jardim | RP_2 | --- | N | 2002 |
| LOT_366 | 366 | PARQUE GABRIEL | Parque | RP_2 | --- | N | 2003 |
| LOT_367 | 367 | JARDIM GREEN PARK RESIDENCE | Jardim | RP_2 | --- | N | 2004 |
| LOT_368 | 368 | JARDIM NOVO CAMBUI | Jardim | RP_2 | --- | N | 2005 |
| LOT_369 | 369 | JARDIM NOVA ALVORADA | Jardim | RP_2 | --- | N | 2006 |
| LOT_370 | 370 | PARQUE PERON | Parque | RP_5 | --- | N | 2022 |
| LOT_371 | 371 | VILA DA CONQUISTA | Vila | RP_5 | --- | N | 2023 |
| LOT_372 | 372 | JARDIM PRIMAVERA | Jardim | RP_6 | --- | N | 2010 |
| LOT_374 | 374 | CONJ. HAB. JARDIM BOA ESPERANCA | Conjunto | RP_6 | --- | N | 2011 |
| LOT_375 | 375 | RESIDENCIAL RECANTO DO SOL | Residencial | RP_6 | --- | N | 2011 |
| LOT_376 | 376 | JARDIM GOLDEN PARK RESIDENCE | Jardim | RP_2 | --- | N | 2008 |
| LOT_377 | 377 | RESIDENCIAL JARDIM DE MONACO | Residencial | RP_2 | --- | N | 2009 |
| LOT_378 | 378 | JARDIM DAS FIGUEIRAS II | Jardim | RP_2 | --- | N | 2009 |
| LOT_379 | 379 | JARDIM DAS FIGUEIRAS I | Jardim | RP_2 | --- | N | 2009 |
| LOT_381 | 381 | RESIDENCIAL ANAUA | Residencial | RP_5 | --- | N | 2010 |
| LOT_383 | 383 | PARQUE TERRAS DE SANTA MARIA | Parque | RP_6 | --- | N | 2010 |
| LOT_389 | 389 | PARQUE OLIVIO FRANCESCHINI | Parque | RP_2 | --- | N | 2014 |
| LOT_390 | 390 | RESIDENCIAL JARDIM DO JATOBA | Residencial | RP_2 | --- | N | 2014 |
| LOT_393 | 393 | LOT. INDUSTRIAL ZETA HORTOLANDIA | Loteamento | RP_5 | --- | N | 2014 |
| LOT_394 | 394 | JARDIM NOVA AMERICA II | Jardim | RP_5 | --- | N | 2016 |
| LOT_395 | 395 | PARQUE BELLAVILLE | Parque | RP_6 | --- | N | 2016 |
| LOT_396 | 396 | JARDIM RESIDENCIAL VECCON BURITI | Jardim | RP_5 | --- | N | 2016 |
| LOT_397 | 397 | JARDIM SAO FELIPE | Jardim | RP_6 | --- | N | 2016 |
| LOT_398 | 398 | JARDIM VILA VERDE | Jardim | RP_2 | --- | N | 2016 |
| LOT_399 | 399 | JARDIM NOVO ESTRELA | Jardim | RP_6 | --- | N | 2014 |
| LOT_408 | 408 | JARDIM DAS FLORES | Jardim | RP_5 | --- | N | 2019 |
| LOT_409 | 409 | CONJ. HAB. HORTOLANDIA A2 | Conjunto | RP_5 | --- | N | 2017 |
| LOT_411 | 411 | LOT. EMPRESARIAL BANDEIRANTES | Loteamento | RP_3 | --- | N | 2018 |
| LOT_414 | 414 | JARDIM BELA VISTA | Jardim | RP_6 | --- | N | 2018 |
| LOT_433 | 433 | JARDIM FLORIDA | Jardim | RP_6 | --- | N | 2020 |
| LOT_434 | 434 | PARQUE VASCONCELLOS | Parque | RP_6 | --- | N | 2020 |
| LOT_440 | 440 | JARDIM BANDEIRANTES | Jardim | RP_2 | --- | N | 2021 |
| LOT_448 | 448 | JD. NOVO ANGULO - SISTEMA LAZER 04 | Loteamento | RP_5 | --- | N | 2013 |
| LOT_449 | 449 | JD. NOVO ANGULO - SISTEMA LAZER 06 | Loteamento | RP_5 | --- | N | 2021 |
| LOT_450 | 450 | ADVENTISTA CAMPINEIRO - QD J LT 17 | Outro | RP_2 | --- | N | 2022 |
| LOT_451 | 451 | JD. SUMAREZINHO SISTEMA RECREIO | Loteamento | RP_5 | --- | N | 2022 |
| LOT_452 | 452 | JARDIM ROSOLEM - SISTEMA RECREIO 3 | Loteamento | RP_4 | --- | N | 2022 |
| LOT_453 | 453 | JARDIM VECCON MORADAS | Jardim | RP_3 | --- | N | 2023 |
| LOT_454 | 454 | JARDIM RESIDENCIAL VECCON I | Jardim | RP_5 | --- | N | 2023 |
| LOT_455 | 455 | JARDIM METROPOLITAN | Jardim | RP_5 | --- | N | 2024 |
| LOT_456 | 456 | LOT. NOVO ANGULO - SISTEMA LAZER 2 | Loteamento | RP_5 | --- | N | 2024 |
| LOT_457 | 457 | JARDIM AMANDA - QUADRA 1 | Jardim | RP_3 | --- | N | 2024 |
| LOT_458 | 458 | LOTEAMENTO NOVO ANGULO | Loteamento | RP_5 | --- | N | 2024 |
| LOT_459 | 459 | CHACARAS CONDOMINIO FLORIDA | Chácara | RP_3 | --- | N | 2025 |
| LOT_460 | 460 | JARDIM RESERVA SAO JOAO | Jardim | RP_6 | --- | N | 2024 |
| LOT_461 | 461 | JD. NOVO CENTRO FRANCESCHINI | Jardim | RP_2 | --- | N | 2025 |
| LOT_462 | 462 | JARDIM AMANDA - QUADRA RF 02 | Jardim | RP_3 | --- | N | 2025 |
| LOT_463 | 463 | VILA CEREGATTI | Vila | RP_2 | --- | N | 2025 |
| LOT_464 | 464 | PARQUE VIVA VERDE | Parque | RP_3 | --- | N | 2025 |

---

## 9. Indicadores que esta Dimensão Viabiliza

| indicador | descrição |
| --- | --- |
| Cobertura por núcleo | Famílias atendidas / famílias CadÚnico por loteamento |
| Concentração de vulnerabilidade | Densidade de famílias CadÚnico por loteamento e RP |
| Loteamentos descobertos em Inclusão | Sem cobertura de CRAS |
| Expansão de CRAS | Evidência técnica baseada em gap de cobertura |
| Análise por tipo | Vulnerabilidade em vilas x jardins x conjuntos habitacionais |
| Loteamentos novos | 15 aprovados entre 2021–2025 — monitorar cobertura |
| Ficha analítica do loteamento | População x PCDs x renda média x serviços que atendem |

---

## 10. Subcoberturas Identificadas

> Dado empírico — fonte: Tribuna Liberal 16/01/2026.

| loteamento | codbairro | situação |
| --- | --- | --- |
| Jardim São Bento | 341 | CadÚnico levado à UBS — distância do CRAS |
| Taquara Branca | nao localizado | CadÚnico levado à UBS — distância do CRAS |

> "Taquara Branca" não consta na base oficial de loteamentos.
> Pode ser nome popular sem registro cartorial. Investigar.

---

## 11. Pendências

| # | pendência | prioridade | status |
| --- | --- | --- | --- |
| P01 | Cruzar 141 loteamentos com cobertura real dos 7 CRAS — popular REL_LOTEAMENTO_NUCLEO | Alta | Aberta |
| P02 | Confirmar nomenclatura descritiva das RPs via texto do Plano Diretor | Média | Aberta |
| P03 | Identificar loteamentos sem cobertura de CRAS | Alta | Aberta |
| P04 | Definir cod_loteamento | --- | Resolvida — adotar codbairro oficial |
| P05 | Incorporar Anexo IV Plano Diretor | --- | Resolvida — RPs identificadas no mapa |
| P06 | Investigar "Taquara Branca" — nome popular sem registro cartorial | Alta | Aberta |
| P07 | Adicionar CEP e coordenadas geográficas a cada loteamento | Alta | Aberta |
| P08 | Construir TAB_NORMALIZA_LOCALIDADE para cruzamento com CadÚnico e SIGAS — o SIGAS usa padrão Correios via CEP, divergente do codbairro oficial; a tabela deve cobrir variações de ambas as fontes, incluindo erros de digitação históricos migrados do sistema anterior | Alta | Aberta |
| P09 | Mapear 11 loteamentos de fronteira — confirmar RP correta | Média | Aberta |
| P10 | Verificar cobertura dos 15 loteamentos aprovados 2021–2025 | Alta | Aberta |

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "03/03/2026" | Criação — DIM_REGIAO, DIM_LOTEAMENTO, REL_UNIDADE_LOTEAMENTO. Controle temporal. |
| v02 | "05/03/2026" | Termo "território" eliminado. DIM_REGIAO renomeada para DIM_REGIAO_PLANEJAMENTO. REL_UNIDADE_LOTEAMENTO renomeada para REL_LOTEAMENTO_NUCLEO com campo setor. codbairro adotado como chave oficial. Plano Diretor incorporado. 141 loteamentos populados. 11 fronteiras identificadas. |
| v03 | "20/03/2026" | Seção 0 adicionada: princípio arquitetural das três dimensões. Formulação canônica: loteamento como átomo espacial, núcleo como camada de agregação flexível por setor. Simbologia especial removida das tabelas para compatibilidade GitHub. |
| v04 | "31/03/2026" | Seção 3: nota arquitetural sobre divergência SIGAS x codbairro — SIGAS usa padrão Correios via CEP, gerando nomes divergentes do cadastro mobiliário municipal. TAB_NORMALIZA_LOCALIDADE atualizada com campo `fonte`. Pendência P08 ampliada para cobrir variações do SIGAS além do CadÚnico. |

---

*Documento de registro interno — Projeto Atlas Social de Hortolândia — março de 2026*
.md…]()
