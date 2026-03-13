# Registro de Ideias — "13/03/2026"
**Projeto:** Atlas Social de Hortolândia
**Repositório:** `ailtonfv/Atlas-Social-de-Hortolandia`
**Destino:** `00_governanca/`
**Fonte:** Ciclo jornalístico — Tribuna Liberal, edição 13/03/2026 (nº 9.699)

---

## Ideia 01 — Nova UBS Porte V no Jardim Terras de Santa Maria

**Origem:** Tribuna Liberal, p. 08 — "UBS de grande porte começa a ser construída no Jd. Terras de Santa Maria, em Hortolândia"

**Registro:**
A Prefeitura de Hortolândia iniciou a construção de uma UBS Porte V no Jardim Terras de Santa Maria, com recursos do Governo Federal. Características:
- Área total do terreno: mais de 4.000 m²
- Área construída: 1.354,73 m²
- Capacidade: mínimo 5 equipes de Estratégia de Saúde da Família
- Prazo de obra: 12 meses — previsão de entrega: 2027
- Estrutura: recepção, consultórios, vacinação, farmácia, odontologia, curativos, **anfiteatro para atividades coletivas** e horta externa
- Outras duas UBSs previstas: uma no Jardim Amanda e outra em local a definir — todas com recursos federais

**Relevância para o projeto:**
Expansão relevante de infraestrutura de saúde em território específico. A dimensão **Capital Humano** do IVS-H contempla acesso a serviços de saúde como variável de vulnerabilidade. A localização da nova UBS pode ser cruzada com dados de concentração de famílias vulneráveis no CadÚnico para verificar se o investimento territorial está alcançando as áreas de maior necessidade.

**Impacto arquitetural potencial:**
- `dim_unidades_de_atendimento_v01.md`: futura inclusão de UBSs como unidade territorial de referência intersetorial
- `FATO_IVS_TERRITORIAL`: variável de cobertura de saúde por território — dado de contexto para dimensão `capital_humano`
- Cruzamento futuro: cobertura UBS x cobertura CRAS x concentração CadÚnico por bairro

**Destino:** apenas este registro. Monitorar entrega em 2027 para atualização.

---

## Ideia 02 — CAPS Vida: sede própria no Jardim América

**Origem:** Tribuna Liberal, p. 08 — "UBS de grande porte começa a ser construída..." (nota ao final da matéria)

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

## Ideia 03 — Implanon: planejamento familiar nas UBSs de Hortolândia

**Origem:** Tribuna Liberal, p. 10 — "Hortolândia passa a oferecer implante contraceptivo Implanon para mulheres"

**Registro:**
A Secretaria de Saúde de Hortolândia iniciou a distribuição do implante contraceptivo subdérmico Implanon nas UBSs, após capacitação de equipes médicas. O método é oferecido pelo SUS desde 2025 — antes estava disponível apenas na rede particular.
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
