# DIM_GESTOR — Gestores Municipais de Hortolândia
**Versão:** 05
**Data de criação:** 28/02/2026
**Data de atualização:** 02/03/2026
**Fonte primária:** Documentos internos, relatórios quadrimestrais, ciclo jornalístico (Tribuna Liberal), site oficial da Prefeitura de Hortolândia, SAPL — Câmara Municipal de Hortolândia
**Responsável:** Ailton Vendramini / Claude (Anthropic)
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Nota metodológica

Esta tabela registra os gestores municipais de Hortolândia com relevância para o projeto de inteligência territorial da assistência social. Inclui prefeito, vice-prefeito, secretários titulares, secretários adjuntos, diretores de departamentos estratégicos e vereadores da legislatura atual.

**Por que modelar gestores:**
- Secretários aparecem como `secretaria_responsavel` no DIM_PROGRAMA — o vínculo nominal permite rastreabilidade histórica
- Adjuntos conduzem o dia a dia operacional e participam de grupos de trabalho técnicos
- Mudanças de titularidade impactaram encaminhamentos e acordos de acesso a dados
- O campo `data_fim` permite substituições sem perda do histórico
- Vereadores são autores de Projetos de Lei que criam ou modificam programas municipais — o vínculo legislativo permite rastrear a origem normativa dos programas catalogados no DIM_PROGRAMA

**Fontes utilizadas (v05):**
- Relatório Quadrimestre de Saúde — 3º Quadrimestre 2025
- Tribuna Liberal — edições de novembro/2025, dezembro/2025, janeiro e fevereiro/março de 2026
- Documentos internos do projeto (reunião de 30/01/2026, nota técnica 02/02/2026, reunião 02/03/2026)
- Site oficial da Prefeitura de Hortolândia — varredura sistemática de secretarias em 01/03/2026 e 02/03/2026
- SAPL — Câmara Municipal de Hortolândia (sapl.hortolandia.sp.leg.br) — 9ª Legislatura (2025–2028)

---

## Estrutura da DIM_GESTOR

```
id_gestor           (chave surrogate)
nome
nome_completo       (quando apelido/nome político difere do nome formal)
cargo               (Prefeito | Vice-Prefeito | Secretário | Secretário Adjunto | Diretor | Vereador | A confirmar)
secretaria          (nome da secretaria, órgão ou partido)
data_inicio         (data de posse ou início confirmado)
data_fim            (null = ainda no cargo)
ativo               (S/N)
fonte_confirmacao   (Diário Oficial | Relatório Oficial | Jornal | Site Oficial | Documento Interno | SAPL | A confirmar)
observacoes
```

---

## Registros confirmados

### Poder Executivo — Chefia

| id | Nome | Nome Completo | Cargo | Secretaria / Órgão | data_inicio | data_fim | Ativo | Fonte |
|----|------|---------------|-------|--------------------|-------------|----------|-------|-------|
| 001 | Zezé Gomes | José Nazareno Zezé Gomes | Prefeito | Gabinete do Prefeito | A confirmar | — | S | Jornal (Tribuna Liberal) + Site Oficial |
| 002 | Cafú Cesar | Carlos Augusto César | Vice-Prefeito | Gabinete do Vice-Prefeito | A confirmar | 14/11/2025 | N | Jornal (Tribuna Liberal, 13/11/2025 e 14/11/2025) |

> ⚠️ **Registro 002 — Carlos Augusto Cesar (Cafú):** Preso preventivamente em 11/12/2025 durante a Operação Coffee Break (PF + CGU), que apura fraudes em licitações e contratos de materiais escolares firmados a partir de 2020. Exonerado a pedido em 14/11/2025 para apresentar defesa. Cargo de Vice-Prefeito atualmente vago — sem substituto identificado. Buscar decreto de exoneração no Diário Oficial para confirmar data_fim oficial. Atenção: site oficial da Prefeitura ainda listou Cafú como Vice-Prefeito em consulta realizada em 01/03/2026 — desatualização institucional registrada.

---

### Secretarias — Titulares ativos

| id | Nome | Cargo | Secretaria | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|------------|-------------|----------|-------|-------|
| 003 | Maria dos Anjos Assis Barros | Secretária | Inclusão e Desenvolvimento Social | A confirmar | — | S | Jornal + Site Oficial (02/03/2026) |
| 004 | Maria dos Anjos Assis Barros | Presidente | Fundo Social de Solidariedade | A confirmar | — | S | Jornal (acúmulo de função) |
| 005 | Dênis André José Crupe | Secretário | Saúde | 15/05/2020 | — | S | Relatório Quadrimestral 3º Trim./2025 |
| 006 | Dimas Corrêa Pádua | Secretário | Desenvolvimento Econômico, Trabalho, Turismo e Inovação | A confirmar | — | S | Jornal (Tribuna Liberal, 21/02/2026) + Site Oficial (02/03/2026) |
| 007 | Eliane Nascimento | Secretária | Meio Ambiente, Desenvolvimento Sustentável e Assuntos Climáticos | A confirmar | — | S | Jornal (Tribuna Liberal, 21/02/2026) |
| 008 | Gleguer Zorzin | Secretário | Esporte e Lazer | A confirmar | — | S | Jornal (Tribuna Liberal, 24/02/2026) + Site Oficial (02/03/2026) |
| 013 | Régis Athanázio Bueno | Secretário | Cultura | A confirmar | — | S | Site Oficial (02/03/2026) |
| 014 | Renato Franceschini Bueno | Secretário | Habitação | 14/11/2025 | — | S | Jornal (Tribuna Liberal, 14/11/2025) + Site Oficial (02/03/2026) |
| 015 | Simone Cristina Locatelli | Secretária | Educação, Ciência e Tecnologia | 14/11/2025 | — | S | Jornal (Tribuna Liberal, 14/11/2025) + Site Oficial (02/03/2026) |
| 016 | Gerson Ferreira | Secretário | Governo | 14/11/2025 | — | S | Jornal (Tribuna Liberal, 14/11/2025) + Site Oficial (02/03/2026) |
| 017 | Antônio Agnelo Bonadio | Secretário | Finanças | A confirmar | — | S | Jornal (Tribuna Liberal) + Site Oficial (02/03/2026) |
| 051 | Ieda Manzano de Oliveira | Secretária | Administração e Gestão de Pessoal | A confirmar | — | S | Site Oficial (02/03/2026) |
| 052 | Silvania Anizio da Silva | Secretária | Assuntos Jurídicos | A confirmar | — | S | Site Oficial (02/03/2026) |
| 056 | Atílio Andre Pereira | Secretário | Mobilidade Urbana | A confirmar | — | S | Site Oficial (02/03/2026) |
| 057 | Sérgio Marasco Torrecillas | Secretário | Obras | A confirmar | — | S | Site Oficial (02/03/2026) |
| 058 | Eduardo Marchetti Francisco | Secretário | Planejamento Urbano e Gestão Estratégica | A confirmar | — | S | Site Oficial (02/03/2026) |
| 059 | Joldemar Nunes Corrêa | Secretário | Segurança Pública | A confirmar | — | S | Site Oficial (02/03/2026) |
| 060 | Vicente Andreu Guillo | Secretário | Serviços Urbanos | A confirmar | — | S | Site Oficial (02/03/2026) |

> 📌 **Nota — Simone Cristina Locatelli (id 015):** Nomeada em 14/11/2025 em substituição a Fernando Moraes, exonerado no mesmo dia em decorrência da Operação Coffee Break.

> 📌 **Nota — Renato Franceschini Bueno (id 014):** Era Secretário Adjunto de Habitação. Assumiu a titularidade em 14/11/2025 em substituição a Rogério Mion, exonerado no mesmo dia. Cargo de adjunto atualmente **vago** — site oficial não lista substituto.

> 📌 **Nota — Gerson Ferreira (id 016):** Era Secretário Adjunto de Inclusão e Desenvolvimento Social. Assumiu Governo em 14/11/2025. Sua saída da adjunção abriu espaço para Lenivaldo Pauliuki.

---

### Secretarias — Titulares exonerados (histórico)

| id | Nome | Cargo | Secretaria | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|------------|-------------|----------|-------|-------|
| 026 | Fernando Moraes | Secretário | Educação, Ciência e Tecnologia | A confirmar | 14/11/2025 | N | Jornal (Tribuna Liberal, 13 e 14/11/2025) |
| 027 | Rogério Mion | Secretário | Habitação | A confirmar | 14/11/2025 | N | Jornal (Tribuna Liberal, 14/11/2025) |

> ⚠️ **Registros 026 e 027 — Operação Coffee Break:** Fernando Moraes (Educação) e Rogério Mion (Habitação) foram investigados no âmbito da Operação Coffee Break (PF + CGU, 11/12/2025), que apura fraudes em licitações e contratos de materiais escolares. Exonerados a pedido em 14/11/2025 para apresentar defesa. Fernando Moraes é suspeito de direcionar licitação e receber propina da empresa Life Tecnologia Educacional Ltda.

---

### Secretarias — Adjuntos confirmados

| id | Nome | Cargo | Secretaria | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|------------|-------------|----------|-------|-------|
| 009 | Jennifer Bazilio | Secretária Adjunta | Saúde | 02/01/2025 | — | S | Relatório Quadrimestral 3º Trim./2025 |
| 018 | Lenivaldo Pauliuki | Secretário Adjunto | Inclusão e Desenvolvimento Social | 14/11/2025 | — | S | Jornal (Tribuna Liberal, 14/11/2025) + Site Oficial (02/03/2026) |
| 019 | Tim Mendes | Secretário Adjunto | Cultura | A confirmar | — | S | Site Oficial (02/03/2026) |
| 020 | Renato Muccillo | Secretário Adjunto | Educação, Ciência e Tecnologia | A confirmar | — | S | Site Oficial (02/03/2026) |
| 021 | Rodrigo Roberto Teixeira de Oliveira | Secretário Adjunto | Desenvolvimento Econômico, Trabalho, Turismo e Inovação | A confirmar | — | S | Site Oficial (02/03/2026) |
| 022 | Edson Nascimento dos Santos | Secretário Adjunto | Esporte e Lazer | A confirmar | — | S | Site Oficial (02/03/2026) |
| 023 | Jéssica Guimarães Alves Bastos | Secretária Adjunta | Governo | A confirmar | — | S | Site Oficial (02/03/2026) |
| 053 | Hortência Ribeiro Nunes | Secretária Adjunta | Administração e Gestão de Pessoal | A confirmar | — | S | Site Oficial (02/03/2026) |
| 054 | Lenita Sostena de Souza | Secretária Adjunta | Assuntos Jurídicos | A confirmar | — | S | Site Oficial (02/03/2026) |
| 055 | Eduardo Cesar Vaquero Marques | Secretário Adjunto | Finanças | A confirmar | — | S | Site Oficial (02/03/2026) |
| 056 | Sandra Aparecida Zaith | Secretária Adjunta | Mobilidade Urbana | A confirmar | — | S | Site Oficial (02/03/2026) |
| 057 | Renato Sarto | Secretário Adjunto | Obras | A confirmar | — | S | Site Oficial (02/03/2026) |
| 058 | Andreia Missio | Secretária Adjunta | Planejamento Urbano e Gestão Estratégica | A confirmar | — | S | Site Oficial (02/03/2026) |
| 059 | Adriana Elias de Carvalho | Secretária Adjunta | Segurança Pública | A confirmar | — | S | Site Oficial (02/03/2026) |
| 060 | Marco Antonio Panício "Mercadão" | Secretário Adjunto | Serviços Urbanos | A confirmar | — | S | Site Oficial (02/03/2026) |
| 061 | Sunne Teixeira dos Santos | Secretária Adjunta | Meio Ambiente e Desenvolvimento Sustentável | A confirmar | — | S | Site Oficial (02/03/2026) |

> 📌 **Nota — Lenivaldo Pauliuki (id 018):** Identificado como "Leni" nos documentos internos do projeto (reunião de 30/01/2026, nota técnica de 02/02/2026, reunião de 02/03/2026). A titular da Secretaria de Inclusão é Maria dos Anjos Assis Barros (id 003) — Leni é o adjunto, interlocutor operacional do projeto. Antes de assumir a adjunção de Inclusão Social, ocupava a diretoria do Fundo Social de Solidariedade. A transição ocorreu em 14/11/2025, após Gerson Ferreira assumir a Secretaria de Governo.

> 📌 **Nota — Habitação (adjunto):** Cargo de Secretário Adjunto de Habitação está **vago** desde 14/11/2025, quando Renato Franceschini Bueno assumiu a titularidade. Site oficial não lista substituto.

---

### Diretores de departamento — ativos

| id | Nome | Cargo | Departamento / Secretaria | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|---------------------------|-------------|----------|-------|-------|
| 010 | Jesus José Ribeiro da Costa | Diretor | Assistência Social (Sec. Inclusão e Desenvolvimento Social) | A confirmar | — | S | Jornal (Tribuna Liberal, 16/01/2026) |
| 024 | Quézia Garcia | Diretora | Dep. de Políticas Públicas para a Pessoa Com Deficiência — DPCD (Sec. Governo) | A confirmar | — | S | Jornal (Tribuna Liberal, 17/01/2026) |
| 025 | Renato Lopes Machado | Diretor / Coordenador | Atenção Hospitalar, Urgência e Emergência / SAMU Regional Hortolândia e Sumaré (Sec. Saúde) | A confirmar | — | S | Jornal (Tribuna Liberal, 01/03/2026) |
| 028 | Sidneia Aparecida dos Santos | Diretora | Dep. de Almoxarifado e Patrimônio | 14/11/2025 | — | S | Jornal (Tribuna Liberal, 14/11/2025) |
| 029 | Marco Antônio Nascimento | Diretor | Dep. Administrativo Financeiro (Sec. Educação, Ciência e Tecnologia) | 14/11/2025 | — | S | Jornal (Tribuna Liberal, 14/11/2025) |

---

### Diretores de departamento — exonerados (histórico)

| id | Nome | Cargo | Departamento / Secretaria | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|---------------------------|-------------|----------|-------|-------|
| 030 | Carla Ariane Trindade | Diretora | Dep. de Almoxarifado e Patrimônio | A confirmar | 14/11/2025 | N | Jornal (Tribuna Liberal, 14/11/2025) |

> ⚠️ **Registro 030 — Carla Ariane Trindade:** Exonerada a pedido em 14/11/2025 no contexto da Operação Coffee Break. Investigada no âmbito das apurações sobre contratos e licitações irregulares. Substituída por Sidneia Aparecida dos Santos (id 028).

---

### Conselhos e instâncias de controle social

| id | Nome | Cargo | Conselho / Instância | data_inicio | data_fim | Ativo | Fonte |
|----|------|-------|----------------------|-------------|----------|-------|-------|
| 011 | Mauro Selço Salvino de Mendonça | Presidente | Conselho Municipal de Saúde (CMS) | A confirmar | — | S | Relatório Quadrimestral 3º Trim./2025 |
| 012 | Sunne Teixeira dos Santos | Presidente | Conselho Municipal de Meio Ambiente (CMMA) | A confirmar | — | S | Jornal (Tribuna Liberal, 21/02/2026) |

---

### Vereadores — 9ª Legislatura (2025–2028)

> 📌 **Critério de inclusão:** Vereadores são registrados nesta dimensão por sua capacidade de autoria legislativa — Projetos de Lei aprovados podem criar, modificar ou extinguir programas municipais catalogados no DIM_PROGRAMA. O campo `vinculo_programa` será preenchido progressivamente conforme o mapeamento dos PLs (visita ao jurídico da Câmara pendente).

| id | Nome Político | Nome Completo | Partido | Exercício | Cargo na Mesa | vinculo_programa | Fonte |
|----|---------------|---------------|---------|-----------|---------------|-----------------|-------|
| 031 | Aldemir Clemente | Aldemir Clemente da Silva | PODE | S | — | A mapear | SAPL (01/03/2026) |
| 032 | Ananias | Ananias José Barbosa | REPUBLICANOS | S | — | A mapear | SAPL (01/03/2026) |
| 033 | Carlão do Nova Europa | Carlos Rodrigues de Oliveira | PV | S | — | A mapear | SAPL (01/03/2026) |
| 034 | Cesinha Brasil | Cícero César Brasil | PSB | S | — | A mapear | SAPL (01/03/2026) |
| 035 | Nei Prazeres | Claudinei Prazeres de Barros | PP | S | — | A mapear | SAPL (01/03/2026) |
| 036 | Clemilton Silva | Clemilton Alves da Silva | PL | S | — | A mapear | SAPL (01/03/2026) |
| 037 | Clodoaldo | Clodoaldo Santos da Silva | PODE | S | — | A mapear | SAPL (01/03/2026) |
| 038 | Daniel Laranjeira | Daniel Laranjeira | PSD | S | — | A mapear | SAPL (01/03/2026) |
| 039 | Derli | Derli de Jesus Athanazio Bueno | PCdoB | S | Pres. Comissão Social | A mapear | SAPL (01/03/2026) — cod_autor: 97 |
| 040 | Dionatan Domingues | Dionata Domingues | PP | S | — | A mapear | SAPL (01/03/2026) |
| 041 | Zaca | Edimilson Marcelo Afonso | REPUBLICANOS | S | — | A mapear | SAPL (01/03/2026) |
| 042 | Edivildo | Edivaldo Sousa Araújo | PP | S | Presidente da Câmara | A mapear | SAPL (01/03/2026) |
| 043 | Ceará | Edivam Campos de Albuquerque | União | S | — | A mapear | SAPL (01/03/2026) |
| 044 | Luiz Regional | Luiz Carlos Silva Meira | REPUBLICANOS | S | — | A mapear | SAPL (01/03/2026) |
| 045 | Paulão | Paulo Pereira Filho | REPUBLICANOS | S | — | A mapear | SAPL (01/03/2026) |
| 046 | Régis da Serralheria | Reginaldo Roberto Rodrigues da Costa | PSB | S | — | A mapear | SAPL (01/03/2026) |
| 047 | Professora Roberta Diniz | Roberta Morais Diniz | PT | S | Vice-Pres. Comissão Social | A mapear | SAPL (01/03/2026) — cod_autor: 111 |
| 048 | Sidney Cabrito | Sidney Eloi Vianna | PSB | S | — | A mapear | SAPL (01/03/2026) |
| 049 | Negociar | Valdecir Alves Pereira | PSD | S | — | A mapear | SAPL (01/03/2026) |
| 050 | Léo do LM | Leonardo Martins Moreira | PSB | N (fora de exercício) | — | mandato sob judice | SAPL (01/03/2026) |

> 📌 **Nota — Lenivaldo Pauliuki:** Ex-vereador que migrou para o Executivo. Consta como autor de matérias legislativas no SAPL com histórico de PLs anteriores. Registrado no Executivo como id 018.

> 📌 **Prioridade de mapeamento de PLs (2025–2026):** Vereadores com maior volume de PLs apresentados: Régis da Serralheria (4 PLs + 1 PLC), Edivaldo (3 PLs), Zaca (3 PLs), Paulão (3 PLs), Derli (2 PLs), Nego (2 PLs), Nei Prazeres (2 PLs). Mapeamento de conteúdo pendente — visita ao jurídico da Câmara pendente.

---

## Secretarias — status de cobertura

### ✅ Resolvidas (titulares e adjuntos confirmados)

| Secretaria | Titular | Adjunto |
|---|---|---|
| Inclusão e Desenvolvimento Social | Maria dos Anjos Assis Barros | Lenivaldo Pauliuki |
| Saúde | Dênis André José Crupe | Jennifer Bazilio |
| Desenvolvimento Econômico, Trabalho, Turismo e Inovação | Dimas Corrêa Pádua | Rodrigo Roberto Teixeira de Oliveira |
| Meio Ambiente, Desenvolvimento Sustentável e Assuntos Climáticos | Eliane Nascimento | A confirmar |
| Esporte e Lazer | Gleguer Zorzin | Edson Nascimento dos Santos |
| Cultura | Régis Athanázio Bueno | Tim Mendes |
| Habitação | Renato Franceschini Bueno | **Vago** |
| Educação, Ciência e Tecnologia | Simone Cristina Locatelli | Renato Muccillo |
| Governo | Gerson Ferreira | Jéssica Guimarães Alves Bastos |
| Finanças | Antônio Agnelo Bonadio | Eduardo Cesar Vaquero Marques |
| Administração e Gestão de Pessoal | Ieda Manzano de Oliveira | Hortência Ribeiro Nunes |
| Assuntos Jurídicos | Silvania Anizio da Silva | Lenita Sostena de Souza |

| Mobilidade Urbana | Atílio Andre Pereira | Sandra Aparecida Zaith |
| Obras | Sérgio Marasco Torrecillas | Renato Sarto |
| Planejamento Urbano e Gestão Estratégica | Eduardo Marchetti Francisco | Andreia Missio |
| Segurança Pública | Joldemar Nunes Corrêa | Adriana Elias de Carvalho |
| Serviços Urbanos | Vicente Andreu Guillo | Marco Antonio Panício "Mercadão" |
| Meio Ambiente e Desenvolvimento Sustentável | Eliane do Nascimento Nunes de Oliveira | Sunne Teixeira dos Santos ⚠️ |

> ⚠️ **Sunne Teixeira dos Santos:** registrada como Secretária Adjunta de Meio Ambiente (id 061) e como Presidente do Conselho Municipal de Meio Ambiente (id 012). Verificar acúmulo de função ou mudança de cargo.

### ✅ Cobertura: 17 de 17 secretarias — DIM_GESTOR COMPLETO

---

## Pendências e pontos a confirmar

1. **Vice-Prefeito (Cafú Cesar)** — Buscar decreto de exoneração no Diário Oficial para registrar data_fim oficial. Verificar se o cargo será ou não preenchido por substituto.
2. **Datas de início dos secretários** — Apenas Saúde (15/05/2020) e os nomeados em 14/11/2025 possuem datas documentadas. Para os demais, confirmar via Diário Oficial.
3. **Secretários adjuntos das secretarias faltantes** — Segurança Pública, Obras, Mobilidade Urbana, Planejamento ainda sem titulares e adjuntos identificados.
4. **Diretores de departamentos estratégicos** — Confirmar titulares de Direitos Humanos e Políticas Públicas, Segurança Alimentar e Inclusão Produtiva (DIPGR). DPCD resolvido — Quézia Garcia (id 024).
5. **Fernanda Fadiga** — Psicóloga identificada como coordenadora do CCMI. Verificar cargo formal para inclusão.
6. **Estrutura interna da Secretaria de Governo** — Confirmar diretores dos 9 departamentos: Administrativo, Chefia de Gabinete, Controle e Monitoramento da Cidade, Comunicação, Convênios, Direitos Humanos e Políticas Públicas, Mulheres, Publicidades Institucionais, Relações Institucionais.
7. **Renato Lopes Machado (id 025)** — Verificar se Diretor de Atenção Hospitalar e Coordenador SAMU Regional são funções acumuladas ou cargos formalmente distintos.
8. **PLs dos vereadores (2025–2026)** — Mapear conteúdo dos Projetos de Lei para identificar vínculos com programas do DIM_PROGRAMA. Visita ao jurídico da Câmara pendente. Prioridade: vereadores com maior volume de PLs na área social.
9. **Léo do LM (Leonardo Martins Moreira)** — Vereador fora de exercício. Verificar motivo (cassação) e identificar suplente PSB que assumiu a cadeira.
10. **Site oficial da Prefeitura** — Atualizar observação quando o site corrigir a listagem do Vice-Prefeito (ainda exibia Cafú em 01/03/2026).
11. **Adjunto de Habitação** — Cargo vago desde 14/11/2025. Monitorar nomeação.
12. **Adjunto de Meio Ambiente** — Não identificado ainda.

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|------------|
| v01 | 28/02/2026 | Criação da tabela — 12 registros confirmados, 5 secretarias pendentes |
| v02 | 01/03/2026 | Varredura site oficial e Tribuna Liberal: registro 002 atualizado (Cafú, ativo=N); 11 novos registros (ids 013–023); 4 pendências de titulares resolvidas; Lenivaldo Pauliuki identificado como "Leni" dos documentos internos |
| v03 | 01/03/2026 | Ciclo jornalístico jan/2026: 2 novos registros (ids 024–025) — Quézia Garcia (DPCD) e Renato Lopes Machado (SAMU Regional) |
| v04 | 01/03/2026 | Operação Coffee Break (nov/2025): nomes completos corrigidos (ids 001 e 002); data_fim Cafú confirmado (14/11/2025); registros históricos exonerados (ids 026, 027, 030); nova categoria Vereadores com 20 registros (ids 031–050) — 9ª Legislatura via SAPL |
| v05 | 02/03/2026 | Varredura sistemática do site oficial — páginas individuais de cada secretaria: 11 novos registros (ids 051–061): titulares e adjuntos de Administração, Assuntos Jurídicos, Mobilidade Urbana, Obras, Planejamento, Segurança Pública, Serviços Urbanos e Meio Ambiente; cobertura 17/17 secretarias; adjunto Habitação vago confirmado; pendências 11 e 12 abertas. Correções 03/03/2026: "Carrão" → "Carlão do Nova Europa" (id 033); Edivaldo = Presidente da Câmara (id 042); cod_autor SAPL adicionados: Derli=97, Roberta Diniz=111 |

---

*Documento de registro interno. Uso restrito ao projeto.*
