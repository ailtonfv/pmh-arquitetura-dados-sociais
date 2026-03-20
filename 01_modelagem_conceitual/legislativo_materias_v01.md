# — Projetos de Lei Municipal com Interface Social
**Versão:** 01
**Data de criação:** 02/03/2026
**Responsável:** Ailton Vendramini / 
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Nota metodológica

Esta tabela registra os Projetos de Lei da Câmara Municipal de 
Hortolândia com interface em políticas sociais, assistência social, 
direitos humanos, saúde, habitação, empregabilidade e públicos 
vulneráveis.

O objetivo é rastrear a origem legislativa dos programas catalogados 
no DIM_PROGRAMA — identificando quais leis criaram, modificaram ou 
extinguiram programas municipais.

**Fonte primária:** SAPL — Sistema de Apoio ao Processo Legislativo
(sapl.hortolandia.sp.leg.br)
**Coleta presencial:** Jurídico da Câmara Municipal — prevista
**Legislatura:** 9ª (2025–2028)

---

## Estrutura da FATO_PL
```
id_pl                (chave surrogate)
numero_pl            (ex: 012/2026)
ano
tipo                 (PL | PLC | Emenda | Resolução | Decreto Legislativo)
ementa               (descrição resumida do objeto)
id_autor             (FK → DIM_VEREADOR | "Executivo")
data_proposicao
comissao_principal   (Bem-Estar Social | Finanças | Jurídica | Outra)
status_atual         (Proposição | Comissão | Plenário | Aprovado | 
                      Vetado | Veto Derrubado | Sancionado | 
                      Publicado | Rejeitado | Arquivado)
data_status
numero_lei           (preenchido apenas se virou lei — ex: Lei 4.521/2026)
vinculo_programa     (FK → DIM_PROGRAMA — se criar ou modificar programa)
observacoes
```

---

## Fluxo legislativo de referência
```
Proposição
    ↓
Distribuição e Leitura em Plenário
    ↓
Análise nas Comissões Técnicas
(Bem-Estar Social | Finanças | Jurídica)
    ↓
Discussão em Plenário
    ↓
Votação
    ↓
Sanção ou Veto do Prefeito
    ↓
Publicação no Diário Oficial
```

**Observação:** Se vetado, o PL retorna à Câmara.
A Câmara pode manter ou derrubar o veto por maioria simples.
Se derrubado, vira lei sem sanção.

---

## Comissão estratégica para o projeto

**Comissão de Desenvolvimento e Bem-Estar Social,
Direitos Humanos e Cidadania**

Todo PL com interface social passa por esta comissão.

| Vereador | Partido | Cargo |
|---|---|---|
| Derli | PCdoB | Presidente |
| Professora Roberta Diniz | PT | Vice-Presidente |
| Cesinha Brasil | PSB | Secretário |
| Nei Prazeres | PP | Membro |

---

## Registros — PLs com interface social (2025–2026)

> ⏳ **Preenchimento pendente**
> Coleta dos textos integrais aguarda visita ao jurídico
> da Câmara Municipal.
> Prioridade: PLs de 2025 e 2026 com interface em
> assistência social, saúde, habitação, PCD e empregabilidade.

| id_pl | numero_pl | tipo | ementa | autor | status | vinculo_programa |
|---|---|---|---|---|---|---|
| — | — | — | A coletar | — | — | — |

---

## Prioridade de mapeamento

Vereadores com maior volume de PLs apresentados (2025–2026):

| Vereador | PLs 2025 | PLs 2026* | Prioridade |
|---|---|---|---|
| Professora Roberta Diniz | 24 | 0 | Alta — foco Educação e Inclusão |
| Derli | 13 | 2 | Alta — presidente Comissão Social |
| Zaca | 3 | — | Média |
| Edivaldo | 3 | — | Média |
| Paulão | 3 | — | Média |
| Régis da Serralheria | 4 + 1 PLC | — | Média |
| Nego | 2 | — | Média |
| Nei Prazeres | 2 | — | Média |

*2026: dados de janeiro e fevereiro.

---

## Pendências

1. Coleta presencial dos textos dos PLs no jurídico da Câmara
2. Classificação temática de cada PL coletado
3. Vinculação ao DIM_PROGRAMA (campo vinculo_programa)
4. Identificar suplente PSB que assumiu cadeira do Léo do LM
5. Confirmar composição completa da Mesa Diretora

---

## Log de alterações

| Versão | Data | Alterações |
|---|---|---|
| v01 | 02/03/2026 | Criação da estrutura — registros pendentes de coleta presencial |

---

*Documento de registro interno. Uso restrito ao projeto.*
