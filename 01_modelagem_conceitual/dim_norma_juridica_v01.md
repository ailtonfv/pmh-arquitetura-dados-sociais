Aqui está. Copie e cole no GitHub como dim_norma_juridica_v01.md dentro de 01_modelagem_conceitual/:

markdown
# DIM_NORMA_JURIDICA — Marco Legal da Assistência Social
**Versão:** 01
**Data de criação:** 03/03/2026
**Responsável:** Ailton Vendramini / 
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Objetivo

Registrar e classificar todas as normas jurídicas — leis, decretos,
portarias e resoluções — que fundamentam, criam, alteram ou extinguem
programas, serviços e unidades da política socioassistencial de
Hortolândia.

**Princípio estruturante:**
A arquitetura de dados deve ser imune a mudanças políticas
e sensível a mudanças normativas.

---

## Posição na cadeia relacional do projeto
```
DIM_NORMA_JURIDICA
        ↓
REL_NORMA_PROGRAMA
        ↓
DIM_PROGRAMA → DIM_SERVICO → DIM_UNIDADE → DIM_LOTEAMENTO
```

Uma norma pode criar ou alterar vários programas.
Um programa pode ter sido criado ou alterado por várias normas.
Relação N:N — resolvida pela tabela REL_NORMA_PROGRAMA.

---

## Estrutura da DIM_NORMA_JURIDICA
```
id_norma             (chave surrogate)
tipo                 (Lei | Lei Complementar | Decreto | 
                      Portaria | Resolução | Emenda | 
                      Deliberação | Instrução Normativa)
numero
ano
esfera               (Federal | Estadual | Municipal)
ementa               (descrição resumida do objeto)
tema_principal       (Assistência Social | Habitação | 
                      Educação | Saúde | Trabalho | 
                      Direitos Humanos | Orçamento | Outro)
classificacao        (Estrutural | Financeira | Público-alvo |
                      Indicadores | Territorial | 
                      Regulamentação Operacional)
secretaria_responsavel
data_publicacao
data_revogacao       (null = vigente)
norma_revogadora     (FK → id_norma — se foi revogada)
ativo                (S/N)
url_diario_oficial
observacoes
```

---

## Estrutura da REL_NORMA_PROGRAMA
```
id_rel               (chave surrogate)
id_norma             (FK → DIM_NORMA_JURIDICA)
id_programa          (FK → DIM_PROGRAMA)
tipo_impacto         (Cria | Altera | Extingue | Regulamenta | 
                      Suspende | Financia)
data_impacto
observacoes
```

---

## Classificação estratégica

| Código | Tipo | Descrição |
|--------|------|-----------|
| EST | Estrutural | Cria ou extingue órgão, unidade ou secretaria |
| FIN | Financeira | Define orçamento, repasse ou benefício |
| PUB | Público-alvo | Define critérios de elegibilidade |
| IND | Indicadores | Estabelece metas ou métricas |
| TER | Territorial | Define abrangência ou divisão territorial |
| REG | Regulamentação | Operacionaliza norma superior |

---

## Fontes de captura

### Federal
- Constituição Federal — Art. 203 e 204
- LOAS — Lei nº 8.742/1993
- SUAS — resoluções CNAS
- Portarias MDS / MDAS
- Lei do Bolsa Família — Lei nº 14.601/2023
- Lei do BPC
- Decreto 7.053/2009 — Política Nacional Pop. Rua
- Lei Complementar nº 128/2008 — MEI
- Lei nº 9.533/1997 — Banco do Povo

### Estadual (SP)
- Normativas SUAS-SP
- Deliberações CONSEAS
- Programas estaduais (Vida Longa, Banco do Povo Paulista)

### Municipal (Hortolândia)
- Leis Municipais
- Decretos do Executivo
- Criação de CRAS, CREAS, Centro POP
- Plano Municipal de Assistência Social (PMAS)
- Lei Orçamentária Anual (LOA)
- Plano Plurianual (PPA)
- Lei de Diretrizes Orçamentárias (LDO)

---

## Avaliação de impacto na modelagem

A cada nova norma capturada, avaliar:

| Dimensão / Fato | Afeta? | Ação |
|-----------------|--------|------|
| DIM_PROGRAMA | Sim/Não | Criar ou atualizar registro |
| DIM_UNIDADE | Sim/Não | Criar ou atualizar registro |
| DIM_TERRITORIO | Sim/Não | Revisar abrangência |
| FATO_ATENDIMENTO | Sim/Não | Revisar regras de negócio |
| FATO_CONCESSAO_BENEFICIO | Sim/Não | Revisar critérios |
| FATO_PARTICIPACAO_PROGRAMA | Sim/Não | Revisar elegibilidade |
| Necessita nova DIM? | Sim/Não | Criar proposta |
| Necessita nova FATO? | Sim/Não | Criar proposta |

---

## Registros iniciais — normas estruturantes

| id | tipo | numero | ano | esfera | ementa resumida | classificacao |
|----|------|--------|-----|--------|-----------------|---------------|
| 001 | Lei | 8.742 | 1993 | Federal | LOAS — Lei Orgânica da Assistência Social | EST |
| 002 | Resolução CNAS | 109 | 2009 | Federal | Tipificação Nacional dos Serviços Socioassistenciais | REG |
| 003 | Decreto | 7.053 | 2009 | Federal | Política Nacional para Pop. em Situação de Rua | PUB |
| 004 | Lei Complementar | 128 | 2008 | Federal | Criação do MEI | EST |
| 005 | Lei | 9.533 | 1997 | Federal | Programa de Garantia de Renda Familiar — Banco do Povo | FIN |
| 006 | Lei | 14.601 | 2023 | Federal | Programa Bolsa Família | FIN |

---

## Pendências

1. Levantar leis municipais de criação dos CRAS de Hortolândia
2. Levantar lei municipal de criação do Centro POP
3. Levantar lei municipal de criação do ACERTE e Ressignifica
4. Identificar decretos municipais de reorganização territorial dos CRAS
5. Mapear PLs aprovados com interface social via visita ao jurídico da Câmara

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 03/03/2026 | Criação da dimensão — estrutura, fontes e registros iniciais |

---

*Documento de registro interno. Uso restrito ao projeto.*
Após colar no GitHub, o próximo arquivo natural é o dim_domicilio_v01.md — ou prefere fazer as tabelas FATO primeiro?



