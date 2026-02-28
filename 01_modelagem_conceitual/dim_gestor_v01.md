# DIM_GESTOR — Gestores Municipais de Hortolândia
**Versão:** 01  
**Data de criação:** 28/02/2026  
**Fonte primária:** Documentos internos, relatórios quadrimestrais, ciclo jornalístico (Tribuna Liberal, fev/2026)  
**Responsável:** Ailton Vendramini / Claude (Anthropic)  
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Nota metodológica

Esta tabela registra os gestores municipais de Hortolândia com relevância para o projeto de inteligência territorial da assistência social. Inclui prefeito, vice-prefeito, secretários titulares, secretários adjuntos e diretores de departamentos estratégicos.

**Por que modelar gestores:**
- Secretários aparecem como `secretaria_responsavel` no DIM_PROGRAMA — o vínculo nominal permite rastreabilidade histórica
- Adjuntos conduzem o dia a dia operacional e participam de grupos de trabalho técnicos
- Mudanças de titularidade afetam encaminhamentos e acordos de acesso a dados
- O campo `data_fim` permite registrar substituições sem perder o histórico

**Fontes utilizadas:**
- Relatório Quadrimestral de Saúde — 3º Quadrimestre 2025 (data de posse dos gestores de Saúde)
- Tribuna Liberal — edições de fevereiro e março de 2026 (secretários identificados em ação)
- Documentos internos do projeto (reunião de 30/01/2026, nota técnica 02/02/2026)

---

## Estrutura da DIM_GESTOR

```
id_gestor           (chave surrogate)
nome
cargo               (Prefeito | Vice-Prefeito | Secretário | Secretário Adjunto | Diretor | A confirmar)
secretaria          (nome da secretaria ou órgão)
data_inicio         (data de posse ou início confirmado)
data_fim            (null = ainda no cargo)
ativo               (S/N)
fonte_confirmacao   (Diário Oficial | Relatório Oficial | Jornal | Documento Interno | A confirmar)
observacoes
```

---

## Registros confirmados

### Poder Executivo — Chefia

| id | Nome | Cargo | Secretaria / Órgão | Data Início | Data Fim | Ativo | Fonte |
|---|---|---|---|---|---|---|---|
| 001 | Zezé Gomes | Prefeito | Gabinete do Prefeito | A confirmar | — | S | Jornal (Tribuna Liberal) |
| 002 | A confirmar | Vice-Prefeito | Gabinete do Vice-Prefeito | A confirmar | — | S | Pendente |

---

### Secretarias — Titulares confirmados

| id | Nome | Cargo | Secretaria | Data Início | Data Fim | Ativo | Fonte |
|---|---|---|---|---|---|---|---|
| 003 | Maria dos Anjos Assis Barros | Secretária | Inclusão e Desenvolvimento Social | A confirmar | — | S | Jornal + Documento Interno |
| 004 | Maria dos Anjos Assis Barros | Presidente | Fundo Social de Solidariedade | A confirmar | — | S | Jornal (acúmulo de função) |
| 005 | Dênis André José Crupe | Secretário | Saúde | 15/05/2020 | — | S | Relatório Quadrimestral 3º Q/2025 |
| 006 | Dimas Corrêa Pádua | Secretário | Desenvolvimento Econômico, Trabalho, Turismo e Inovação | A confirmar | — | S | Jornal (Tribuna Liberal, 21/02/2026) |
| 007 | Eliane Nascimento | Secretária | Meio Ambiente e Desenvolvimento Sustentável | A confirmar | — | S | Jornal (Tribuna Liberal, 21/02/2026) |
| 008 | Gleguer Zorzin | Secretário | Esporte e Lazer | A confirmar | — | S | Jornal (Tribuna Liberal, 24/02/2026) |

---

### Secretarias — Adjuntos confirmados

| id | Nome | Cargo | Secretaria | Data Início | Data Fim | Ativo | Fonte |
|---|---|---|---|---|---|---|---|
| 009 | Jennifer Bazilio | Secretária Adjunta | Saúde | 02/01/2025 | — | S | Relatório Quadrimestral 3º Q/2025 |

---

### Diretores de departamento — confirmados

| id | Nome | Cargo | Departamento / Secretaria | Data Início | Data Fim | Ativo | Fonte |
|---|---|---|---|---|---|---|---|
| 010 | Jesus José Ribeiro da Costa | Diretor | Assistência Social (Sec. Inclusão) | A confirmar | — | S | Jornal (Tribuna Liberal, 01/03/2026) |

---

### Conselhos e instâncias de controle social

| id | Nome | Cargo | Conselho / Instância | Data Início | Data Fim | Ativo | Fonte |
|---|---|---|---|---|---|---|---|
| 011 | Mauro Selço Salvino de Mendonça | Presidente | Conselho Municipal de Saúde (CMS) | A confirmar | — | S | Relatório Quadrimestral 3º Q/2025 |
| 012 | Sunne Teixeira dos Santos | Presidente | Conselho Municipal de Meio Ambiente (CMMA) | A confirmar | — | S | Jornal (Tribuna Liberal, 21/02/2026) |

---

## Secretarias sem titular confirmado

As secretarias abaixo foram identificadas no DIM_PROGRAMA mas ainda não tiveram seus titulares confirmados por fonte documental:

| Secretaria | Status |
|---|---|
| Habitação | Pendente |
| Educação, Ciência e Tecnologia | Pendente |
| Segurança Pública | Pendente |
| Governo | Pendente — nota: Maria dos Anjos (Inclusão) acumula Fundo Social; verificar se há secretário titular de Governo distinto |
| Desenvolvimento Urbano / Obras | Pendente — confirmar se existe como secretaria autônoma |

---

## Pendências e pontos a confirmar

1. **Vice-Prefeito** — nome não apareceu nos documentos do projeto até aqui. Verificar no site oficial ou Diário Oficial.
2. **Datas de início dos secretários** — apenas Saúde tem data de posse documentada (Diário Oficial). Para os demais, a data de início deve ser confirmada.
3. **Secretaria de Governo** — é comum em municípios que o Fundo Social seja presidido pela primeira-dama com vínculo à Sec. de Governo. Verificar se há secretário titular distinto ou se as funções estão concentradas.
4. **Secretários adjuntos das demais secretarias** — nenhum adjunto fora de Saúde foi identificado até esta versão. Monitorar via Diário Oficial e ciclo jornalístico.
5. **Diretores de departamento estratégicos** — verificar titulares dos departamentos de Direitos Humanos, PCD, Segurança Alimentar e Inclusão Produtiva (DIPGR), pois aparecem no DIM_PROGRAMA como executores diretos de programas.
6. **Fernanda Fadiga** — psicóloga identificada como coordenadora do CCMI (Centro de Convivência da Melhor Idade). Verificar cargo formal para inclusão como diretora ou coordenadora.

---

## Log de alterações

| Versão | Data | Alteração |
|---|---|---|
| v01 | 28/02/2026 | Criação da tabela — 12 registros confirmados, 5 secretarias pendentes |

---

## Próximos passos

1. Salvar no repositório GitHub como `dim_gestor_v01.md`
2. Consultar site oficial da Prefeitura de Hortolândia e Diário Oficial para confirmar datas de posse e vice-prefeito
3. Completar adjuntos das secretarias de Inclusão, Habitação e Educação — prioritárias para o projeto
4. Incluir diretores dos departamentos executores no DIM_PROGRAMA (DIPGR, Direitos Humanos, Segurança Alimentar)
5. Atualizar incrementalmente via ciclo jornalístico — periodicidade semanal

---

*Documento gerado a partir de levantamento documental e ciclo jornalístico. Sujeito a revisão e atualização.*

