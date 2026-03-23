[cabecalho_padrao_notebook_v01.md](https://github.com/user-attachments/files/26181581/cabecalho_padrao_notebook_v01.md)[Uploading# Cabeçalho Padrão de Notebook — Atlas Social de Hortolândia
**Versão:** v01  
**Data:** "23/03/2026"  
**Pasta:** `04_documento_tecnico/`

---

## Como Usar

Copie o bloco abaixo como **primeira célula Markdown** de todo notebook novo.
Preencha todos os campos antes de escrever qualquer célula de código.
Tempo estimado de preenchimento: 2 minutos.

---

## Bloco para Copiar

```markdown
# Notebook: <nome descritivo>
**id_rastreabilidade:** RTB_00X  
**Versão:** v01  
**Data de criação:** "DD/MM/AAAA"  
**Última atualização:** "DD/MM/AAAA"  
**Responsável:** Ailton Vendramini

---

## Finalidade
<o que este notebook faz — uma ou duas linhas>

---

## Base Conceitual
Documentos GitHub que definem o quê e o porquê:
- `dim_variavel_IVS_v01r7.md` → <seção específica>
- `arquitetura_dados_IVS_v10.md` → <seção específica>
- <outros documentos relevantes>

## Base Lógica
Artefatos que definem a estrutura de dados:
- `schema_IVS_v05.sql` → <tabelas envolvidas>

---

## Fontes de Dados
**Arquivo de entrada:** `/tmp/cecad/tudo.csv` ou `dados/bruto.csv`  
**Versão do dado:** cadunico_vX_AAAA_MM  
**Periodo de referência:** CadÚnico dez/2025  
**Banco SQLite:** `hortolandia.db`  
**⚠️ Risco de schema:** Alto — verificar dicionário antes de nova carga

---

## Tabelas
**Leitura:** `STG_CADUNICO_RAW`, `DIM_LOTEAMENTO`  
**Escrita:** —

---

## Outputs Gerados
| Caminho completo | tipo_output | Pode commitar? |
| --- | --- | --- |
| `outputs/tabelas/nome_AAAAMMDD.csv` | analitico | Não |
| `outputs/graficos/nome_AAAAMMDD.png` | institucional | Sim |

---

## Variáveis IVS-H Calculadas
- [ ] RT_01 — % famílias renda per capita menor ou igual a 1/2 SM  
- [ ] RT_04 — % domicílios dependentes de idosos  
- [ ] CH_05 — % mães chefes sem fund. completo, filho menor de 15  
- [ ] CH_06 — Taxa de analfabetismo 15 anos ou mais  
- [ ] CH_07 — % crianças sem morador com fund. completo  
```

---

## Regras de Preenchimento

1. `id_rastreabilidade` — consultar a matriz antes de atribuir. Nunca repetir um ID existente.
2. `Versão do dado` — identificar o arquivo exato usado, não apenas o período.
3. `Base Conceitual` — citar a seção específica, não apenas o documento.
4. `Outputs Gerados` — preencher antes de executar, não depois.
5. `tipo_output` — usar apenas: `exploratorio`, `analitico`, `operacional`, `institucional`.
6. Notebooks da faixa `90_99_` são rascunhos — dispensados do cabeçalho completo, mas devem ter ao menos `id_rastreabilidade = RASCUNHO` e data.

---

## Referência Rápida de tipo_output

| tipo_output | Significado | Pode commitar? |
| --- | --- | --- |
| exploratorio | Inspeção e validação — não oficial | Não |
| analitico | Resultado de cálculo com dado individual | Não |
| operacional | Uso restrito à rede CRAS | Não |
| institucional | Dado agregado — apresentável | Sim |

---

*Atlas Social de Hortolândia — Documento Normativo*  
*"Preencher o cabeçalho não é burocracia. É o contrato entre a intenção e a execução."*
 cabecalho_padrao_notebook_v01.md…]()

