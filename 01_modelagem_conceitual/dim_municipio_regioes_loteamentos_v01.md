# DIM_TERRITORIO — Estrutura Territorial do Município
**Versão:** 01
**Data de criação:** 03/03/2026
**Responsável:** Ailton Vendramini / Claude (Anthropic)
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Objetivo

Registrar a estrutura do município de Hortolândia
em seus diferentes níveis hierárquicos, permitindo análises
espaciais, cobertura de serviços e concentração de
vulnerabilidade por território.

**Princípio estruturante:**
O território é dimensão analítica estruturante —
não é atributo textual isolado.

---

## Hierarquia territorial do município
```
Município (Hortolândia)
        ↓
    Região
        ↓
  Loteamento
        ↓
  Domicílio
```

Um grupo de loteamentos define a área de abrangência
de uma unidade de atendimento (CRAS, CREAS, etc.).
Essa relação é registrada em REL_UNIDADE_LOTEAMENTO
— com controle temporal, pois muda a cada reorganização.

---

## Estrutura da DIM_REGIAO
```
id_regiao
nome_regiao
cod_regiao
municipio        (Hortolândia)
ativo            (S/N)
data_criacao
observacoes
```

---

## Estrutura da DIM_LOTEAMENTO
```
id_loteamento
cod_loteamento       (chave de referência do sistema)
nome_loteamento      (nome oficial)
nome_normalizado     (para padronização de busca)
tipo_loteamento      (Jardim | Vila | Parque | Residencial |
                      Conjunto | Núcleo | Outro)
id_regiao            (FK → DIM_REGIAO)
situacao_fundiaria   (Regular | Irregular | Em regularização)
ativo                (S/N)
data_cadastro
observacoes
```

**Nota sobre `cod_loteamento`:**
O sistema se guia pelo código — nunca pelo nome.
O nome é atributo de exibição e busca textual.
O código é a chave de integração entre sistemas.

**Nota sobre `tipo_loteamento`:**
Permite análises agregadas por tipo.
Exemplo: concentração de vulnerabilidade em
vilas irregulares versus jardins planejados.

---

## Estrutura da REL_UNIDADE_LOTEAMENTO
```
id_rel
id_unidade       (FK → DIM_UNIDADE)
id_loteamento    (FK → DIM_LOTEAMENTO)
data_inicio
data_fim         (null = vigente)
ativo            (S/N)
observacoes
```

**Nota sobre controle temporal:**
A cada reorganização de abrangência — como a criação
de um novo CRAS — os registros anteriores recebem
`data_fim` e novos registros são criados.
O histórico completo é preservado.
Isso resolve o problema de reatribuição de loteamentos
entre unidades ao longo do tempo.

---

## Posição na cadeia relacional do projeto
```
DIM_REGIAO
    ↓
DIM_LOTEAMENTO
    ↓
REL_UNIDADE_LOTEAMENTO ←→ DIM_UNIDADE
    ↓
DIM_DOMICILIO
    ↓
DIM_FAMILIA
    ↓
DIM_PESSOA (CPF)
```

---

## Indicadores que esta dimensão viabiliza

| Indicador | Descrição |
|-----------|-----------|
| Cobertura territorializada | Famílias atendidas / famílias vulneráveis por loteamento |
| Concentração de vulnerabilidade | Densidade de famílias CadÚnico por território |
| Subcoberta SUAS | Loteamentos sem unidade de atendimento próxima |
| Expansão de CRAS | Evidência técnica para criação de novas unidades |
| Análise por tipo de loteamento | Vulnerabilidade em vilas × jardins × conjuntos |

---

## Subcoberturas territoriais identificadas

*(Dado empírico — fonte: Tribuna Liberal 16/01/2026)*

| Território | Situação |
|------------|----------|
| Jardim São Bento | CadÚnico levado à UBS por distância do CRAS |
| Taquara Branca | CadÚnico levado à UBS por distância do CRAS |

Esses dois territórios validam empiricamente o indicador
de cobertura territorializada — existem loteamentos
vulneráveis com subcoberta SUAS documentada.

---

## Fonte de dados para DIM_LOTEAMENTO

- `loteamentosregiao.xls` — arquivo de referência
  do projeto com loteamentos e regiões de Hortolândia
- Planilha de coordenadores e endereços de unidades
  (Relação_de_Coordenadores_e_endereços_unidades_
  Atualizada_copias.xls)
- Anexo IV — Plano Diretor (mapa de regiões de
  planejamento)

---

## Pendências

1. Cruzar `loteamentosregiao.xls` com as 7 áreas
   de abrangência dos CRAS para popular
   REL_UNIDADE_LOTEAMENTO
2. Confirmar nomenclatura oficial das regiões
   do município
3. Identificar loteamentos sem cobertura de CRAS
   (territórios de subcoberta)
4. Definir cod_loteamento — verificar se já existe
   código oficial ou se será criado internamente
5. Incorporar dados do Anexo IV — Plano Diretor
   para validação das regiões

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 03/03/2026 | Criação — substituição do dim_territorio_cras_v01.md. Separação clara entre DIM_REGIAO, DIM_LOTEAMENTO e REL_UNIDADE_LOTEAMENTO. Controle temporal adicionado. |

---

*Documento de registro interno. Uso restrito ao projeto.*
