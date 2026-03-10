# 06_banco_dados

**Repositório:** Atlas-Social-de-Hortolândia  
**Finalidade:** Armazenamento do banco de dados SQLite do projeto

---

## Conteúdo desta pasta

| Arquivo | Descrição |
|---|---|
| `atlas_social_hortolandia.db` | Banco SQLite — instância ativa do projeto |

---

## Como abrir o banco

**Ferramenta recomendada (Windows):** DB Browser for SQLite  
Download gratuito: https://sqlitebrowser.org

Passos:
1. Instalar o DB Browser for SQLite
2. Abrir o programa
3. Menu **Arquivo → Abrir banco de dados**
4. Selecionar `atlas_social_hortolandia.db`

---

## Estrutura atual do banco

| Tabela | Registros | Descrição |
|---|---|---|
| `dim_fonte_dado` | 5 | Fontes de dados do projeto (SNIS, CadÚnico, Censo 2022, CAGED, SABESP) |
| `fato_ivs_loteamento` | 14 | Série histórica SNIS 2014–2020 para IU_01 (água) e IU_02 (esgoto) |

---

## Origem dos DDLs

As definições estruturais das tabelas (CREATE TABLE) estão em:

```
02_modelagem_lógica/
├── schema_IVS.sql
└── nota_tecnica_fato_ivs_loteamento.sql   ← DDL de fato_ivs_loteamento e dim_fonte_dado
```

O banco `.db` é gerado a partir desses scripts — nunca o contrário.

---

## Princípio de versionamento

- O arquivo `.db` **não é versionado pelo Git** (binário, tamanho variável)
- O que é versionado: os scripts `.sql` em `02_modelagem_lógica/`
- O banco pode ser **recriado a qualquer momento** a partir dos scripts

> Adicionar ao `.gitignore`:
> ```
> 06_banco_dados/*.db
> ```

---

## Próximas tabelas previstas

| Tabela | Origem | Status |
|---|---|---|
| `dim_loteamento` | `dim_municipio_regioes_loteamentos_v01.md` | Pendente |
| `dim_nucleo` | Área de abrangência CRAS | Pendente |
| `fato_ivs_loteamento` (completo) | CadÚnico dez/2025 + Censo 2022 | Em desenvolvimento |

---

*Atlas Social de Hortolândia — `06_banco_dados/`*

