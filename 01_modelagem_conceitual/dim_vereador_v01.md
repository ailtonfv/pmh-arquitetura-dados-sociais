# DIM_VEREADOR — Vereadores de Hortolândia
**Versão:** 01  
**Data de criação:** 01/03/2026  
**Fonte primária:** SAPL — Câmara Municipal de Hortolândia (sapl.hortolandia.sp.leg.br)  
**Responsável:** Ailton Vendramini / 
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Nota metodológica

Este documento registra os vereadores de Hortolândia com relevância para o projeto de inteligência territorial da assistência social.

**Por que modelar vereadores separadamente:**
- Vereadores são autores de Projetos de Lei que podem criar, modificar ou extinguir programas municipais
- O vínculo legislativo permite rastrear a **origem normativa** dos programas catalogados no DIM_PROGRAMA
- A separação do DIM_GESTOR mantém o Executivo e o Legislativo em dimensões distintas, refletindo a separação institucional real
- O campo `observacoes` permite registrar vínculos temáticos identificados progressivamente

**Cadeia lógica adotada:**
```
Vereador → propõe → PL (Projeto de Lei)
                        ↓ (se aprovado)
                    Lei Municipal
                        ↓ (se cria ou regula serviço)
                    Programa Municipal → DIM_PROGRAMA
```

**Evolução prevista:**
- v01 — Base dos vereadores (legislatura, partido, exercício)
- v02 — Inclusão da seção FATO_PL após mapeamento dos PLs de 2025–2026 (visita ao jurídico da Câmara)
- v03 em diante — Vínculos confirmados entre PLs e programas do DIM_PROGRAMA

---

## Estrutura da DIM_VEREADOR

```
id_vereador         (chave surrogate)
nome_politico       (nome usado publicamente / na Câmara)
nome_completo       (nome civil completo)
partido             (sigla do partido)
legislatura         (ex: 9ª Legislatura 2025–2028)
em_exercicio        (S/N)
cargo_mesa          (Presidente | Vice-Presidente | 1º Secretário | 2º Secretário | null)
fonte_confirmacao   (SAPL | Diário Oficial | Jornal | A confirmar)
observacoes
```

---

## 9ª Legislatura — 2025 a 2028

### Vereadores em exercício

| id | Nome Político | Nome Completo | Partido | Em Exercício | Cargo na Mesa | Fonte |
|----|--------------|--------------|---------|-------------|--------------|-------|
| V001 | Aldemir Clemente | Aldemir Clemente da Silva | PODE | S | A confirmar | SAPL |
| V002 | Ananias | Ananias José Barbosa | REPUBLICANOS | S | A confirmar | SAPL |
| V003 | Carlão do Nova Europa | Carlos Rodrigues de Oliveira | PV | S | A confirmar | SAPL |
| V004 | Cesinha Brasil | Cicero Cesar Brasil | PSB | S | A confirmar | SAPL |
| V005 | Nei Prazeres | Claudinei Prazeres de Barros | PP | S | A confirmar | SAPL |
| V006 | Clemilton Silva | Clemilton Alves da Silva | PL | S | A confirmar | SAPL |
| V007 | Clodoaldo | Clodoaldo Santos da Silva | PODE | S | A confirmar | SAPL |
| V008 | Daniel Laranjeira | Daniel Laranjeira | PSD | S | A confirmar | SAPL |
| V009 | Derli | Derli de Jesus Athanazio Bueno | PCdoB | S | A confirmar | SAPL |
| V010 | Dionatan Domingues | Dionata Domingues | PP | S | A confirmar | SAPL |
| V011 | Zaca | Edimilson Marcelo Afonso | REPUBLICANOS | S | A confirmar | SAPL |
| V012 | Edivaldo | Edivaldo Sousa Araújo | PP | S | A confirmar | SAPL |
| V013 | Ceará | Edivam Campos de Albuquerque | União | S | A confirmar | SAPL |
| V014 | Luiz Regional | Luiz Carlos Silva Meira | REPUBLICANOS | S | A confirmar | SAPL |
| V015 | Paulão | Paulo Pereira Filho | REPUBLICANOS | S | A confirmar | SAPL |
| V016 | Régis da Serralheria | Reginaldo Roberto Rodrigues da Costa | PSB | S | A confirmar | SAPL |
| V017 | Prof.ª Roberta Diniz | Roberta Morais Diniz | PT | S | A confirmar | SAPL |
| V018 | Sidney Cabrito | Sidney Eloi Vianna | PSB | S | A confirmar | SAPL |
| V019 | Nego | Valdecir Alves Pereira | PSD | S | A confirmar | SAPL |

### Vereadores fora de exercício

| id | Nome Político | Nome Completo | Partido | Em Exercício | Motivo | Fonte |
|----|--------------|--------------|---------|-------------|--------|-------|
| V020 | Léo do LM | Leonardo Martins Moreira | PSB | N | A confirmar | SAPL |

> 📌 **Nota — Lenivaldo Pauliuki:** Ex-vereador de Hortolândia. Migrou para o Executivo municipal — atualmente Secretário Adjunto de Inclusão e Desenvolvimento Social (id 018 no DIM_GESTOR). Consta como autor de matérias legislativas no SAPL em legislaturas anteriores.

---

## Composição por partido — 9ª Legislatura

| Partido | Vereadores em Exercício | Nomes |
|---------|------------------------|-------|
| REPUBLICANOS | 4 | Ananias, Zaca, Luiz Regional, Paulão |
| PP | 3 | Nei Prazeres, Dionatan Domingues, Edivaldo |
| PSB | 3 | Cesinha Brasil, Régis da Serralheria, Sidney Cabrito |
| PODE | 2 | Aldemir Clemente, Clodoaldo |
| PSD | 2 | Daniel Laranjeira, Nego |
| PCdoB | 1 | Derli |
| PL | 1 | Clemilton Silva |
| PT | 1 | Prof.ª Roberta Diniz |
| PV | 1 | Carlão do Nova Europa |
| União | 1 | Ceará |
| **TOTAL** | **19** | |

---

## FATO_PL — Projetos de Lei com interface social

> ⚠️ **Seção em construção.** Mapeamento dos PLs de 2025–2026 pendente de visita ao jurídico da Câmara Municipal. Esta seção será preenchida na v02 com: número do PL, autor, ementa, status, lei gerada e programa vinculado no DIM_PROGRAMA.

### Estrutura prevista para v02

```
id_pl               (chave surrogate)
id_vereador         (FK → DIM_VEREADOR)
pl_numero           (ex: PL 012/2025)
pl_ano
pl_ementa           (descrição resumida do objeto)
pl_tema             (Assistência Social | PCD | Habitação | Segurança Alimentar | 
                     Inserção Produtiva | Juventude | Idoso | Criança e Adolescente | Outro)
status_pl           (Em tramitação | Aprovado | Arquivado | Vetado)
lei_origem          (número da lei gerada, se aprovado)
programa_vinculado  (nome do programa no DIM_PROGRAMA, se houver)
observacoes
```

### Prioridade de mapeamento

Vereadores com maior volume de PLs apresentados em 2026 (dados parciais — apenas 2026):

| Vereador | PLs 2026 | PLC 2026 | Observação |
|----------|----------|----------|------------|
| Régis da Serralheria (V016) | 4 | 1 | Maior volume — prioridade máxima |
| Edivaldo (V012) | 3 | — | |
| Zaca (V011) | 3 | — | |
| Paulão (V015) | 3 | — | |
| Derli (V009) | 2 | — | |
| Nego (V019) | 2 | — | |
| Nei Prazeres (V005) | 2 | — | |
| Ananias (V002) | 1 | — | |
| Ceará (V013) | 1 | — | |
| Cesinha Brasil (V004) | 1 | — | |
| Daniel Laranjeira (V008) | 1 | — | |
| Luiz Regional (V014) | 1 | — | |
| Sidney Cabrito (V018) | 1 | — | |

> 📌 **Nota:** Os dados acima referem-se apenas ao ano de 2026. A legislatura iniciou em janeiro de 2025 — os PLs de 2025 ainda não foram mapeados e podem conter propostas mais estruturantes. Solicitar listagem completa 2025–2026 na visita ao jurídico.

---

## Pendências

1. **Cargo na Mesa Diretora** — Confirmar presidente, vice-presidente e secretários da Mesa para todos os vereadores.
2. **Léo do LM (V020)** — Confirmar motivo do afastamento e eventual substituto.
3. **PLs 2025–2026** — Mapear conteúdo dos Projetos de Lei com foco em temas sociais. Visita ao jurídico da Câmara prevista.
4. **PLs de legislaturas anteriores** — Identificar leis municipais vigentes que criaram programas ativos no DIM_PROGRAMA e seus respectivos autores.
5. **Comissões temáticas** — Identificar composição da Comissão de Desenvolvimento e Bem Estar Social, Direitos Humanos e Cidadania — diretamente relacionada ao escopo do projeto.

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|------------|
| v01 | 01/03/2026 | Criação do documento — 19 vereadores em exercício + 1 fora de exercício (9ª Legislatura 2025–2028); composição por partido; seção FATO_PL estruturada (em construção); tabela de prioridade de mapeamento de PLs |

---

*Documento gerado a partir do SAPL — Câmara Municipal de Hortolândia. Sujeito a revisão e atualização.*

