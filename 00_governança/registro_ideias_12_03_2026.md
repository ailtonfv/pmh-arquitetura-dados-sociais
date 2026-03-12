# Registro de Ideias — "12/03/2026"

**Projeto:** Atlas Social de Hortolândia
**Repositório:** `ailtonfv/Atlas-Social-de-Hortolandia`
**Destino:** `00_governanca/`
**Fonte:** Ciclo jornalístico — Tribuna Liberal, edição 12/03/2026 (nº 9.698)

---

## Ideia 01 — Jardim Ricardo: padrão territorial de vulnerabilidade climática

**Origem:** Tribuna Liberal, p. 04 — "Força-tarefa começa para recuperar estragos das chuvas em Hortolândia"

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

**Origem:** Tribuna Liberal, p. 08 — "Assassino desce de carro e executa homem de 44 anos em Hortolândia"

**Registro:**
Júlio César Machado Silva, 44 anos, executado em 10/03/2026 na Rua 2, Jardim Nossa Senhora de Fátima, Hortolândia.

**Relevância para o projeto:**
Dado de contexto territorial. O projeto ainda não possui tabela de segurança pública. Não forçar encaixe em estrutura inexistente.

**Nota metodológica:**
Violência urbana é variável latente de vulnerabilidade territorial. Em metodologias como o IVS-H adaptado, poderia integrar dimensão de `capital_humano` ou `infraestrutura_urbana` como indicador auxiliar. Registrar para ciclo futuro quando houver fonte de dados estruturada (SSP/SP, Secretaria de Segurança Pública municipal).

**Destino atual:** apenas este registro. Sem arquivo definitivo ainda.

---

## Ideia 03 — Cooperuni: cooperativa de reciclagem em Hortolândia

**Origem:** Tribuna Liberal, p. 07 — Edital de convocação de Assembleia Geral Ordinária

**Registro:**
**Cooperuni** — Cooperativa de Trabalho, produtos, coleta, manuseio, processamento e comercialização de materiais reutilizáveis e recicláveis.

- **CNPJ:** 06.871.886/0001-25
- **Endereço:** Estrada Municipal de Hortolândia, 4183 — Bairro Sabina B. Camargo — CEP 13.185-576
- **Presidente:** Cleuza Grilanda Vicente
- **Assembleia Geral Ordinária:** 23/03/2026 às 15h

**Relevância para o projeto:**
Cooperativa **não mapeada** nas OSCs do projeto. Localização em Hortolândia confirmada. Possível interface com:
- Inserção produtiva de público CadÚnico (catadores, trabalhadores informais)
- Dimensão `renda_trabalho` do IVS-H
- Cadeia de economia solidária — alternativa ao emprego formal (complementa PAT/SINE/CAGED)

**Pendência:** confirmar vínculo com público CadÚnico e se está registrada no CMAS ou CMDCA.

**Destino:** `dim_osc_v01.md` — nova OSC a investigar.

---

*Atlas Social de Hortolândia — uso interno*
*Registro gerado em: 12/03/2026*
