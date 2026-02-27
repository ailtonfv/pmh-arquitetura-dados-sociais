# DIM_PROGRAMA — Catálogo de Programas Municipais de Hortolândia
**Versão:** 01  
**Data de extração:** 27/02/2026  
**Fonte primária:** Levantamento documental 2023–2024 (Ailton Vendramini)  
**Responsável:** Ailton Vendramini / Claude (Anthropic)  
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Nota metodológica

Este catálogo foi extraído a partir de um levantamento documental cobrindo o primeiro e 2º semestre de 2023 e o 1º semestre de 2024, complementado pelas seções de Assistência Social, Direitos Humanos e Empregabilidade do mesmo documento.

Os programas foram classificados em dois tipos funcionais:

- **Tipo A — Serviço Direto:** gera atendimento registrável → candidato a `FATO_ATENDIMENTO`
- **Tipo B — Política Articuladora:** define diretrizes, articula setores, não gera atendimento direto

---

## Estrutura proposta da DIM_PROGRAMA

```
id_programa          (chave surrogate)
cod_programa         (código interno a definir)
nome_programa
tipo_programa        (A = Serviço Direto | B = Política Articuladora)
categoria            (ver grupos abaixo)
secretaria_responsavel
secretarias_parceiras
publico_alvo
faixa_etaria
vinculo_cadunico     (S/N — CadÚnico é critério de elegibilidade?)
nivel_protecao       (Básica | Especial | Habitação | Alimentar | Produtiva | Direitos | N/A)
origem              (Municipal | Estadual | Federal | Intersetorial)
ativo               (S/N)
data_inicio
observacoes
```

---

## Grupo 1 — Proteção Social Básica

### PAIF — Serviço de Atendimento e Proteção Integral às Famílias
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Famílias em situação de vulnerabilidade
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Origem:** Federal (SUAS)
- **Unidades executoras:** CRAS Amanda, CRAS Santa Clara, CRAS Novo Ângulo, CRAS Jardim Brasil, CRAS Primavera
- **Observações:** Principal serviço do CRAS. Escuta qualificada, encaminhamentos, fortalecimento de vínculos.

### Endereços dos CRAS
| Unidade | Endereço | Telefone |
|---|---|---|
| CRAS Amanda | Av. Tarsila do Amaral, 540, Jd. Amanda | (19) 3909-3642 |
| CRAS Santa Clara | Rua Estados Unidos, 217, Jd. Santa Clara do Lago II | (19) 3865-1133 |
| CRAS Novo Ângulo | Rua Francisco Bereta, 330, Jd. Novo Ângulo | (19) 3845-7629 |
| CRAS Jardim Brasil | Rua da Amizade, 240, Jd. Brasil | (19) 3909-1391 |
| CRAS Primavera | Rua da Amoreira, 35, Jd. Primavera (inaugurado mai/2023) | (19) 3909-2292 |

### CCS — Centro de Convivência Social (Jd. Rosolém)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Comunidade geral da área de abrangência
- **Vínculo CadÚnico:** Parcial
- **Nível de proteção:** Básica
- **Origem:** Municipal
- **Endereço:** Rua Guido Rosolen, 177, Jardim Rosolém
- **Observações:** Transformado de CRAS para CCS em 2021. Ampliou foco para atividades socioeducativas, cultura, arte, esporte e inclusão digital. Não substitui o CRAS para benefícios.

---

## Grupo 2 — Proteção Social Especial

### PAEFI — Serviço de Proteção e Atendimento Especializado a Famílias e Indivíduos
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** Famílias com violação de direitos, violência, situações de risco
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Média Complexidade
- **Origem:** Federal (SUAS)
- **Unidade executora:** CREAS — Rua Francisco Castilho, 298, Remanso Campineiro. Tel: (19) 3909-4546

### Serviço Especializado em Abordagem Social (Pop. Rua)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** População em situação de rua
- **Vínculo CadÚnico:** Sim (atualização cadastral como meta)
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Federal (Decreto 7.053/2009)
- **Unidade executora:** Centro POP

### Acolhimento Institucional / Casa de Passagem
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social
- **Público-alvo:** População em situação de rua, adultos e famílias
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade
- **Origem:** Municipal / parceria com Instituto Esperançar
- **Observações:** Abrigo Institucional operado pelo Instituto Esperançar. Casa de Passagem vinculada ao Centro POP.

---

## Grupo 3 — Programas Municipais Específicos

### Programa Cuidar
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Fundo Social de Solidariedade
- **Secretarias parceiras:** Inclusão e Desenvolvimento Social, Saúde, Secretaria de Governo
- **Público-alvo:** Gestantes a partir da 34ª semana de gestação que realizam pré-natal na rede municipal
- **Faixa etária:** Gestantes (todas as idades)
- **Vínculo CadÚnico:** Parcial (atendidas pelos CRAS)
- **Nível de proteção:** Básica / Intersetorial
- **Origem:** Municipal — lançado outubro/2022
- **Entregas acumuladas:** ~2.800 kits maternidade até abr/2024
- **Observações:** Kit contém banheira, mantas, fraldas, lenços, sabonete, creme, termômetro, bolsa, coletor de leite materno. Intersetorial com Saúde e Educação (EJA).

### Programa Ressignifica Hortolândia
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (Dep. Inclusão Produtiva e Geração de Renda)
- **Secretarias parceiras:** Governo, Habitação, Segurança Pública, Educação, Esportes, Saúde
- **Público-alvo:** Moradores em situação de rua
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Especial — Alta Complexidade / Intersetorial
- **Origem:** Municipal — lançado dezembro/2023. Regulamentado pelo Decreto Federal 7.053/2009
- **Benefício:** Bolsa mensal de R$ 700 + previsão de cesta básica e auxílio aluguel
- **Vagas iniciais:** 10 participantes
- **Requisitos:** Assiduidade em atendimentos de saúde + participação no ACERTE + oficinas de planejamento financeiro
- **Observações:** Bolsistas trabalham nos CRAS como auxiliares. Vinculado ao Centro POP, CREAS e Casa de Passagem.

### Bolsa Creche
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Público-alvo:** Crianças de 6 meses a 3 anos e 6 meses sem vaga na rede pública
- **Vínculo CadÚnico:** Sim
- **Nível de proteção:** Básica
- **Origem:** Municipal
- **Documentos:** Certidão de nascimento, comprovante de endereço, Cartão Cidadão, carteira de vacinação
- **Observações:** Garante vaga em creche conveniada quando não há disponibilidade na rede municipal.

---

## Grupo 4 — Segurança Alimentar

### Banco de Alimentos de Hortolândia (BAH)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia (Dep. Segurança Alimentar)
- **Público-alvo:** Pessoas em insegurança alimentar via 19 OSCs parceiras
- **Vínculo CadÚnico:** Indireto (via OSCs)
- **Nível de proteção:** Alimentar
- **Origem:** Municipal — criado em 2007 (17 anos em 2024)
- **Alcance:** 19 organizações sociais / 1.762 pessoas beneficiadas (2024)
- **Observações:** Parte do SISAN. Arrecada, seleciona, processa, armazena e distribui alimentos. Recebe produtos do PAA (agricultura familiar = 26% do volume).

### PAA — Programa de Aquisição de Alimentos
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia (Dep. Segurança Alimentar)
- **Público-alvo:** Agricultores familiares (fornecedores) + beneficiários do Banco de Alimentos
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Alimentar
- **Origem:** Federal
- **Observações:** Compra direta da agricultura familiar local. Alimenta o Banco de Alimentos com produtos frescos.

### Distribuição de Cestas Básicas
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social / Fundo Social de Solidariedade
- **Público-alvo:** Famílias em vulnerabilidade
- **Vínculo CadÚnico:** Sim (via CRAS)
- **Nível de proteção:** Básica / Alimentar
- **Origem:** Municipal
- **Observações:** Distribuição regular pelos CRAS e Fundo Social. Distribuição emergencial via entidades cadastradas no CMDCA para famílias fora dos critérios do SUAS.

### CREAN — Centro de Referência em Educação Alimentar e Nutricional
- **Tipo:** A — Serviço Direto (em implantação em 2023)
- **Secretaria responsável:** Educação, Ciência e Tecnologia
- **Público-alvo:** Estudantes da rede municipal e população geral
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Alimentar
- **Origem:** Municipal — anunciado abr/2023
- **Localização prevista:** Jd. Terras de Santa Maria
- **Observações:** Laboratório de técnica dietética, auditório, aulas de alimentação saudável e geração de renda.

### Cozinha Escola Comunitária
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Educação, Ciência e Tecnologia (Dep. Segurança Alimentar)
- **Público-alvo:** População geral, foco em geração de renda
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Alimentar / Produtiva
- **Origem:** Municipal
- **Localização:** Jardim Novo Ângulo
- **Observações:** Oficinas culinárias com foco em geração de renda. Parceria com SENAI para oficinas (ex: Petit Four).

---

## Grupo 5 — Habitação

### Agora a Casa é Sua
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação
- **Público-alvo:** Moradores de loteamentos irregulares
- **Vínculo CadÚnico:** Indireto (processo de cadastramento social próprio)
- **Nível de proteção:** Habitação
- **Origem:** Municipal + parceria estadual (Cidade Legal)
- **Alcance 2021–2024:** ~3.000 títulos entregues / meta 2024: 4.578 moradias iniciadas
- **Bairros atendidos:** Jd. Santa Fé, Boa Vista, São Sebastião, Jd. Novo Ângulo, Jd. Girassol, Orestes Ôngaro, Jd. Paulistinha, Lot. Adventista, Jd. Sumarezinho, Parque Perón, Jd. Primavera, Recanto do Sol (2024)
- **Observações:** Principal programa de regularização fundiária da história do município.

### Programa Vida Longa (Estadual)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Habitação (contrapartida municipal)
- **Público-alvo:** Idosos em situação de vulnerabilidade com vínculos familiares fragilizados, **inseridos no CadÚnico**, residentes há ≥ 2 anos no município
- **Vínculo CadÚnico:** Sim — critério explícito de elegibilidade
- **Nível de proteção:** Habitação / Idoso
- **Origem:** Estadual (Sec. Desenvolvimento Urbano e Habitação — SP)
- **Vagas Hortolândia:** 28 unidades habitacionais anunciadas abr/2024
- **Contrapartida municipal:** Indicação de beneficiários + doação de terrenos + gestão e manutenção

### PHLIS — Plano Municipal de Habitação de Interesse Social
- **Tipo:** B — Política Articuladora
- **Secretaria responsável:** Habitação
- **Origem:** Municipal + consultoria Demacamp
- **Observações:** Instrumento de planejamento habitacional para 10 anos. Em elaboração em 2024. Identifica núcleos vulneráveis. Não é programa de atendimento direto.

---

## Grupo 6 — Inserção Produtiva e Qualificação

### ACERTE — Ação Cidadã de Requalificação, Trabalho e Educação
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** A confirmar (mencionado como vinculado à Inclusão)
- **Público-alvo:** População em vulnerabilidade, incluindo egressos de programas sociais
- **Vínculo CadÚnico:** Sim (requisito do Programa Ressignifica)
- **Nível de proteção:** Produtiva
- **Origem:** Municipal
- **Observações:** Aparece como requisito obrigatório do Ressignifica Hortolândia. Cursos de capacitação profissional e empregabilidade.

### PAT — Posto de Atendimento ao Trabalhador
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Desenvolvimento Econômico, Trabalho, Turismo e Inovação
- **Público-alvo:** Desempregados em geral, incluindo PCD (vagas exclusivas)
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtiva
- **Origem:** Estadual / Municipal
- **Canais:** WhatsApp, SINE Fácil, Emprega Brasil
- **Observações:** Publica vagas regularmente. Em ago/2023: 40 vagas, sendo 6 exclusivas para PCD. Integra com Meu Emprego e Fundo Social.

### Programa Meu Emprego — Trabalho em Equipe
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Inclusão e Desenvolvimento Social (DIPGR)
- **Secretarias parceiras:** Desenvolvimento Econômico + PAT + ETEC
- **Público-alvo:** Jovens de 16 a 20 anos (1º emprego) + desempregados com +3 meses de inatividade + beneficiários do seguro-desemprego
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtiva
- **Origem:** Estadual + Municipal
- **Metodologia:** CSTEC (Canadian Skills Trade and Employment Congress) — grupos de troca de experiências
- **Parceiros:** Associação dos Patrulheiros e Guarda Mirim + ETEC Hortolândia
- **Observações:** 1ª turma: set/2023, 21 certificados. Novas turmas previstas.

### Fundo Social de Solidariedade — Cursos Profissionalizantes
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Secretaria de Governo
- **Público-alvo:** Pessoas a partir de 16 anos, foco em vulnerabilidade socioeconômica
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Produtiva
- **Origem:** Municipal
- **Cursos ofertados 2023:** Empreendedorismo, educação financeira, artesanato (patchwork/patch apliqué), auxiliar de RH, games, açougueiro, operador de logística, inspetor de qualidade (SENAI, 160h), IA em Nuvem
- **Cursos 2024:** Ferramentas da Qualidade (SENAI, 36h, 20 vagas)
- **Espaço:** "Capacita Hortolândia" — Rua Estados Unidos, 217, Jd. Santa Clara do Lago II
- **Observações:** ⚠️ Mesmo endereço do CRAS Santa Clara — verificar se são o mesmo espaço físico.

---

## Grupo 7 — Públicos Específicos / Direitos Humanos

*(Vinculados ao Departamento de Direitos Humanos — Secretaria de Governo)*

### Cadastro e Políticas para PCD
- **Tipo:** B — Política Articuladora
- **Secretaria responsável:** Governo (Dep. Direitos Humanos)
- **Público-alvo:** Pessoas com deficiência física, visual, auditiva, mental, motora, TEA, deficiências invisíveis
- **Vínculo CadÚnico:** Indireto (mapeamento próprio iniciado ago/2023)
- **Observações:** Cadastro municipal PCD iniciado ago/2023 (online e presencial). Objetivo: mapear quantidade e localização por bairro. Base para políticas específicas. Conselho Municipal da PCD (CMPD) biênio 2023-2025, 20 membros titulares.

### Políticas para Pessoa Idosa
- **Tipo:** B — Política Articuladora
- **Secretaria responsável:** Governo (Dep. Direitos Humanos)
- **Público-alvo:** Idosos, especialmente em vulnerabilidade
- **Vínculo CadÚnico:** Indireto
- **Marco legal:** Estatuto do Idoso — Lei 10.741/2003

### CCMI — Centro de Convivência da Melhor Idade (Remanso Campineiro)
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. Direitos Humanos)
- **Público-alvo:** Idosos 60+
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Básica / Direitos
- **Atividades:** Capoterapia, MVE (Movimento Vital Expressivo), Gincana da Melhor Idade (anual), bailes temáticos, teatro
- **Observações:** Cadastro próprio de idosos. Coordenação: psicóloga Fernanda Fadiga.

### Políticas para a Juventude
- **Tipo:** B — Política Articuladora
- **Secretaria responsável:** Governo (Dep. Direitos Humanos)
- **Público-alvo:** Jovens 15 a 29 anos
- **Vínculo CadÚnico:** Indireto
- **Programas vinculados:** Cursinho Popular (parceria Igualdade Racial + Educação), Jovem Empreendedor, Primeiro Emprego (parceria Patrulheiros + Sec. Desenvolvimento Econômico), Semana da Juventude

### Políticas de Igualdade Racial
- **Tipo:** B — Política Articuladora
- **Secretaria responsável:** Governo (Dep. Direitos Humanos)
- **Público-alvo:** População negra, indígena, comunidades tradicionais
- **Vínculo CadÚnico:** Indireto
- **Marco legal:** Estatuto da Igualdade Racial — Lei 12.288/2010
- **Observações:** FOMPIR — Fórum Municipal de Promoção da Igualdade Racial.

### CRAM — Centro de Referência de Atendimento à Mulher
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Governo (Dep. da Mulher)
- **Público-alvo:** Mulheres em situação de violência ou vulnerabilidade
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Especial
- **Observações:** Serviço multiprofissional. Mencionado na campanha Março Delas 2024.

### Ambulatório Trans
- **Tipo:** A — Serviço Direto
- **Secretaria responsável:** Saúde (Atenção Especializada)
- **Público-alvo:** População transexual (~4.500 pessoas estimadas no município)
- **Vínculo CadÚnico:** Indireto
- **Nível de proteção:** Saúde / Direitos
- **Localização:** Dentro do CEI — Av. Thereza Ana Cecon Breda, 1115, Vila São Pedro
- **Início:** Janeiro/2024. 20 pacientes acompanhados inicialmente.
- **Serviços:** Terapia hormonal, avaliação multidisciplinar (psiquiatria, psicologia, assistência social, enfermagem, infectologia, farmácia)

### Comitê Intersetorial de Políticas para a Primeira Infância
- **Tipo:** B — Política Articuladora
- **Secretaria responsável:** Educação, Ciência e Tecnologia (coordenação)
- **Público-alvo:** Crianças 0 a 6 anos
- **Vínculo CadÚnico:** Indireto
- **Origem:** Municipal — Decretos 5.353 (jan/2024) e 5.360 (fev/2024)
- **Composição:** 15 secretarias + Legislativo + OAB + 5 conselhos + Fundo Social
- **Observações:** Objetivo: elaborar Plano Municipal da Primeira Infância. Consultor: Oliver Lima.

---

## Grupo 8 — Governança e Conselhos

*(Não são programas de atendimento — são instâncias de governança)*

| Conselho / Fórum | Sigla | Vínculo |
|---|---|---|
| Conselho Municipal de Segurança Alimentar | COMSEA | Sec. Educação |
| Câmara Intersetorial de Seg. Alimentar e Nutricional | CAISAN | Intersetorial (criada jan/2024) |
| Conselho Municipal da Pessoa com Deficiência | CMPD | Sec. Governo / Dep. Direitos Humanos |
| Conselho Municipal dos Direitos da Criança e Adolescente | CMDCA | Sec. Governo |
| Conselho Municipal de Assistência Social | CMAS | Sec. Inclusão |
| Conselho Municipal do Idoso | CMI | Sec. Governo / Dep. Direitos Humanos |
| Conselho Municipal da Juventude | CMJ | Sec. Governo / Dep. Direitos Humanos |
| Fórum Municipal de Promoção da Igualdade Racial | FOMPIR | Sec. Governo / Dep. Direitos Humanos |
| Conselho Tutelar I | CT I | Sec. Governo / CMDCA |
| Conselho Tutelar II | CT II | Sec. Governo / CMDCA |

---

## Entidades parceiras (OSCs) identificadas

| Entidade | Foco |
|---|---|
| Instituto Esperançar | Abrigo Institucional (pop. rua) |
| AMAAH | Autismo |
| APAE | Deficiência intelectual |
| CADEFI / CENDEFI | Deficiência física |
| AHDV | Deficiência visual |
| Instituto Pernas Voluntárias | PCD |
| Todos Pelo Autismo | TEA |
| Luta pela Vida Hortolândia | PCD / boxe adaptado |
| Associação dos Patrulheiros e Guarda Mirim | Juventude |
| OSCs parceiras CRAS (12 entidades) | Projetos sociais crianças e adolescentes |

---

## Dado de contexto — Mercado formal (referência para indicadores)

- **Empregos formais no município:** 49.100 (CAGED/Caravela, jan–mar/2023)
- **Remuneração média formal:** R$ 4.700 (acima da média estadual de R$ 3.700)
- **Classes E e D:** 26,1% das remunerações totais
- **CadÚnico out/2022:** 29.698 famílias / 70.456 pessoas
- **CadÚnico dez/2025:** ~73.000 pessoas (e-book ver_01)
- **Populacao estimada:** ~240.000 habitantes

---

## Pendências e pontos a confirmar

1. **Espaço Capacita Hortolândia** — mesmo endereço do CRAS Santa Clara (Rua Estados Unidos, 217). Verificar se são o mesmo espaço físico ou apenas o mesmo logradouro.
2. **ACERTE** — confirmar secretaria responsável e se tem cadastro próprio ou usa o CadÚnico.
3. **DECOLA Juventude** — mencionado no e-book como programa de inserção produtiva de jovens. Não apareceu no material de 2023–2024. Verificar status atual.
4. **Programa Viva Mais** — atividades de bem-estar, massagem, liang gong. Confirmar secretaria e público-alvo formal.
5. **Cobertura territorial dos CRAS** — os cinco CRAS cobrem os 131 loteamentos? Há bairros sem cobertura? Lista a cruzar com o arquivo `loteamentosregiao.xls`.
6. **Conselho Tutelar x CRAS** — as listas de bairros dos CTs não coincidem com as áreas dos CRAS. Mapeamento territorial necessário.

---

## Próximos passos sugeridos

1. Salvar este arquivo no repositório GitHub como `dim_programa_v01.md`
2. Revisar e completar campos em branco (especialmente secretaria responsável do ACERTE)
3. Iniciar a modelagem formal da tabela `DIM_PROGRAMA` no SQLite com base nesta estrutura
4. Cruzar lista de loteamentos (`loteamentosregiao.xls`) com áreas de cobertura dos CRAS → gerar `DIM_TERRITORIO` preliminar
5. Verificar pendências listadas acima com a Secretaria de Inclusão

---

*Documento gerado a partir de levantamento documental. Sujeito a revisão e atualização.*

