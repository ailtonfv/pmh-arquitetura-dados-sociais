# Registro de Ideias — "13/03/2026"
**Projeto:** Atlas Social de Hortolândia
**Repositório:** `ailtonfv/Atlas-Social-de-Hortolandia`
**Destino:** `00_governanca/`
**Fonte:** Ciclo jornalístico — Tribuna Liberal, edições 12/03/2026 (nº 9.698) e 13/03/2026 (nº 9.699)

---

## Ideia 01 — Jardim Ricardo: padrão territorial de vulnerabilidade climática
**Origem:** Tribuna Liberal, p. 04 — "Força-tarefa começa para recuperar estragos das chuvas em Hortolândia" (edição 12/03/2026)

**Registro:**
Segunda ocorrência documentada de atendimento emergencial no Jardim Ricardo por evento climático em 2026:
- 1ª ocorrência: 26/02/2026 — 16 famílias desabrigadas (já registrado em `EMERGENCIAS`)
- 2ª ocorrência: 09-10/03/2026 — força-tarefa com Defesa Civil + Secretarias de Obras, Serviços Urbanos, Meio Ambiente e Desenvolvimento Sustentável

O Jardim Ricardo deixa de ser evento isolado. Duas ativações documentadas em menos de 15 dias configuram **padrão territorial** — baixada com vulnerabilidade climática recorrente.

**Informações adicionais relevantes:**
- Ponte sobre o córrego bloqueada desde 04/03 — licitação aberta para elevação
- Obras na SP-101 (Rodovias do Tietê) previstas para agosto de 2026
- IPTU prorrogado para 20/03/2026 para moradores atingidos
- Prefeito orientou moradores a organizar abaixo-assinado para ressarcimento de danos

**Impacto arquitetural:**
- `notas_arquiteturais_programas_sociais_v01.md`: atualizar nota do programa `EMERGENCIAS` com 2ª ocorrência
- `dim_municipio_regioes_loteamentos_v01.md`: flag de vulnerabilidade climática recorrente para o Jardim Ricardo (quando revisado)
- `FATO_IVS_LOTEAMENTO`: dado futuro para dimensão `infraestrutura_urbana` — déficit de drenagem urbana documentado em série

**Destino dos arquivos:** `notas_arquiteturais_programas_sociais_v01.md`

---

## Ideia 02 — Homicídio no Jardim Nossa Senhora de Fátima
**Origem:** Tribuna Liberal, p. 08 — "Assassino desce de carro e executa homem de 44 anos em Hortolândia" (edição 12/03/2026)

**Registro:**
Júlio César Machado Silva, 44 anos, executado em "10/03/2026" na Rua 2, Jardim Nossa Senhora de Fátima, Hortolândia.

**Relevância para o projeto:**
Dado de contexto territorial. O projeto ainda não possui tabela de segurança pública. Não forçar encaixe em estrutura inexistente.

**Nota metodológica:**
Violência urbana é variável latente de vulnerabilidade territorial. Em metodologias como o IVS-H adaptado, poderia integrar dimensão de `capital_humano` ou `infraestrutura_urbana` como indicador auxiliar. Registrar para ciclo futuro quando houver fonte de dados estruturada (SSP/SP, Secretaria de Segurança Pública municipal).

**Destino atual:** apenas este registro. Sem arquivo definitivo ainda.

---

## Ideia 03 — Cooperuni: cooperativa de reciclagem em Hortolândia
**Origem:** Tribuna Liberal, p. 07 — Edital de convocação de Assembleia Geral Ordinária (edição 12/03/2026)

**Registro:**
**Cooperuni** — Cooperativa de Trabalho, produtos, coleta, manuseio, processamento e comercialização de materiais reutilizáveis e recicláveis.
- **CNPJ:** 06.871.886/0001-25
- **Endereço:** Estrada Municipal de Hortolândia, 4183 — Bairro Sabina B. Camargo — CEP 13.185-576
- **Presidente:** Cleuza Grilanda Vicente
- **Assembleia Geral Ordinária:** "23/03/2026" às 15h

**Relevância para o projeto:**
Cooperativa **não mapeada** nas OSCs do projeto. Localização em Hortolândia confirmada. Possível interface com:
- Inserção produtiva de público CadÚnico (catadores, trabalhadores informais)
- Dimensão `renda_trabalho` do IVS-H
- Cadeia de economia solidária — alternativa ao emprego formal (complementa PAT/SINE/CAGED)

**Pendência:** confirmar vínculo com público CadÚnico e se está registrada no CMAS ou CMDCA.

**Destino:** `dim_osc_v01.md` — nova OSC a investigar.

---

## Ideia 04 — Nova UBS Porte V no Jardim Terras de Santa Maria
**Origem:** Tribuna Liberal, p. 08 — "UBS de grande porte começa a ser construída no Jd. Terras de Santa Maria, em Hortolândia" (edição 13/03/2026)

**Registro:**
A Prefeitura de Hortolândia iniciou a construção de uma UBS Porte V no Jardim Terras de Santa Maria, com recursos do Governo Federal. Características:
- Área total do terreno: mais de 4.000 m²
- Área construída: 1.354,73 m²
- Capacidade: mínimo 5 equipes de Estratégia de Saúde da Família
- Prazo de obra: 12 meses — previsão de entrega: 2027
- Estrutura: recepção, consultórios, vacinação, farmácia, odontologia, curativos, **anfiteatro para atividades coletivas** e horta externa
- Outras duas UBSs previstas: uma no Jardim Amanda e outra em local a definir — todas com recursos federais

**Relevância para o projeto:**
Expansão de infraestrutura de saúde em território específico. A dimensão **Capital Humano** do IVS-H contempla acesso a serviços de saúde como variável de vulnerabilidade. A localização da nova UBS pode ser cruzada com dados de concentração de famílias vulneráveis no CadÚnico para verificar se o investimento territorial está alcançando as áreas de maior necessidade.

**Impacto arquitetural potencial:**
- `dim_unidades_de_atendimento_v01.md`: futura inclusão de UBSs como unidade territorial de referência intersetorial
- `FATO_IVS_TERRITORIAL`: variável de cobertura de saúde por território — dado de contexto para dimensão `capital_humano`
- Cruzamento futuro: cobertura UBS x cobertura CRAS x concentração CadÚnico por bairro

**Destino:** apenas este registro. Monitorar entrega em 2027 para atualização.

---

## Ideia 05 — CAPS Vida: sede própria no Jardim América
**Origem:** Tribuna Liberal, p. 08 — nota ao final da matéria sobre UBS (edição 13/03/2026)

**Registro:**
Ordem de serviço emitida para construção da sede própria do CAPS (Centro de Atenção Psicossocial) Vida, no Jardim América.
- Área: 762,09 m²
- Prazo: 20 meses
- Público: adultos (a partir de 18 anos) com sofrimento psíquico intenso, transtornos mentais graves e persistentes
- Recursos: Governo Federal

**Relevância para o projeto:**
Saúde mental é uma dimensão frequentemente invisível no CadÚnico, mas presente de forma significativa em famílias de alta complexidade. O CAPS é equipamento intersetorial com interface direta com o SUAS — famílias atendidas pelo CRAS frequentemente incluem membros com demandas de saúde mental não atendidas.

**Nota metodológica:**
O projeto ainda não possui variável de saúde mental como indicador de vulnerabilidade. Registrar para ciclo futuro como possível enriquecimento do perfil de alta complexidade familiar — mediante fonte de dados estruturada (e-SUS, prontuário CAPS).

**Impacto arquitetural potencial:**
- `dim_unidades_de_atendimento_v01.md`: CAPS como unidade de referência de proteção especial
- Cruzamento futuro: localização CAPS Vida x famílias CadÚnico no Jardim América x cobertura CRAS da região

**Destino:** apenas este registro. Monitorar implantação.

---

## Ideia 06 — Implanon: planejamento familiar nas UBSs de Hortolândia
**Origem:** Tribuna Liberal, p. 10 — "Hortolândia passa a oferecer implante contraceptivo Implanon para mulheres" (edição 13/03/2026)

**Registro:**
A Secretaria de Saúde de Hortolândia iniciou a distribuição do implante contraceptivo subdérmico Implanon nas UBSs, após capacitação de equipes médicas. O método é oferecido pelo SUS desde 2025 — antes disponível apenas na rede particular.
- Duração: até 3 anos — reversível
- Inserção: rápida (~15 min), sob a pele do braço
- Hormônio: etonogestrel
- Capacitação iniciada na UBS Santiago em 11/03/2026
- 12 médicos formados; 19 pacientes já atendidas na primeira sessão
- Previsão de conclusão das capacitações: abril/2026

**Relevância para o projeto:**
Planejamento familiar é variável de contexto relevante para análise de vulnerabilidade social. No perfil CadÚnico, monoparentalidade e número de filhos por família são indicadores presentes e utilizados na classificação de complexidade. A expansão do acesso a métodos contraceptivos de longa duração pode, ao longo do tempo, alterar o perfil demográfico das famílias mais vulneráveis.

**Nota metodológica:**
Não é programa de assistência social. É dado de contexto territorial e de política pública intersetorial. Não forçar encaixe em estrutura existente. Registrar para análise longitudinal futura.

**Destino:** apenas este registro. Sem arquivo definitivo neste ciclo.

---

*Atlas Social de Hortolândia — uso interno*
*Registro gerado em: "13/03/2026"*
