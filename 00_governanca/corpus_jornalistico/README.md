# Corpus Jornalístico — Atlas Social de Hortolândia

**Diretório:** `00_governanca/corpus_jornalistico/`
**Projeto:** Atlas Social de Hortolândia
**Responsável:** Ailton Vendramini

---

## 🎯 Finalidade

Este diretório reúne o **corpus jornalístico estruturado** do Atlas Social de Hortolândia, composto por matérias da imprensa local e regional.

Seu objetivo é capturar, organizar e analisar **eventos, sinais e percepções sociais** que não são plenamente observáveis em bases estruturadas (como CadÚnico, IBGE ou CAGED).

O corpus atua como um **complemento analítico**, permitindo uma leitura mais dinâmica e contextual da realidade social do município.

---

## 🔗 Papel no Atlas Social

O corpus jornalístico não substitui dados estruturados, mas amplia sua interpretação ao:

* identificar **pressões sociais emergentes**
* antecipar tendências ainda não refletidas em indicadores oficiais
* contextualizar os resultados do **IVS-H (Índice de Vulnerabilidade Social de Hortolândia)**
* apoiar a formulação de políticas públicas com base em evidências qualitativas

---

## 🧠 Conceito Analítico — Pressão Social Observada

As matérias coletadas são tratadas como **eventos sociais observáveis**, que podem indicar:

* aumento de demanda por serviços públicos
* fragilidades institucionais
* mudanças no comportamento social
* lacunas de cobertura de políticas públicas

Esse conjunto de sinais poderá subsidiar a construção de um indicador complementar:

> **Pressão Social Observada**, voltado à leitura dinâmica da vulnerabilidade no território municipal.

---

## 🧩 Unidade de Análise

* **Unidade básica:** notícia/evento jornalístico
* **Granularidade:** ocorrência individual
* **Origem:** imprensa local e regional (ex.: Tribuna Liberal)

Cada linha do dataset representa um evento analisado e classificado.

---

## 🏗️ Estrutura do Dado

Os arquivos do corpus são organizados em formato `.csv`, contendo campos como:

* data da publicação
* fonte jornalística
* título / descrição do evento
* dimensão analítica (ex.: Capital Humano, Renda e Trabalho, Infraestrutura)
* tipo de evento (problema, ação, alerta, governança etc.)
* nível de criticidade
* classificação analítica (direta, indireta, contextual)
* observações

> 🔎 A taxonomia segue o modelo conceitual do IVS-H e documentos complementares do projeto.

---

## ⚠️ Limitações

* Nem todas as matérias possuem identificação precisa de loteamento ou localização detalhada
* Parte das classificações envolve **interpretação analítica**
* O corpus não possui **representatividade estatística da população**
* Eventos refletem cobertura jornalística, podendo conter viés editorial

---

## 📊 Uso Recomendado

O corpus deve ser utilizado para:

* análise qualitativa complementar
* identificação de padrões e tendências
* suporte à interpretação de indicadores quantitativos
* enriquecimento da leitura territorial e social

Não deve ser utilizado isoladamente como base para inferências estatísticas.

---

## 🔄 Atualização

O corpus é atualizado periodicamente, conforme a coleta e tratamento de novas matérias.

---

## 📌 Observação Final

O corpus jornalístico é parte integrante da arquitetura analítica do Atlas Social de Hortolândia, funcionando como um **sensor qualitativo da realidade social**, capaz de captar sinais que antecedem ou complementam os indicadores tradicionais.

---

*Documento de governança — uso interno*
*Atlas Social de Hortolândia*


---

## 📚 Documentação Relacionada

* `regras_de_classificacao_v10_1.md` — regras operacionais completas
* `series_jornalisticas/` — arquivos CSV por edição

---

## 📚 Referências

* Instituto de Pesquisa Econômica Aplicada (IPEA). *Atlas da Vulnerabilidade Social*
* Schrodt, P. — Event Data Analysis
* Lazer et al. — Computational Social Science

---
