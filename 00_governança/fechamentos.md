[fechamento_dia_19_03_2026.txt](https://github.com/user-attachments/files/26117017/fechamento_dia_19_03_2026.txt)
# Fechamento do Dia — 19/03/2026

**Projeto:** Atlas Social de Hortolândia  
**Responsável:** Ailton Vendramini  
**Repositório:** ailtonfv/Atlas-Social-de-Hortolandia

---

## Resumo da Sessão

Dia focado em documentação institucional, atualização do catálogo de
programas e produção de conteúdo para o e-book. Sem execução técnica
na Debian — prioridade transferida para próxima sessão.

---

## Arquivos Gerados

| Arquivo | Versão | Localização | O que mudou |
| --- | --- | --- | --- |
| `palestra_marco_2026.md` | v09 → v10 | `00_governanca/` | Slide de Suporte: caminho exato FTP IBGE (8 etapas), dado fossa séptica (Domicilio_SP.zip), distinção SNIS x IBGE formalizada |
| `dim_programa.md` | v05 → v06 | `01_modelagem_conceitual/` | CASA_MULHER_BR e ELES_ELAS adicionados ao Grupo 8. Total: 69 programas |
| `reuniao_17_03_2026_nota_tecnica_v01.docx` | v01 (novo) | e-book / Reuniões | Nota técnica da ata Caio x Cláudia (17/03/2026) — pronta para inserir após 10/02/2026 |
| `ebook_cap_sistema_socioassistencial_v01.docx` | v01 (novo) | e-book / Capítulos | Síntese analítica das duas atas SMIDS para capítulo do e-book |

**Commitados pelo Ailton:** `palestra_marco_2026_v10.md`, `dim_programa_v06.md`

---

## Decisão Importante Registrada

**CadÚnico não vai para o GitHub — nunca.**

O arquivo `/tmp/cecad/tudo.csv` (~72.400 indivíduos) contém dados
pessoais protegidos pela LGPD (Lei 13.709/2018). Subir em repositório
público seria violação direta da lei.

O que vai para o repositório:
- Scripts SQL de transformação e cálculo (versionados e auditáveis)
- Resultados agregados por loteamento/núcleo/RP (sem identificação individual)
- Documentação metodológica

O que fica apenas na Debian institucional:
- `/tmp/cecad/tudo.csv` — dado bruto pessoal
- `hortolandia.db` e `atlas_social_hortolandia.db` — já no `.gitignore`

---

## Estado do SIGAS

Contrato da empresa venceu. Nova licitação em andamento. Acesso aos
dados depende de outros canais institucionais — em tratativa. Não há
previsão definida.

---

## Análise Estratégica — Palestra

Exercício realizado: classificação dos 5 itens de maior impacto para
a Secretária de Inclusão na plateia, do ponto de vista dela:

1. Frase "Hoje atende → passa a priorizar" — pode gerar defensividade
   ou aliança dependendo da entrega oral
2. Amanda e Primavera com evidência empírica — respeito, não crítica
3. Gap vulneráveis x atendidos — torna mensurável o que ela já sabe
4. Ponto focal — demanda adicional ou protagonismo (depende do prefeito)
5. Ausência de integração intersetorial — item mais sensível, exige
   tom cuidadoso

A ordem de apresentação importa: construir aliança antes de chegar
nos itens 3 e 5.

---

## Pendências Abertas — Próxima Sessão

| Prioridade | Item |
| --- | --- |
| Alta | Calcular IVS-H Parcial v1 na Debian (5 variáveis CadÚnico) |
| Alta | Script SQL de cálculo para o repositório |
| Alta | Preview .docx da palestra v10 |
| Alta | `dim_fonte_dado_v01.md` autônomo em `01_modelagem_conceitual/` |
| Alta | Atualizar `dim_orgao_executor` — Sandra Pablo, porte CRAS, Amanda novo CRAS |
| Média | Roteiro segunda visita Caio à SMIDS (3 blocos) |
| Média | Resolver 39 bairros com Cláudia — campo `status_loteamento` |
| Média | `dim_programa` — refugiados/imigrantes (cesta básica confirmada em campo) |

---

## Roteiro Segunda Visita do Caio — Registrado

**Bloco 1 — Capacidade instalada real**
- Quantas famílias com PAF ativo hoje em cada CRAS?
- Relação técnico/família em cada núcleo?
- Existe meta formal de acompanhamento por técnico?

**Bloco 2 — O dado de superação**
- Qual variável do CadÚnico dispara a suspensão do benefício?
- Existe série histórica de superações por território?

**Bloco 3 — Os 39 bairros**
- Para cada um dos 39, qual loteamento vizinho o CRAS usa como referência?

---

*Fechamento gerado ao final da sessão de 19/03/2026.*  
*Atlas Social de Hortolândia.*


| Variável | Dimensão | Fase 0 (IPEA) | Fase 1 (CadÚnico) | Fase 2 (Parcial) | Fase 3 (Completo) | Fonte principal |
|----------|----------|---------------|-------------------|------------------|-------------------|-----------------|
| IU_01 — % domicílios sem água/esgoto adequado | Infraestrutura | ✔ | ✖ | (✔) | ✔ | IBGE / SNIS |
| IU_02 — % domicílios sem coleta de lixo | Infraestrutura | ✔ | ✖ | (✔) | ✔ | IBGE / SNIS |
| IU_03 — % população em domicílios com baixa densidade/infraestrutura precária | Infraestrutura | ✔ | ✖ | (✔) | ✔ | IBGE |
| IU_04 — % população em domicílios com mobilidade precária | Infraestrutura | ✔ | ✖ | ✖ | ✔ | IBGE |

| CH_01 — Mortalidade infantil | Capital Humano | ✔ | ✖ | ✖ | ✔ | Saúde (SIM/DATASUS) |
| CH_02 — Crianças fora da escola | Capital Humano | ✔ | ✖ | (✔) | ✔ | INEP |
| CH_03 — Gravidez na adolescência | Capital Humano | ✔ | ✖ | ✖ | ✔ | Saúde |
| CH_04 — Jovens que não estudam nem trabalham | Capital Humano | ✔ | ✖ | (✔) | ✔ | IBGE / CAGED |

| CH_05 — Chefes mulheres sem fundamental com filho menor | Capital Humano | ✔ | ✔ | ✔ | ✔ | CadÚnico |
| CH_06 — Taxa de analfabetismo | Capital Humano | ✔ | ✔ | ✔ | ✔ | CadÚnico / IBGE |
| CH_07 — Crianças em domicílios sem adulto com fundamental completo | Capital Humano | ✔ | ✔ | ✔ | ✔ | CadÚnico |
| CH_08 — Jovens com baixa escolaridade | Capital Humano | ✔ | ✖ | (✔) | ✔ | IBGE |

| RT_01 — % renda per capita ≤ 1/2 SM | Renda/Trabalho | ✔ | ✔ | ✔ | ✔ | CadÚnico |
| RT_02 — Taxa de desocupação | Renda/Trabalho | ✔ | ✖ | (✔) | ✔ | CAGED / IBGE |
| RT_03 — Informalidade | Renda/Trabalho | ✔ | ✖ | ✖ | ✔ | IBGE |
| RT_04 — Dependência de idosos | Renda/Trabalho | ✔ | ✔ | ✔ | ✔ | CadÚnico |
| RT_05 — Baixa renda domiciliar geral | Renda/Trabalho | ✔ | ✔ | ✔ | ✔ | CadÚnico |
| RT_06 — Pessoas que trabalham fora do município | Renda/Trabalho | ✔ | ✖ | ✔ | ✔ | IBGE (SIDRA) |
| RT_07 — Pessoas que estudam fora do município | Renda/Trabalho | ✔ | ✖ | ✔ | ✔ | IBGE (SIDRA) |

| Fase | Nome | Variáveis utilizadas | Fontes de dados | Nível territorial | Objetivo principal | Limitações |
|------|------|---------------------|-----------------|------------------|-------------------|------------|
| Fase 0 | Conceitual | 16 (IPEA) | Literatura (IPEA, 2015) | Nacional / Municipal | Definir metodologia e legitimidade científica | Sem aplicação prática local |
| Fase 1 | MVP CadÚnico | 5 variáveis (CH + RT) | CadÚnico (dez/2025) | Loteamento | Primeira leitura territorial da vulnerabilidade | Sem cobertura total da população |
| Fase 2 | IVS-H Parcial | 8–10 variáveis | CadÚnico + Censo 2022 (agregado) | Loteamento + RP | Melhorar representatividade do índice | IBGE ainda sem microdados |
| Fase 3 | IVS-H Expandido | 16 variáveis completas | CadÚnico + IBGE + CAGED + Saúde + Educação | Loteamento + Núcleo + RP | Índice completo e comparável ao IPEA | Integração de dados complexa |
| Fase 4 | IVS-H Dinâmico | 16 variáveis + atualização contínua | CadÚnico (mensal) + demais fontes | Loteamento (tempo real aproximado) | Monitoramento contínuo da vulnerabilidade | Dependência de qualidade cadastral |
| Fase 5 | IVS-H Validado | 16 variáveis calibradas localmente | Todas + validação empírica | Multiescala | Ajuste de pesos com base na realidade local | Risco de perder comparabilidade se mal conduzido |
| Fase 6 | IVS-H Operacional | 16 variáveis + integração institucional | Todas + sistemas municipais | Loteamento → CRAS → RP | Uso na gestão pública (priorização, decisão) | Dependência institucional |
| Fase 7 | IVS-H Científico | 16 variáveis + microdados IBGE | IBGE (setor censitário) + demais | Setor censitário + loteamento | Alta precisão estatística | Microdados ainda indisponíveis |
