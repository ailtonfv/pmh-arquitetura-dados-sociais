# DIM_VEREADOR — Dimensão Parlamentar Municipal
Projeto: Arquitetura de Dados Sociais — Hortolândia  
Versão: 02  
Data de criação: 03/03/2026  
Responsável: Ailton Vendramini  
Repositório: Projeto CadÚnico — Hortolândia  

---

## 🎯 Objetivo

Registrar parlamentares da Câmara Municipal com foco analítico na **origem normativa de programas sociais**, permitindo rastrear a cadeia institucional:

Vereador → Projeto de Lei → Norma Jurídica → Programa → Execução Territorial

---

## 🧠 Princípio Arquitetural

Separação institucional estruturante:

- Executivo → `DIM_GESTOR`
- Legislativo → `DIM_VEREADOR`

A modelagem preserva neutralidade política e viabiliza análise histórica longitudinal.

---

## 🔗 Posição na Cadeia Relacional


---

# 📊 Estrutura da Tabela

## Tabela: DIM_VEREADOR

| Campo | Tipo | Descrição |
|--------|------|------------|
| id_vereador | PK (surrogate) | Identificador interno |
| id_sapl_parlamentar | Natural Key | Código oficial no SAPL |
| nome_politico | Texto | Nome utilizado publicamente |
| nome_completo | Texto | Nome civil completo |
| partido_inicio | Texto | Partido no início da legislatura |
| partido_atual | Texto | Partido atual |
| legislatura | Texto | Ex: 9ª Legislatura (2025–2028) |
| inicio_mandato | Data | Início oficial do mandato |
| fim_mandato | Data | Fim previsto |
| situacao | Texto | Em exercício \| Licenciado \| Suplente \| Fora de exercício |
| cargo_mesa | Texto | Presidente \| Vice-Presidente \| 1º Secretário \| 2º Secretário \| null |
| inicio_cargo_mesa | Data | Data início do cargo na Mesa |
| fim_cargo_mesa | Data | Data fim do cargo na Mesa |
| comissoes_relevantes | Texto | Comissão de Desenvolvimento Social, Direitos Humanos etc. |
| url_sapl | Texto | Link oficial do parlamentar |
| fonte_confirmacao | Texto | SAPL \| Diário Oficial \| Jornal \| A confirmar |
| data_confirmacao | Data | Data da última validação |
| observacoes | Texto | Notas estratégicas |

---

# 📌 Regras de Modelagem

1. Não armazenar CPF (dado sensível desnecessário).
2. Permitir mudança partidária (partido_inicio ≠ partido_atual).
3. Mandato é entidade temporal.
4. Cargo na Mesa é evento institucional, não atributo fixo.
5. `id_sapl_parlamentar` deve ser usado como chave natural de integração.

---

# 🧩 Tabela Relacional Complementar

## REL_PL_AUTORIA

Permite registrar autoria múltipla de Projetos de Lei.

| Campo | Descrição |
|--------|------------|
| id_pl | FK → DIM_PL |
| id_vereador | FK → DIM_VEREADOR |
| papel_autoria | Autor \| Coautor \| Relator \| Comissão |

---

# 🔎 Potencial Analítico

Com esta modelagem é possível responder:

- Quais vereadores mais propuseram PLs com impacto social?
- Quantos PLs de cada vereador viraram lei?
- Quais leis criaram programas ainda vigentes?
- Qual partido teve maior influência normativa na assistência social?
- Qual legislatura foi mais produtiva em políticas sociais?

---

# 📈 Evolução Prevista

v01 — Cadastro base da legislatura atual  
v02 — Integração com DIM_PL e REL_PL_AUTORIA  
v03 — Integração com DIM_NORMA_JURIDICA  
v04 — Histórico longitudinal de legislaturas  

---

# 🧾 Log de Alterações

| Versão | Data | Alteração |
|--------|------|------------|
| v02 | 03/03/2026 | Estrutura reformulada para integração normativa |

---

Documento gerado para integração com o Marco Legal da Assistência Social de Hortolândia.

