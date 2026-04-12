[rel_programa_variavel_ivs_v03.md](https://github.com/user-attachments/files/26193839/rel_programa_variavel_ivs_v03.md)[Uploading rel_pr# REL_PROGRAMA_VARIAVEL_IVS — Relação Programa × Variável IVS
**Versão:** v03  
**Data:** "23/03/2026"  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas-Social-de-Hortolândia / 02_modelagem_lógica

> **Documento de referência para a tabela relacional.**
> Esta é a especificação conceitual que fundamenta a tabela
> `REL_PROGRAMA_VARIAVEL_IVS` no banco de dados.
> O documento em si não é a tabela — é a lógica que a governa.

---

## Nota de Modelagem

> **Regra fundamental:** cada linha da relação representa exatamente
> um vínculo entre um programa e uma variável IVS.
> Programas com incidência sobre múltiplas variáveis geram múltiplos
> registros — um por variável.
> Isso garante integridade referencial real, elimina o uso de LIKE
> em queries e permite análises por variável com precisão.

---

## Estrutura

```
cod_programa             código textual do programa (ex: PAIF, SCFV)
                         FK → dim_programa.cod_programa
cod_variavel_ivs         código único da variável IVS relacionada
                         FK → dim_variavel_ivs.cod_variavel
                         Para programas de governança sem variável: NULL
dimensao_ivs             dimensão da variável — derivável por JOIN com
                         dim_variavel_ivs, mantida aqui para leitura humana
tipo_relacao             direta   = programa atua explicitamente sobre a variável
                         indireta = programa contribui por via secundária
escopo_relacao           simples          = programa incide sobre 1 dimensão
                         multidimensional = programa incide sobre 2+ dimensões
justificativa_analitica  explicação da relação programa × variável IVS
status_validacao         hipotese   = relação plausível, não verificada empiricamente
                         validado   = relação confirmada por dado ou fluxo registrado
                         em_revisao = relação sob revisão metodológica
observacoes              nota adicional
```

> **Nota sobre `dimensao_ivs`:** é derivável por JOIN com
> `dim_variavel_ivs`. Mantida neste documento para leitura humana.
> Na tabela relacional final, pode ser omitida para evitar redundância.

> **Nota sobre `cod_programa`:** os valores usados abaixo são códigos
> textuais simbólicos. Se `dim_programa.id_programa` for numérico no
> banco, usar a FK numérica na tabela relacional e manter o código
> textual apenas como referência de leitura neste documento.

---

## Grupo 1 — Proteção Social Básica

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `PAIF` | `CH_05` | multidimensional | direta | multidimensional | hipotese | Acompanhamento familiar preventivo — atua em renda, capital humano e moradia simultaneamente | Maior cobertura transversal do catálogo |
| `PAIF` | `CH_06` | multidimensional | direta | multidimensional | hipotese | Acompanhamento familiar preventivo — atua em renda, capital humano e moradia simultaneamente | — |
| `PAIF` | `CH_07` | multidimensional | direta | multidimensional | hipotese | Acompanhamento familiar preventivo — atua em renda, capital humano e moradia simultaneamente | — |
| `PAIF` | `RT_01` | multidimensional | direta | multidimensional | hipotese | Acompanhamento familiar preventivo — atua em renda, capital humano e moradia simultaneamente | — |
| `PAIF` | `RT_02` | multidimensional | direta | multidimensional | hipotese | Acompanhamento familiar preventivo — atua em renda, capital humano e moradia simultaneamente | — |
| `PAIF` | `IU_01` | multidimensional | direta | multidimensional | hipotese | Acompanhamento familiar preventivo — atua em renda, capital humano e moradia simultaneamente | — |
| `SCFV` | `CH_02` | capital_humano | direta | multidimensional | hipotese | Frequência escolar, vínculos e desenvolvimento de crianças, adolescentes e idosos | — |
| `SCFV` | `CH_03` | capital_humano | direta | multidimensional | hipotese | Frequência escolar, vínculos e desenvolvimento de crianças, adolescentes e idosos | — |
| `SCFV` | `CH_06` | capital_humano | direta | multidimensional | hipotese | Frequência escolar, vínculos e desenvolvimento de crianças, adolescentes e idosos | — |
| `SCFV` | `CH_07` | capital_humano | direta | multidimensional | hipotese | Frequência escolar, vínculos e desenvolvimento de crianças, adolescentes e idosos | — |
| `SCFV` | `CH_08` | capital_humano | direta | multidimensional | hipotese | Frequência escolar, vínculos e desenvolvimento de crianças, adolescentes e idosos | — |
| `CCS` | `CH_06` | capital_humano | indireta | simples | hipotese | Convivência comunitária contribui para capital humano do loteamento | Cobertura localizada — NUCLEO_ROSOLEM |
| `CCS` | `CH_07` | capital_humano | indireta | simples | hipotese | Convivência comunitária contribui para capital humano do loteamento | — |

## Grupo 2 — Proteção Social Especial — Média Complexidade

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `PAEFI` | `CH_03` | multidimensional | direta | multidimensional | hipotese | Violação de direitos cruza escolaridade, monoparentalidade, renda e moradia | Perfil de vulnerabilidade mais severa que o PAIF |
| `PAEFI` | `CH_05` | multidimensional | direta | multidimensional | hipotese | Violação de direitos cruza escolaridade, monoparentalidade, renda e moradia | — |
| `PAEFI` | `CH_06` | multidimensional | direta | multidimensional | hipotese | Violação de direitos cruza escolaridade, monoparentalidade, renda e moradia | — |
| `PAEFI` | `RT_01` | multidimensional | direta | multidimensional | hipotese | Violação de direitos cruza escolaridade, monoparentalidade, renda e moradia | — |
| `PAEFI` | `RT_02` | multidimensional | direta | multidimensional | hipotese | Violação de direitos cruza escolaridade, monoparentalidade, renda e moradia | — |
| `PAEFI` | `IU_01` | multidimensional | direta | multidimensional | hipotese | Violação de direitos cruza escolaridade, monoparentalidade, renda e moradia | — |
| `CENTROPOP` | `IU_01` | multidimensional | direta | multidimensional | hipotese | Pop. em situação de rua concentra vulnerabilidades extremas nas três dimensões | Ponto cego: atende sem CPF |
| `CENTROPOP` | `IU_02` | multidimensional | direta | multidimensional | hipotese | Pop. em situação de rua concentra vulnerabilidades extremas nas três dimensões | — |
| `CENTROPOP` | `IU_03` | multidimensional | direta | multidimensional | hipotese | Pop. em situação de rua concentra vulnerabilidades extremas nas três dimensões | — |
| `CENTROPOP` | `CH_06` | multidimensional | direta | multidimensional | hipotese | Pop. em situação de rua concentra vulnerabilidades extremas nas três dimensões | — |
| `CENTROPOP` | `CH_08` | multidimensional | direta | multidimensional | hipotese | Pop. em situação de rua concentra vulnerabilidades extremas nas três dimensões | — |
| `CENTROPOP` | `RT_01` | multidimensional | direta | multidimensional | hipotese | Pop. em situação de rua concentra vulnerabilidades extremas nas três dimensões | — |
| `CENTROPOP` | `RT_02` | multidimensional | direta | multidimensional | hipotese | Pop. em situação de rua concentra vulnerabilidades extremas nas três dimensões | — |
| `CENTROPOP` | `RT_03` | multidimensional | direta | multidimensional | hipotese | Pop. em situação de rua concentra vulnerabilidades extremas nas três dimensões | — |
| `ABORDAGEM_SOCIAL` | `IU_01` | multidimensional | direta | multidimensional | hipotese | Abordagem de rua — perfil idêntico ao Centro POP | — |
| `ABORDAGEM_SOCIAL` | `IU_02` | multidimensional | direta | multidimensional | hipotese | Abordagem de rua — perfil idêntico ao Centro POP | — |
| `ABORDAGEM_SOCIAL` | `RT_01` | multidimensional | direta | multidimensional | hipotese | Abordagem de rua — perfil idêntico ao Centro POP | — |
| `ABORDAGEM_SOCIAL` | `RT_02` | multidimensional | direta | multidimensional | hipotese | Abordagem de rua — perfil idêntico ao Centro POP | — |
| `ABORDAGEM_SOCIAL` | `CH_08` | multidimensional | direta | multidimensional | hipotese | Abordagem de rua — perfil idêntico ao Centro POP | — |
| `MSE_LA_PSC` | `CH_03` | capital_humano | direta | simples | hipotese | Medida socioeducativa: escolaridade e situação nem-nem | — |
| `MSE_LA_PSC` | `CH_06` | capital_humano | direta | simples | hipotese | Medida socioeducativa: escolaridade e situação nem-nem | — |
| `MSE_LA_PSC` | `CH_08` | capital_humano | direta | simples | hipotese | Medida socioeducativa: escolaridade e situação nem-nem | — |
| `APOIO_RISCO` | `CH_05` | multidimensional | direta | multidimensional | hipotese | Situação de risco cruza monoparentalidade, renda e moradia | — |
| `APOIO_RISCO` | `RT_01` | multidimensional | direta | multidimensional | hipotese | Situação de risco cruza monoparentalidade, renda e moradia | — |
| `APOIO_RISCO` | `RT_02` | multidimensional | direta | multidimensional | hipotese | Situação de risco cruza monoparentalidade, renda e moradia | — |
| `APOIO_RISCO` | `IU_01` | multidimensional | direta | multidimensional | hipotese | Situação de risco cruza monoparentalidade, renda e moradia | — |
| `EMERGENCIAS` | `IU_01` | multidimensional | direta | multidimensional | hipotese | Emergências climáticas atingem famílias sem moradia e sem renda | — |
| `EMERGENCIAS` | `IU_02` | multidimensional | direta | multidimensional | hipotese | Emergências climáticas atingem famílias sem moradia e sem renda | — |
| `EMERGENCIAS` | `RT_01` | multidimensional | direta | multidimensional | hipotese | Emergências climáticas atingem famílias sem moradia e sem renda | — |

## Grupo 3 — Proteção Social Especial — Alta Complexidade

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `SAICA` | `CH_02` | capital_humano | direta | multidimensional | hipotese | Acolhimento de crianças — escolaridade, vínculo familiar, reprodução intergeracional | — |
| `SAICA` | `CH_03` | capital_humano | direta | multidimensional | hipotese | Acolhimento de crianças — escolaridade, vínculo familiar, reprodução intergeracional | — |
| `SAICA` | `CH_05` | capital_humano | direta | multidimensional | hipotese | Acolhimento de crianças — escolaridade, vínculo familiar, reprodução intergeracional | — |
| `SAICA` | `CH_06` | capital_humano | direta | multidimensional | hipotese | Acolhimento de crianças — escolaridade, vínculo familiar, reprodução intergeracional | — |
| `SAICA` | `CH_07` | capital_humano | direta | multidimensional | hipotese | Acolhimento de crianças — escolaridade, vínculo familiar, reprodução intergeracional | — |
| `ABRIGO_ADULTOS` | `IU_01` | infraestrutura_urbana | direta | multidimensional | hipotese | Moradia temporária + caminho para inserção produtiva | — |
| `ABRIGO_ADULTOS` | `IU_02` | infraestrutura_urbana | direta | multidimensional | hipotese | Moradia temporária + caminho para inserção produtiva | — |
| `ABRIGO_ADULTOS` | `RT_01` | infraestrutura_urbana | direta | multidimensional | hipotese | Moradia temporária + caminho para inserção produtiva | — |
| `ABRIGO_ADULTOS` | `RT_02` | infraestrutura_urbana | direta | multidimensional | hipotese | Moradia temporária + caminho para inserção produtiva | — |
| `ABRIGO_MULHERES` | `CH_04` | multidimensional | direta | multidimensional | hipotese | Violência contra a mulher: dependência econômica, moradia, saúde reprodutiva | — |
| `ABRIGO_MULHERES` | `CH_05` | multidimensional | direta | multidimensional | hipotese | Violência contra a mulher: dependência econômica, moradia, saúde reprodutiva | — |
| `ABRIGO_MULHERES` | `RT_01` | multidimensional | direta | multidimensional | hipotese | Violência contra a mulher: dependência econômica, moradia, saúde reprodutiva | — |
| `ABRIGO_MULHERES` | `RT_02` | multidimensional | direta | multidimensional | hipotese | Violência contra a mulher: dependência econômica, moradia, saúde reprodutiva | — |
| `ABRIGO_MULHERES` | `IU_01` | multidimensional | direta | multidimensional | hipotese | Violência contra a mulher: dependência econômica, moradia, saúde reprodutiva | — |
| `RESIDENCIA_INCLUSIVA` | `CH_01` | capital_humano | direta | multidimensional | hipotese | PCD: capacidades adaptativas, escolaridade, inserção produtiva futura | — |
| `RESIDENCIA_INCLUSIVA` | `CH_06` | capital_humano | direta | multidimensional | hipotese | PCD: capacidades adaptativas, escolaridade, inserção produtiva futura | — |
| `RESIDENCIA_INCLUSIVA` | `CH_08` | capital_humano | direta | multidimensional | hipotese | PCD: capacidades adaptativas, escolaridade, inserção produtiva futura | — |
| `ILPI` | `CH_01` | capital_humano | direta | simples | hipotese | Idosos: saúde (CH_01) + dependência econômica (RT_04) | RT_04: retirada do idoso requer recomposição de renda |
| `ILPI` | `RT_04` | capital_humano | direta | simples | hipotese | Idosos: saúde (CH_01) + dependência econômica (RT_04) | — |
| `REPUBLICA` | `RT_02` | renda_trabalho | direta | simples | hipotese | Última etapa da saída da rua: autonomia e inserção produtiva formal | Perfil: já inserido ou em vias de inserção |
| `REPUBLICA` | `RT_03` | renda_trabalho | direta | simples | hipotese | Última etapa da saída da rua: autonomia e inserção produtiva formal | — |
| `APADRINHAMENTO` | `CH_02` | capital_humano | indireta | multidimensional | hipotese | Contribui indiretamente para escolaridade e reprodução intergeracional | — |
| `APADRINHAMENTO` | `CH_03` | capital_humano | indireta | multidimensional | hipotese | Contribui indiretamente para escolaridade e reprodução intergeracional | — |
| `APADRINHAMENTO` | `CH_05` | capital_humano | indireta | multidimensional | hipotese | Contribui indiretamente para escolaridade e reprodução intergeracional | — |
| `APADRINHAMENTO` | `CH_07` | capital_humano | indireta | multidimensional | hipotese | Contribui indiretamente para escolaridade e reprodução intergeracional | — |
| `TRAB_INFANTIL` | `CH_08` | capital_humano | direta | simples | hipotese | Combate direto ao trabalho infantil — variável RT_05 do IVS | Interface: CREAS + Conselho Tutelar |
| `ATEND_DOMICILIAR` | `CH_01` | capital_humano | indireta | simples | hipotese | Atenção domiciliar contribui para saúde e autonomia de PCD e idosos | — |
| `ATEND_DOMICILIAR` | `RT_04` | capital_humano | indireta | simples | hipotese | Atenção domiciliar contribui para saúde e autonomia de PCD e idosos | — |
| `PROTECAO_PCD_IDOSO` | `CH_01` | capital_humano | direta | simples | hipotese | PCD e idosos: saúde (CH_01) + dependência econômica (RT_04) | — |
| `PROTECAO_PCD_IDOSO` | `RT_04` | capital_humano | direta | simples | hipotese | PCD e idosos: saúde (CH_01) + dependência econômica (RT_04) | — |

## Grupo 4 — Programas Municipais Específicos

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `FUNDO_EMERG` | `RT_01` | renda_trabalho | direta | simples | hipotese | Transferência emergencial: impacto direto em RT_01 | — |
| `ACERTE` | `RT_02` | renda_trabalho | direta | simples | hipotese | Qualificação + intermediação: reduz desocupação (RT_02) e informalidade (RT_03) | Caso Suelen: CRAS → ACERTE → emprego no CRAS |
| `ACERTE` | `RT_03` | renda_trabalho | direta | simples | hipotese | Qualificação + intermediação: reduz desocupação (RT_02) e informalidade (RT_03) | — |
| `CUIDAR` | `CH_01` | capital_humano | direta | simples | hipotese | Saúde materno-infantil: mortalidade (CH_01) e gravidez na adolescência (CH_04) | — |
| `CUIDAR` | `CH_04` | capital_humano | direta | simples | hipotese | Saúde materno-infantil: mortalidade (CH_01) e gravidez na adolescência (CH_04) | — |
| `CAPACITA` | `RT_02` | renda_trabalho | direta | simples | hipotese | Qualificação profissional: reduz desocupação e informalidade | — |
| `CAPACITA` | `RT_03` | renda_trabalho | direta | simples | hipotese | Qualificação profissional: reduz desocupação e informalidade | — |
| `COSTURA_IND` | `RT_02` | renda_trabalho | direta | simples | hipotese | Capacitação + inserção no setor têxtil | Modalidade do ACERTE |
| `COSTURA_IND` | `RT_03` | renda_trabalho | direta | simples | hipotese | Capacitação + inserção no setor têxtil | — |
| `FARMACIA_SOL` | `CH_01` | capital_humano | indireta | simples | hipotese | Acesso a medicamentos contribui para saúde como capital humano | — |
| `FEIRAS_EMPREEND` | `RT_01` | renda_trabalho | indireta | simples | hipotese | Economia solidária: geração de renda informal | — |
| `FEIRAS_EMPREEND` | `RT_03` | renda_trabalho | indireta | simples | hipotese | Economia solidária: geração de renda informal | — |
| `RESSIGNIFICA` | `RT_01` | multidimensional | direta | multidimensional | hipotese | Reintegração ampla: renda + moradia + capital humano + qualificação | Programa de saída da rua mais estruturado |
| `RESSIGNIFICA` | `RT_02` | multidimensional | direta | multidimensional | hipotese | Reintegração ampla: renda + moradia + capital humano + qualificação | — |
| `RESSIGNIFICA` | `IU_01` | multidimensional | direta | multidimensional | hipotese | Reintegração ampla: renda + moradia + capital humano + qualificação | — |
| `RESSIGNIFICA` | `IU_02` | multidimensional | direta | multidimensional | hipotese | Reintegração ampla: renda + moradia + capital humano + qualificação | — |
| `RESSIGNIFICA` | `CH_06` | multidimensional | direta | multidimensional | hipotese | Reintegração ampla: renda + moradia + capital humano + qualificação | — |
| `RESSIGNIFICA` | `CH_08` | multidimensional | direta | multidimensional | hipotese | Reintegração ampla: renda + moradia + capital humano + qualificação | — |
| `BOLSA_CRECHE` | `CH_02` | capital_humano | direta | simples | hipotese | Acesso à educação infantil: incidência direta em CH_02 | — |
| `INSCRICAO_CMAS` | — | governanca | direta | simples | hipotese | Controle social da assistência social | — |
| `INSCRICAO_CMDCA` | — | governanca | direta | simples | hipotese | Controle social para criança e adolescente | — |

## Grupo 5 — Segurança Alimentar

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `BAH` | `RT_01` | renda_trabalho | indireta | simples | hipotese | Redução de insegurança alimentar via OSCs | 1.762 pessoas (2024) |
| `PAA` | `RT_01` | renda_trabalho | indireta | simples | hipotese | Transferência indireta de renda via alimentação | — |
| `CESTAS` | `RT_01` | renda_trabalho | direta | simples | hipotese | Complemento alimentar emergencial: impacto direto em RT_01 | — |
| `CREAN` | `CH_02` | capital_humano | indireta | simples | hipotese | Educação alimentar contribui para capital humano via saúde | Em planejamento |
| `CREAN` | `CH_05` | capital_humano | indireta | simples | hipotese | Educação alimentar contribui para capital humano via saúde | — |
| `COZINHA_COM` | `RT_01` | renda_trabalho | indireta | simples | hipotese | Refeição subsidiada reduz impacto de RT_01 | — |

## Grupo 6 — Habitação

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `AGORA_CASA` | `IU_01` | infraestrutura_urbana | direta | simples | validado | Regularização fundiária: acesso a água, esgoto e moradia | ~3.000 títulos 2021–2024 |
| `AGORA_CASA` | `IU_02` | infraestrutura_urbana | direta | simples | validado | Regularização fundiária: acesso a água, esgoto e moradia | — |
| `VIDA_LONGA` | `IU_01` | infraestrutura_urbana | direta | simples | hipotese | Habitação para idosos: moradia adequada + dependência de renda do idoso | Em negociação |
| `VIDA_LONGA` | `RT_04` | infraestrutura_urbana | direta | simples | hipotese | Habitação para idosos: moradia adequada + dependência de renda do idoso | — |
| `MCMV` | `IU_01` | infraestrutura_urbana | direta | simples | validado | Provisão habitacional: acesso a água e esgoto adequados | 400 unidades — Jd. Amanda |
| `MCMV` | `IU_02` | infraestrutura_urbana | direta | simples | validado | Provisão habitacional: acesso a água e esgoto adequados | — |
| `PHLIS` | `IU_01` | infraestrutura_urbana | indireta | multidimensional | hipotese | Política habitacional estruturante — cobertura indireta das três variáveis IU | Instrumento de planejamento |
| `PHLIS` | `IU_02` | infraestrutura_urbana | indireta | multidimensional | hipotese | Política habitacional estruturante — cobertura indireta das três variáveis IU | — |
| `PHLIS` | `IU_03` | infraestrutura_urbana | indireta | multidimensional | hipotese | Política habitacional estruturante — cobertura indireta das três variáveis IU | — |

## Grupo 7 — Inserção Produtiva e Qualificação

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `PAT` | `RT_02` | renda_trabalho | direta | simples | hipotese | Intermediação de emprego: reduz desocupação (RT_02) | Cruzamento CadÚnico × mercado formal |
| `PAT_VAGAS` | `RT_02` | renda_trabalho | direta | simples | hipotese | Idem PAT — lado da oferta de vagas | — |
| `SINE` | `RT_02` | renda_trabalho | direta | simples | hipotese | Intermediação federal: desocupação e informalidade | Dados ficam no MTE federal |
| `SINE` | `RT_03` | renda_trabalho | direta | simples | hipotese | Intermediação federal: desocupação e informalidade | — |
| `PEI` | `RT_02` | renda_trabalho | direta | simples | hipotese | Inclusão produtiva de PCD: desocupação (RT_02) + deficiência como dimensão CH | Pendência #23 |
| `PEI` | `CH_06` | renda_trabalho | direta | simples | hipotese | Inclusão produtiva de PCD: desocupação (RT_02) + deficiência como dimensão CH | — |
| `BANCO_POVO` | `RT_03` | renda_trabalho | direta | simples | hipotese | Crédito para formalização: reduz informalidade (RT_03) | Executor: Desenvolve SP |
| `ORIENT_MEI` | `RT_03` | renda_trabalho | direta | simples | hipotese | Formalização MEI: reduz informalidade estrutural | MEI não aparece no CAGED |
| `SEBRAE_AQUI` | `RT_02` | renda_trabalho | indireta | simples | hipotese | Capacitação empresarial contribui para empregabilidade e formalização | — |
| `SEBRAE_AQUI` | `RT_03` | renda_trabalho | indireta | simples | hipotese | Capacitação empresarial contribui para empregabilidade e formalização | — |
| `SEG_DESEMPREGO` | `RT_01` | renda_trabalho | indireta | simples | hipotese | Proteção temporária de renda: evita queda abrupta | Esgotamento → entrada previsível no CadÚnico |
| `SEG_DESEMPREGO` | `RT_02` | renda_trabalho | indireta | simples | hipotese | Proteção temporária de renda: evita queda abrupta | — |
| `FEIRAS_LIVRES` | `RT_01` | renda_trabalho | indireta | simples | hipotese | Renda informal de feirantes contribui para RT | 5 loteamentos coincidem com áreas de CRAS |
| `FEIRAS_LIVRES` | `RT_03` | renda_trabalho | indireta | simples | hipotese | Renda informal de feirantes contribui para RT | — |
| `FUNDO_CURSOS` | `RT_02` | renda_trabalho | direta | simples | hipotese | Qualificação via SENAI: desocupação e informalidade | — |
| `FUNDO_CURSOS` | `RT_03` | renda_trabalho | direta | simples | hipotese | Qualificação via SENAI: desocupação e informalidade | — |
| `MEU_EMPREGO` | `RT_02` | renda_trabalho | direta | simples | hipotese | Empregabilidade de jovens: reduz desocupação | — |
| `DECOLA` | `RT_02` | renda_trabalho | direta | simples | hipotese | Empregabilidade e inserção produtiva | Pendência #20 |
| `DECOLA` | `RT_03` | renda_trabalho | direta | simples | hipotese | Empregabilidade e inserção produtiva | — |
| `APRENDIZ_SOCIAL` | `RT_02` | renda_trabalho | direta | simples | hipotese | Formação de jovens: desocupação (RT_02) + geração nem-nem (CH_08) | Pendência #20 |
| `APRENDIZ_SOCIAL` | `CH_08` | renda_trabalho | direta | simples | hipotese | Formação de jovens: desocupação (RT_02) + geração nem-nem (CH_08) | — |
| `FATEC` | `RT_02` | renda_trabalho | indireta | simples | hipotese | Ensino superior tecnológico como vetor de mobilidade social | Em estudo de viabilidade |
| `FATEC` | `RT_03` | renda_trabalho | indireta | simples | hipotese | Ensino superior tecnológico como vetor de mobilidade social | — |

## Grupo 8 — Públicos Específicos / Direitos Humanos

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `POL_PCD` | `CH_01` | capital_humano | indireta | simples | hipotese | Políticas para PCD: saúde e escolaridade | — |
| `POL_PCD` | `CH_06` | capital_humano | indireta | simples | hipotese | Políticas para PCD: saúde e escolaridade | — |
| `POL_IDOSO` | `CH_01` | capital_humano | indireta | simples | hipotese | Atenção ao idoso: saúde e dependência econômica | — |
| `POL_IDOSO` | `RT_04` | capital_humano | indireta | simples | hipotese | Atenção ao idoso: saúde e dependência econômica | — |
| `CCMI` | `CH_01` | capital_humano | indireta | simples | hipotese | Convivência e saúde do idoso | — |
| `CCMI` | `RT_04` | capital_humano | indireta | simples | hipotese | Convivência e saúde do idoso | — |
| `POL_JUVENTUDE` | `CH_03` | capital_humano | indireta | simples | hipotese | Juventude: evasão escolar (CH_03) e geração nem-nem (CH_08) | — |
| `POL_JUVENTUDE` | `CH_08` | capital_humano | indireta | simples | hipotese | Juventude: evasão escolar (CH_03) e geração nem-nem (CH_08) | — |
| `IGUALDADE_RACIAL` | `CH_06` | multidimensional | indireta | multidimensional | hipotese | Desigualdade racial cruza todas as dimensões IVS | — |
| `IGUALDADE_RACIAL` | `CH_07` | multidimensional | indireta | multidimensional | hipotese | Desigualdade racial cruza todas as dimensões IVS | — |
| `IGUALDADE_RACIAL` | `RT_01` | multidimensional | indireta | multidimensional | hipotese | Desigualdade racial cruza todas as dimensões IVS | — |
| `IGUALDADE_RACIAL` | `RT_02` | multidimensional | indireta | multidimensional | hipotese | Desigualdade racial cruza todas as dimensões IVS | — |
| `IGUALDADE_RACIAL` | `IU_01` | multidimensional | indireta | multidimensional | hipotese | Desigualdade racial cruza todas as dimensões IVS | — |
| `CRAM` | `CH_04` | multidimensional | direta | multidimensional | validado | Violência contra a mulher: dependência econômica + gravidez adolescente + monoparentalidade | Fluxo CRAM → CT → CREAS confirmado 08/03/2026 |
| `CRAM` | `CH_05` | multidimensional | direta | multidimensional | validado | Violência contra a mulher: dependência econômica + gravidez adolescente + monoparentalidade | — |
| `CRAM` | `RT_01` | multidimensional | direta | multidimensional | validado | Violência contra a mulher: dependência econômica + gravidez adolescente + monoparentalidade | — |
| `CRAM` | `RT_02` | multidimensional | direta | multidimensional | validado | Violência contra a mulher: dependência econômica + gravidez adolescente + monoparentalidade | — |
| `CLOSET_SOL` | `CH_05` | capital_humano | indireta | simples | hipotese | Apoio material a mulheres atendidas pelo CRAM | — |
| `VIVA_MAIS` | `CH_01` | capital_humano | indireta | simples | hipotese | Saúde e bem-estar comunitário | — |
| `AMBULATORIO_TRANS` | `CH_01` | capital_humano | direta | simples | hipotese | Saúde de população vulnerável: reduz barreira de acesso ao SUS | — |
| `COM_PRIMEIRA_INF` | `CH_01` | capital_humano | direta | simples | hipotese | Primeira infância: mortalidade (CH_01) e acesso à escola (CH_02) | — |
| `COM_PRIMEIRA_INF` | `CH_02` | capital_humano | direta | simples | hipotese | Primeira infância: mortalidade (CH_01) e acesso à escola (CH_02) | — |

## Grupo 9 — Formação Cultural

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `FORMACOES_CULT` | `CH_06` | capital_humano | indireta | simples | hipotese | Cultura como fator de capital humano e coesão social | — |
| `FORMACOES_CULT` | `CH_07` | capital_humano | indireta | simples | hipotese | Cultura como fator de capital humano e coesão social | — |

## Grupo 10 — Saúde com Interface SUAS

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `SAMU` | `CH_01` | capital_humano | direta | simples | hipotese | Urgência e emergência: impacto direto em mortalidade (CH_01) | Abrangência: Hortolândia + Sumaré |
| `VILA_SAUDE` | `CH_01` | capital_humano | direta | simples | hipotese | Equipamento de saúde comunitária: mortalidade e acesso | Em planejamento |
| `VILA_SAUDE` | `CH_02` | capital_humano | direta | simples | hipotese | Equipamento de saúde comunitária: mortalidade e acesso | — |

## Grupo 11 — Governança e Conselhos

| cod_programa | cod_variavel_ivs | dimensao_ivs | tipo_relacao | escopo_relacao | status_validacao | justificativa_analitica | observacoes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `COMSEA` | — | governanca | direta | simples | hipotese | Controle social da segurança alimentar | — |
| `CAISAN` | — | governanca | direta | simples | hipotese | Articulação intersetorial da política alimentar | — |
| `CMPcD` | — | governanca | direta | simples | hipotese | Controle social das políticas para PCD | — |
| `CMDCA` | — | governanca | direta | simples | hipotese | Controle social para criança e adolescente | — |
| `CMAS` | — | governanca | direta | simples | hipotese | Controle social da assistência social | — |
| `CMI` | — | governanca | direta | simples | hipotese | Controle social para idosos | — |
| `COMJUV` | — | governanca | direta | simples | hipotese | Controle social para juventude | — |
| `COMPIR` | — | governanca | direta | simples | hipotese | Controle social de igualdade racial | — |
| `CT_I` | — | governanca | direta | simples | hipotese | Proteção de direitos — Loteamento I | — |
| `CT_II` | — | governanca | direta | simples | hipotese | Proteção de direitos — Loteamento II | — |
| `CMDM` | — | governanca | direta | simples | hipotese | Controle social para mulheres | — |

---

## Perguntas Analíticas Habilitadas

Com a normalização 1 linha por vínculo, as queries ficam precisas:

| Pergunta | Query |
| --- | --- |
| Quais programas atuam diretamente em CH_02? | `WHERE cod_variavel_ivs = 'CH_02' AND tipo_relacao = 'direta'` |
| Quais programas cobrem RT_02? | `WHERE cod_variavel_ivs = 'RT_02'` |
| Quais são multidimensionais? | `WHERE escopo_relacao = 'multidimensional'` |
| Há lacuna programática em IU_03? | `WHERE cod_variavel_ivs = 'IU_03'` |
| Programas com relação indireta a CH_07? | `WHERE cod_variavel_ivs = 'CH_07' AND tipo_relacao = 'indireta'` |
| Quantas variáveis cada programa cobre? | `GROUP BY cod_programa COUNT(cod_variavel_ivs)` |
| Quais variáveis têm mais programas? | `GROUP BY cod_variavel_ivs ORDER BY COUNT(cod_programa) DESC` |

---

## Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "11/03/2026" | Criação — 64 programas × dimensão IVS + variáveis |
| v02 | "11/03/2026" | Campo `tipo_relacao` adicionado (direta / indireta / multidimensional) |
| v03 | "23/03/2026" | Normalização estrutural: 1 linha por programa × variável (de ~77 linhas para 169 vínculos). `tipo_relacao` separado em `tipo_relacao` (direta/indireta) e `escopo_relacao` (simples/multidimensional). `status_validacao` adicionado (hipotese/validado/em_revisao). `cod_programa` substitui `id_programa` com nota sobre FK numérica. Nota de modelagem adicionada. Queries atualizadas para usar `=` em vez de `LIKE`. Referência "território" → "loteamento". |

---

*Documento de referência relacional — 02_modelagem_lógica/*  
*Atlas Social de Hortolândia — uso interno*
ograma_variavel_ivs_v03.md…]()
