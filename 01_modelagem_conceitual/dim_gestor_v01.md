# DIM_GESTOR — Versão 02
**Projeto:** Inteligência Territorial — Assistência Social Hortolândia  
**Atualizado em:** 28/02/2026  
**Responsável:** Ailton Vendramini  
**Alterações v02:** Inclusão de Cafu César (Vice-Prefeito) e Atílio André Pereira (Mobilidade Urbana); reconfirmação duplo papel Maria dos Anjos.

---

## Estrutura da Dimensão

| Campo | Tipo | Descrição |
|---|---|---|
| id_gestor | INT | Chave primária |
| nome | TEXT | Nome completo |
| cargo | TEXT | Cargo ou função |
| secretaria | TEXT | Secretaria ou órgão |
| data_inicio | DATE | Início do mandato/função |
| data_fim | DATE | Fim (NULL = ativo) |
| ativo | BOOLEAN | 1 = ativo |
| fonte_confirmacao | TEXT | Fonte documental |
| observacoes | TEXT | Notas complementares |

---

## Registros Confirmados

| id_gestor | nome | cargo | secretaria | data_inicio | data_fim | ativo | fonte_confirmacao | observacoes |
|---|---|---|---|---|---|---|---|---|
| 001 | Zezé Gomes | Prefeito Municipal | Prefeitura de Hortolândia | 01/01/2025 | NULL | 1 | Tribuna Liberal / posse oficial | Mandato 2025–2028 |
| 002 | Cafu César | Vice-Prefeito Municipal | Prefeitura de Hortolândia | 01/01/2025 | NULL | 1 | Tribuna Liberal 15/02/2026 p.7 | PSB; resolve pendência v01 |
| 003 | Maria dos Anjos Assis Barros | Secretária | Secretaria de Inclusão e Desenvolvimento Social | 01/01/2025 | NULL | 1 | Tribuna Liberal 17/02/2026 p.4 | Também primeira-dama; duplo papel reconfirmado |
| 004 | Maria dos Anjos Assis Barros | Presidente | Fundo Social de Solidariedade | 01/01/2025 | NULL | 1 | Tribuna Liberal / registros institucionais | Mesmo indivíduo — registro distinto por função |
| 005 | Dênis André José Crupe | Secretário | Secretaria Municipal de Saúde | 01/01/2025 | NULL | 1 | Tribuna Liberal / registros institucionais | — |
| 006 | Jennifer Bazilio | Secretária Adjunta | Secretaria Municipal de Saúde | 01/01/2025 | NULL | 1 | Tribuna Liberal / registros institucionais | — |
| 007 | Jesus José Ribeiro da Costa | Diretor | Departamento de Assistência Social | 01/01/2025 | NULL | 1 | Nota técnica institucional | Vinculado à Sec. Inclusão |
| 008 | Dimas Corrêa Pádua | Secretário | Secretaria de Desenvolvimento Econômico | 01/01/2025 | NULL | 1 | Tribuna Liberal / registros institucionais | — |
| 009 | Eliane Nascimento | Secretária | Secretaria de Meio Ambiente | 01/01/2025 | NULL | 1 | Tribuna Liberal / registros institucionais | — |
| 010 | Gleguer Zorzin | Secretário | Secretaria de Esporte e Lazer | 01/01/2025 | NULL | 1 | Tribuna Liberal / registros institucionais | — |
| 011 | Mauro Selço Salvino de Mendonça | Presidente | Conselho Municipal de Saúde (CMS) | 2025 | NULL | 1 | Tribuna Liberal / registros institucionais | — |
| 012 | Sunne Teixeira dos Santos | Presidente | Conselho Municipal de Meio Ambiente (CMMA) | 2025 | NULL | 1 | Tribuna Liberal / registros institucionais | — |
| 013 | Atílio André Pereira | Secretário | Secretaria de Mobilidade Urbana | 01/01/2025 | NULL | 1 | Tribuna Liberal 15/02/2026 p.6 | Novo registro v02; matéria sobre concessão transporte |

---

## Pendências Abertas

| # | Pendência | Prioridade | Observação |
|---|---|---|---|
| P01 | Datas de início precisas para todos os gestores | Média | Maioria registrada como 01/01/2025 (estimativa) |
| P02 | Secretários adjuntos das demais secretarias | Baixa | Identificar via Diário Oficial ou site municipal |
| P03 | Diretores de departamentos estratégicos (PCD, CRAS, CREAS) | Alta | Relevante para modelo RAJIS |
| P04 | Confirmação de vínculo formal Cafu César — data exata posse | Baixa | Confirmado como Vice-Prefeito, data estimada |

---

## Histórico de Versões

| Versão | Data | Alterações |
|---|---|---|
| v01 | 28/02/2026 | Criação inicial — 12 registros |
| v02 | 28/02/2026 | +Cafu César (Vice-Prefeito); +Atílio André Pereira (Mobilidade); reconfirmação Maria dos Anjos duplo papel |
