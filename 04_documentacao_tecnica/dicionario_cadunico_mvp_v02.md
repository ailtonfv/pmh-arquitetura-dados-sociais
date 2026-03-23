[dicionario_cadunico_mvp_v02.md](https://github.com/user-attachments/files/26184554/dicionario_cadunico_mvp_v02.md)[Uploading dic# Dicionário CadÚnico — Variáveis MVP IVS-H
**Versão:** v02  
**Data:** "23/03/2026"  
**Pasta:** `04_documentacao_tecnica/`  
**Arquivo de referência:** `tudo.csv`  
**Versão do dado:** cadunico_v7_2025_12  
**Substitui:** dicionario_cadunico_mvp_v01.md

---

## 0. Campos de Controle

Este dicionário utiliza três campos de controle em todas as seções:

| Campo | Valores possíveis | Significado |
| --- | --- | --- |
| `status_validacao` | `Validado` | Campo testado em tudo.csv e confirmado para uso |
| | `Provisório` | Campo identificado mas não testado em dado real |
| | `Pendente` | Campo necessário em fase futura — não testado |
| | `Não utilizado` | Campo fora do escopo do projeto |
| `fonte_dicionario` | `MDS_oficial` | Definição do dicionário oficial do Ministério |
| | `Testado_tudo.csv` | Comportamento observado no arquivo real |
| | `Inferido` | Deduzido por análise de padrão |
| `observacoes_metodologicas` | texto livre | Limitações, riscos, decisões de implementação |

---

## 1. Estrutura do Arquivo tudo.csv

| Prefixo | Unidade | Descrição |
| --- | --- | --- |
| `d.` | Família/Domicílio | Uma linha por família |
| `p.` | Pessoa | Uma linha por pessoa membro da família |

> **JOIN obrigatório:** para cruzar dados de família com dados de pessoa,
> usar `d.cod_familiar_fam = p.cod_familiar_fam`.

---

## 2. Campos Utilizados no MVP — Fase 1 (5 variáveis IVS-H)

| campo | descricao | valores_possiveis | variavel_ivsh | status_validacao | fonte_dicionario | observacoes_metodologicas |
| --- | --- | --- | --- | --- | --- | --- |
| `d.vlr_renda_media_fam` | Valor da renda familiar per capita | — | RT_01, RT_04 | Validado | MDS_oficial | Renda autodeclarada — sujeita a subdeclaração. Limiar MVP: R$ 706,00 (1/2 SM dez/2025). Cruzar com d.fx_rfpc para validação. |
| `d.fx_rfpc` | Faixa da renda familiar per capita | 1-Ate R$89,00 / 2-Entre R$85,01 ate R$178,00 / 3-Entre R$178,01 ate 1/2 S.M. / 4-Acima de 1/2 S.M. | RT_01 | Validado | MDS_oficial | Validação cruzada de RT_01. Faixas 1, 2 e 3 = vulnerável. Faixa 4 = acima de 1/2 SM. Usar como check de consistência após cálculo por vlr_renda_media_fam. |
| `d.cod_familiar_fam` | Codigo familiar | — | Todas | Validado | MDS_oficial | Chave primária da família. Usar como denominador na contagem de famílias e como chave de JOIN com tabela de pessoas (p.cod_familiar_fam). |
| `p.cod_familiar_fam` | Codigo familiar | — | Todas | Validado | MDS_oficial | Chave de JOIN pessoa → família. Obrigatório em qualquer cálculo que cruze dados de domicílio com dados de pessoa. |
| `p.dta_nasc_pessoa` | Data de nascimento | — | RT_04, CH_05, CH_07 | Validado | Testado_tudo.csv | Formato DDMMAAAA — converter com pd.to_datetime(..., format="%d%m%Y", errors="coerce") antes de calcular idade. Valores nulos possíveis — tratar antes do cálculo. |
| `p.cod_parentesco_rf_pessoa` | Relacao de parentesco com o responsavel familiar | 1 - Pessoa Responsavel pela Unidade Familiar - RF / 2 - Conjuge ou companheiro(a) / 3 - Filho(a) / 4 - Enteado(a) / 5 - Neto(a) ou bisneto(a) / 6 - Pai ou mae / 7 - Sogro(a) / 8 - Irmao ou irma / 9 - Genro ou nora / 10 - Outro parente / 11 - Nao parente | RT_04, CH_05 | Validado | MDS_oficial | RF = 1 (responsável familiar). Filhos = 3. Dependentes = qualquer valor != 1. Essencial para CH_05 (RF feminino) e RT_04 (idoso como RF). |
| `p.cod_sexo_pessoa` | Sexo | 1 - Masculino / 2 - Feminino | CH_05 | Validado | MDS_oficial | Feminino = 2. Usar para identificar RF mulher em CH_05. Verificar ausência de valores nulos antes do filtro. |
| `p.grau_instrucao` | Grau de instrucao | 1 - Sem instrucao / 2 - Fundamental incompleto / 3 - Fundamental completo / 4 - Medio incompleto / 5 - Medio completo / 6 - Superior incompleto ou mais  | CH_05, CH_06, CH_07 | Validado | MDS_oficial | Campo direto de escolaridade — preferir sobre cod_curso_frequentou_pessoa_memb. Sem fund. completo = valores 1 ou 2. Fund. completo ou mais = valores >= 3. Verificar nulos. |
| `p.cod_sabe_ler_escrever_memb` | Pessoa sabe ler e escrever | 1 - Sim / 2 - Nao | CH_06 | Validado | MDS_oficial | Campo mais direto para CH_06. Analfabeto = 2. Sabe ler e escrever = 1. Aplicar apenas para pessoas com idade >= 15 anos (usar dta_nasc_pessoa). |
| `p.fx_idade` | Faixa etaria | 0-Entre 0 e 4  / 1-Entre 5 a 6  / 2-Entre 7 a 15  /  3-Entre 16 a 17  / 4-Entre 18 a 24  / 5-Entre 25 a 34  / 6-Entre 35 a 39  / 7-Entre 40 a 44  / 8-Entre 45 a 49  / 9-Entre 50 a 54  / 10-Entre 55 a 59  / 11-Entre 60 a 64  / 12- Maior que  65 | RT_04, CH_05, CH_06, CH_07 | Provisório | MDS_oficial | Alternativa a dta_nasc para filtros de faixa etária. Faixa 12 = 65+. Faixas 0-3 cobrem 0-17 anos. Limitação: faixas são intervalos — não permite cálculo de idade exata. |
| `d.nom_logradouro_fam` | Nome do logradouro | — | Territorial | Provisório | Testado_tudo.csv | Campo principal para vínculo endereço → loteamento. Cruzar com DIM_LOTEAMENTO. Risco: grafias inconsistentes (abreviaturas, acentuação). Pré-processamento de texto necessário. |
| `d.num_logradouro_fam` | Numero do logradouro | — | Territorial | Provisório | Testado_tudo.csv | Complementar ao logradouro. Usar em conjunto com nom_logradouro para desambiguação. |
| `d.num_cep_logradouro_fam` | CEP | — | Territorial | Provisório | Testado_tudo.csv | Alternativa de vínculo territorial por CEP. Cobertura incompleta — nem todas as famílias têm CEP preenchido. Avaliar taxa de preenchimento antes de usar como chave. |
| `d.nom_unidade_territorial_fam` | Nome da unidade territorial local | — | Territorial | Provisório | Testado_tudo.csv | Campo municipal preenchido pelo entrevistador. Pode conter nome do bairro ou loteamento. Alta inconsistência de grafia esperada. Avaliar taxa de preenchimento. |
| `d.cod_unidade_territorial_fam` | Codigo da unidade territorial local | — | Territorial | Provisório | Testado_tudo.csv | Código municipal da unidade territorial. Verificar se corresponde ao id_loteamento da DIM_LOTEAMENTO. Pode ser o vínculo mais direto se codificação for consistente. |
| `d.des_complemento_fam` | Complemento do numero | — | Territorial | Provisório | Testado_tudo.csv | Complemento do número. Usar como último recurso para desambiguação de endereço. |

---

## 3. Campos para Fases Futuras — Fase 2 e IPST-H

| campo | descricao | valores_possiveis | variavel_ivsh | status_validacao | fonte_dicionario | observacoes_metodologicas |
| --- | --- | --- | --- | --- | --- | --- |
| `p.ind_frequenta_escola_memb` | Pessoa frequenta escola | 1 - Sim, rede publica / 2 - Sim, rede particular / 3 - Nao, ja frequentou / 4 - Nunca frequentou | CH_02, CH_03 | Pendente | MDS_oficial | Fase 2. Frequência escolar: 1=rede pública, 2=rede particular, 3=não frequenta (já frequentou), 4=nunca frequentou. CH_02: crianças 0-5. CH_03: 6-14. |
| `p.ind_trabalho_infantil_pessoa` | Pessoa com marcacao de trabalho infantil | 1 - Sim / 2 - Nao | RT_05 | Pendente | MDS_oficial | Fase 2. Marcação direta de trabalho infantil: 1=Sim, 2=Não. Campo mais direto para RT_05. Cruzar com faixa 10-14 anos. |
| `p.cod_principal_trab_memb` | Funcao principal | 1 - Trabalhador por conta propria (bico, autonomo) / 2 - Trabalhador temporario em area rural / 3 - Empregado sem carteira de trabalho assinada / 4 - Empregado com carteira de trabalho assinada / 5 - Trabalhador domestico sem carteira de trabalho assinada / 6 - Trab. domestico com cart. de trab. assinada / 7 - Trabalhador nao-remunerado / 8 - Militar ou servidor publico / 9 - Empregador / 10 - Estagiario / 11 - Aprendiz | RT_03 | Pendente | MDS_oficial | Fase 2. Informalidade: valores 1, 3, 5, 7 = sem carteira ou informal. Valor 4 = com carteira (formal). Cruzar com grau_instrucao para RT_03. |
| `p.cod_trabalhou_memb` | Pessoa trabalhou na semana passada? | 1 - Sim / 2 - Nao | RT_02 | Pendente | MDS_oficial | Fase 2. Trabalhou na semana passada: 1=Sim, 2=Não. Base para taxa de desocupação RT_02. Complementar com cod_afastado_trab_memb. |
| `d.cod_abaste_agua_domic_fam` | Forma de abastecimento de agua | 1 - Rede geral de distribuicao / 2 - Poco ou nascente / 3 - Cisterna / 4 - Outra forma | IU_01 | Pendente | MDS_oficial | Fase 2. Abastecimento de água: 1=rede geral (adequado), 2=poço, 3=cisterna, 4=outra forma (inadequados). IU_01 numerador: valores 2, 3 ou 4. |
| `d.cod_escoa_sanitario_domic_fam` | Forma de escoamento sanitario | 1 - Rede coletora de esgoto ou pluvial / 2 - Fossa septica / 3 - Fossa rudimentar / 4 - Vala a ceu aberto / 5 - Direto para um rio, lago ou mar / 6 - Outra forma | IU_01 | Pendente | MDS_oficial | Fase 2. Esgotamento: 1=rede coletora (adequado), demais = inadequado. IU_01 considera água E esgoto inadequados — combinar com cod_abaste_agua_domic_fam. |
| `d.cod_destino_lixo_domic_fam` | Forma de coleta do lixo | 1 - E coletado diretamente / 2 - E coletado indiretamente / 3 - E queimado ou enterrado na propriedade / 4 - E jogado em terreno baldio ou logradouro (rua, avenida, etc.) / 5 - E jogado em rio ou mar / 6 - Tem outro destino | IU_02 | Pendente | MDS_oficial | Fase 2. Coleta de lixo: 1=coletado diretamente, 2=coletado indiretamente (adequados). Valores 3-6 = sem coleta (IU_02 numerador). |
| `d.ind_familia_quilombola_fam` | Familia quilombola   | 1 - Sim / 2 - Nao | Monitoramento | Pendente | MDS_oficial | Populações tradicionais — obrigatório catalogar independente de volume. 1=Sim, 2=Não. Município desconhecia existência de quilombolas até notificação IBGE. |
| `d.cod_familia_indigena_fam` | Familia Indigena | 1 - Sim / 2 - Nao | Monitoramento | Pendente | MDS_oficial | Populações tradicionais — obrigatório catalogar. 1=Sim, 2=Não. Mesma lógica de ind_familia_quilombola_fam. |
| `p.marc_sit_rua` | Situacao de Rua | 0 - Nao / 1 - Sim | IPST-H | Pendente | MDS_oficial | IPST-H — eixo Pressão Operacional. Situação de rua: 0=Não, 1=Sim. Não entra no IVS-H. |
| `d.ind_risco_scl_inseg_alim` | Familia em risco para inseguranca alimentar | 1 - Sim / 2 - Nao | IPST-H | Pendente | MDS_oficial | IPST-H — eixo Pressão Territorial. Risco insegurança alimentar: 1=Sim, 2=Não. Não entra no IVS-H. |
| `d.marc_pbf` | Recebe PBF familia | 0 - Nao / 1 - Sim | Monitoramento | Pendente | MDS_oficial | Beneficiário Bolsa Família a nível de família: 0=Não, 1=Sim. Monitoramento de cobertura — não entra diretamente no IVS-H. |

---

## 4. Campos Não Utilizados no Projeto

Total: 184 campos fora do escopo atual.
Listados para rastreabilidade — não requerem análise no MVP.

| campo | descricao | status_validacao | fonte_dicionario |
| --- | --- | --- | --- |
| `uf` | uf do municipio | Não utilizado | MDS_oficial |
| `cd_ibge` | codigo do ibge do municipio | Não utilizado | MDS_oficial |
| `d.dat_cadastramento_fam` | Data de cadastramento da familia | Não utilizado | MDS_oficial |
| `d.dat_atual_fam` | Data da ultima atualizacao da familia | Não utilizado | MDS_oficial |
| `d.cod_est_cadastral_fam` | Estado cadastral da familia | Não utilizado | MDS_oficial |
| `d.cod_forma_coleta_fam` | Forma de coleta | Não utilizado | MDS_oficial |
| `d.dta_entrevista_fam` | Data da entrevista | Não utilizado | MDS_oficial |
| `d.nom_localidade_fam` | Nome da localidade | Não utilizado | MDS_oficial |
| `d.nom_tip_logradouro_fam` | Tipo de logradouro | Não utilizado | MDS_oficial |
| `d.nom_titulo_logradouro_fam` | Titulo do logradouro | Não utilizado | MDS_oficial |
| `d.des_complemento_adic_fam` | Complemento adicional | Não utilizado | MDS_oficial |
| `d.txt_referencia_local_fam` | Referencia para localizacao do endereco | Não utilizado | MDS_oficial |
| `d.nom_entrevistador_fam` | Nome do entrevistador | Não utilizado | MDS_oficial |
| `d.num_cpf_entrevistador_fam` | CPF do entrevistador | Não utilizado | MDS_oficial |
| `d.vlr_renda_total_fam` | Valor da renda total da familia | Não utilizado | MDS_oficial |
| `d.qtde_meses_desat_cat` | Numero de meses apos a ultima atualizacao cadastral | Não utilizado | MDS_oficial |
| `d.cod_local_domic_fam` | Situacao do domicilio | Não utilizado | MDS_oficial |
| `d.cod_especie_domic_fam` | Especie do domicilio | Não utilizado | MDS_oficial |
| `d.qtd_comodos_domic_fam` | Quantidade de comodos do domicilio | Não utilizado | MDS_oficial |
| `d.qtd_comodos_dormitorio_fam` | Comodo servindo como dormitorio do domicilio | Não utilizado | MDS_oficial |
| `d.cod_material_piso_fam` | Material predominante no piso do domicilio | Não utilizado | MDS_oficial |
| `d.cod_material_domic_fam` | Material predominante nas paredes externas do domicilio | Não utilizado | MDS_oficial |
| `d.cod_agua_canalizada_fam` | Água canalizada no domicilio | Não utilizado | MDS_oficial |
| `d.cod_banheiro_domic_fam` | Existencia de banheiro | Não utilizado | MDS_oficial |
| `d.cod_iluminacao_domic_fam` | Tipo de iluminacao | Não utilizado | MDS_oficial |
| `d.cod_calcamento_domic_fam` | Calcamento em frente ao seu domicilio | Não utilizado | MDS_oficial |
| `d.cod_povo_indigena_fam` | Codigo de povo indigena | Não utilizado | MDS_oficial |
| `d.nom_povo_indigena_fam` | Nome do povo indigena | Não utilizado | MDS_oficial |
| `d.cod_indigena_reside_fam` | Reside em reserva indigena | Não utilizado | MDS_oficial |
| `d.cod_reserva_indigena_fam` | Codigo da reserva indigena | Não utilizado | MDS_oficial |
| `d.nom_reserva_indigena_fam` | Nome da reserva indigena | Não utilizado | MDS_oficial |
| `d.cod_comunidade_quilombola_fam` | Codigo da comunidade quilombola | Não utilizado | MDS_oficial |
| `d.nom_comunidade_quilombola_fam` | Nome da comunidade quilombola | Não utilizado | MDS_oficial |
| `d.qtd_pessoas_domic_fam` | Quantidade de pessoas no domicilio | Não utilizado | MDS_oficial |
| `d.qtd_familias_domic_fam` | Quantidade de familias no domicilio | Não utilizado | MDS_oficial |
| `d.qtd_pessoa_inter_0_17_anos_fam` | Quantidade de pessoas internadas faixa 0-17 anos | Não utilizado | MDS_oficial |
| `d.qtd_pessoa_inter_18_64_anos_fam` | Quantidade de pessoas internadas faixa 18-59 anos | Não utilizado | MDS_oficial |
| `d.qtd_pessoa_inter_65_anos_fam` | Quantidade de pessoas internadas faixa 60 anos ou mais | Não utilizado | MDS_oficial |
| `d.val_desp_energia_fam` | Valor de despesas com energia | Não utilizado | MDS_oficial |
| `d.val_desp_agua_esgoto_fam` | Valor de despesas com agua | Não utilizado | MDS_oficial |
| `d.val_desp_gas_fam` | Valor de despesas com gas | Não utilizado | MDS_oficial |
| `d.val_desp_alimentacao_fam` | Valor de despesas com alimentacao | Não utilizado | MDS_oficial |
| `d.val_desp_transpor_fam` | Valor de despesas com transporte | Não utilizado | MDS_oficial |
| `d.val_desp_aluguel_fam` | Valor de despesas com aluguel | Não utilizado | MDS_oficial |
| `d.val_desp_medicamentos_fam` | Valor de despesas com medicamentos | Não utilizado | MDS_oficial |
| `d.nom_estab_assist_saude_fam` | Nome do estabelecimento EAS/MS | Não utilizado | MDS_oficial |
| `d.cod_eas_fam` | Codigo do estabelecimento EAS/MS | Não utilizado | MDS_oficial |
| `d.nom_centro_assist_fam` | Nome do CRAS/CREAS | Não utilizado | MDS_oficial |
| `d.cod_centro_assist_fam` | Codigo do CRAS/CREAS | Não utilizado | MDS_oficial |
| `d.ind_risco_scl_vlco_drts` | Familia identificada em situacao de risco social associado a violacao de direitos | Não utilizado | MDS_oficial |
| `d.num_ddd_contato_1_fam` | DDD do telefone primario | Não utilizado | MDS_oficial |
| `d.num_tel_contato_1_fam` | Numero do telefone primario | Não utilizado | MDS_oficial |
| `d.ic_tipo_contato_1_fam` | Tipo do telefone primario | Não utilizado | MDS_oficial |
| `d.ic_envo_sms_contato_1_fam` | Autoriza envio de mensagem para telefone primario | Não utilizado | MDS_oficial |
| `d.num_tel_contato_2_fam` | Numero do telefone secundario | Não utilizado | MDS_oficial |
| `d.num_ddd_contato_2_fam` | DDD do telefone secundario | Não utilizado | MDS_oficial |
| `d.ic_tipo_contato_2_fam` | Tipo do telefone secundario | Não utilizado | MDS_oficial |
| `d.ic_envo_sms_contato_2_fam` | Autoriza envio de mensagem para telefone secundario | Não utilizado | MDS_oficial |
| `d.cod_cta_energ_unid_consum_fam` | Codigo da unidade consumidora associado a conta de energia eletrica do domicilio. | Não utilizado | MDS_oficial |
| `d.ind_parc_mds_fam` | Grupos Populacionais Tradicionais e Especificos | Não utilizado | MDS_oficial |
| `d.ref_cad` | Referencia Cadastro Unico | Não utilizado | MDS_oficial |
| `d.ref_pbf` | Referencia Programa Bolsa Familia | Não utilizado | MDS_oficial |
| `p.cod_est_cadastral_memb` | Estado cadastral da pessoa | Não utilizado | MDS_oficial |
| `p.nom_pessoa` | Nome | Não utilizado | MDS_oficial |
| `p.num_nis_pessoa_atual` | NIS | Não utilizado | MDS_oficial |
| `p.nom_apelido_pessoa` | Apelido/Nome Social | Não utilizado | MDS_oficial |
| `p.cod_raca_cor_pessoa` | Cor ou raca | Não utilizado | MDS_oficial |
| `p.nom_completo_mae_pessoa` | Nome da mae  | Não utilizado | MDS_oficial |
| `p.nom_completo_pai_pessoa` | Nome do pai | Não utilizado | MDS_oficial |
| `p.cod_local_nascimento_pessoa` | Local de nascimento | Não utilizado | MDS_oficial |
| `p.sig_uf_munic_nasc_pessoa` | UF de nascimento da pessoa | Não utilizado | MDS_oficial |
| `p.nom_ibge_munic_nasc_pessoa` | Nome do municipio de nascimento da pessoa | Não utilizado | MDS_oficial |
| `p.cod_ibge_munic_nasc_pessoa` | Codigo ibge do municipio de nascimento da pessoa | Não utilizado | MDS_oficial |
| `p.nom_pais_origem_pessoa` | Nome do pais de nascimento da pessoa | Não utilizado | MDS_oficial |
| `p.cod_pais_origem_pessoa` | Codigo do pais de nascimento da pessoa, no formato nn | Não utilizado | MDS_oficial |
| `p.cod_certidao_registrada_pessoa` | Nascimento registrado em Cartorio | Não utilizado | MDS_oficial |
| `p.marc_pbf` | Recebe PBF pessoa | Não utilizado | MDS_oficial |
| `p.ind_identidade_genero` | Pessoa deseja informar o genero? | Não utilizado | MDS_oficial |
| `p.ind_transgenero` | E pessoa trans ou travesti? | Não utilizado | MDS_oficial |
| `p.ind_tipo_identidade_genero` | Genero/identidade de genero da pessoa | Não utilizado | MDS_oficial |
| `p.cod_certidao_civil_pessoa` | Tipo de certidao | Não utilizado | MDS_oficial |
| `p.cod_livro_termo_certid_pessoa` | Numero do livro | Não utilizado | MDS_oficial |
| `p.cod_folha_termo_certid_pessoa` | Numero da folha | Não utilizado | MDS_oficial |
| `p.cod_termo_matricula_certid_pessoa` | Numero do termo | Não utilizado | MDS_oficial |
| `p.nom_munic_certid_pessoa` | Municipio do registro | Não utilizado | MDS_oficial |
| `p.cod_ibge_munic_certid_pessoa` | Codigo IBGE do municipio do registro | Não utilizado | MDS_oficial |
| `p.cod_cartorio_certid_pessoa` | Codigo do cartorio do registro | Não utilizado | MDS_oficial |
| `p.num_cpf_pessoa` | CPF da pessoa | Não utilizado | MDS_oficial |
| `p.num_identidade_pessoa` | Numero do RG | Não utilizado | MDS_oficial |
| `p.cod_complemento_pessoa` | Complemento do numero do RG | Não utilizado | MDS_oficial |
| `p.dta_emissao_ident_pessoa` | Data de emissao do RG (formato DDMMAAAA) | Não utilizado | MDS_oficial |
| `p.sig_uf_ident_pessoa` | Estado emissor do RG | Não utilizado | MDS_oficial |
| `p.sig_orgao_emissor_pessoa` | Sigla do orgao emissor do RG | Não utilizado | MDS_oficial |
| `p.num_cart_trab_prev_soc_pessoa` | Numero da CTPS | Não utilizado | MDS_oficial |
| `p.num_serie_trab_prev_soc_pessoa` | Serie da CTPS | Não utilizado | MDS_oficial |
| `p.dta_emissao_cart_trab_pessoa` | Data de emissao da CTPS (formato DDMMAAAA) | Não utilizado | MDS_oficial |
| `p.sig_uf_cart_trab_pessoa` | Estado emissor da CTPS | Não utilizado | MDS_oficial |
| `p.num_titulo_eleitor_pessoa` | Numero do Titulo de Eleitor | Não utilizado | MDS_oficial |
| `p.num_zona_tit_eleitor_pessoa` | Zona do Titulo de Eleitor | Não utilizado | MDS_oficial |
| `p.num_secao_tit_eleitor_pessoa` | Secao do Titulo de Eleitor | Não utilizado | MDS_oficial |
| `p.cod_deficiencia_memb` | Pessoa tem deficiencia? | Não utilizado | MDS_oficial |
| `p.ind_def_cegueira_memb` | Cegueira | Não utilizado | MDS_oficial |
| `p.ind_def_baixa_visao_memb` | Baixa visao | Não utilizado | MDS_oficial |
| `p.ind_def_surdez_profunda_memb` | Surdez severa/profunda | Não utilizado | MDS_oficial |
| `p.ind_def_surdez_leve_memb` | Surdez leve/moderada | Não utilizado | MDS_oficial |
| `p.ind_def_fisica_memb` | Deficiencia fisica | Não utilizado | MDS_oficial |
| `p.ind_def_mental_memb` | Deficiencia mental ou intelectual | Não utilizado | MDS_oficial |
| `p.ind_def_sindrome_down_memb` | Sindrome de Down | Não utilizado | MDS_oficial |
| `p.ind_def_transtorno_mental_memb` | Transtorno/doenca mental | Não utilizado | MDS_oficial |
| `p.ind_ajuda_nao_memb` | Nao recebe ajuda de terceiros | Não utilizado | MDS_oficial |
| `p.ind_ajuda_familia_memb` | Recebe ajuda de alguem da familia | Não utilizado | MDS_oficial |
| `p.ind_ajuda_especializado_memb` | Recebe ajuda de cuidador especializado | Não utilizado | MDS_oficial |
| `p.ind_ajuda_vizinho_memb` | Recebe ajuda de vizinho | Não utilizado | MDS_oficial |
| `p.ind_ajuda_instituicao_memb` | Recebe ajuda de instituicao | Não utilizado | MDS_oficial |
| `p.ind_ajuda_outra_memb` | Recebe ajuda de outra forma | Não utilizado | MDS_oficial |
| `p.nom_escola_memb` | Nome da escola da pessoa | Não utilizado | MDS_oficial |
| `p.cod_escola_local_memb` | Escola localizada no municipio | Não utilizado | MDS_oficial |
| `p.sig_uf_escola_memb` | UF da escola da pessoa | Não utilizado | MDS_oficial |
| `p.nom_munic_escola_memb` | Nome do municipio da escola da pessoa | Não utilizado | MDS_oficial |
| `p.cod_ibge_munic_escola_memb` | Codigo do ibge do municipio da escola da pessoa | Não utilizado | MDS_oficial |
| `p.cod_censo_inep_memb` | Codigo INEP da escola da pessoa | Não utilizado | MDS_oficial |
| `p.cod_curso_frequenta_memb` | Curso que a pessoa frequenta | Não utilizado | MDS_oficial |
| `p.cod_ano_serie_frequenta_memb` | Ano e serie do curso que a pessoa frequenta | Não utilizado | MDS_oficial |
| `p.cod_curso_frequentou_pessoa_memb` | Curso mais elevado que a pessoa frequentou | Não utilizado | MDS_oficial |
| `p.cod_ano_serie_frequentou_memb` | Ultimo ano e serie do curso que a pessoa frequentou | Não utilizado | MDS_oficial |
| `p.cod_concluiu_frequentou_memb` | A pessoa concluiu o curso? | Não utilizado | MDS_oficial |
| `p.cod_afastado_trab_memb` | Pessoa estava afastada na semana passada? | Não utilizado | MDS_oficial |
| `p.cod_agricultura_trab_memb` | Atividade extrativista | Não utilizado | MDS_oficial |
| `p.cod_trabalho_12_meses_memb` | Trabalho remunerado nos ultimos 12 meses | Não utilizado | MDS_oficial |
| `p.qtd_meses_12_meses_memb` | Quantidade de meses trabalhados nos ultimos 12 meses | Não utilizado | MDS_oficial |
| `p.fx_renda_individual_805` | Faixa do Valor de remuneracao do mes passado do trabalho principal | Não utilizado | MDS_oficial |
| `p.fx_renda_individual_808` | Faixa da Remuneracao bruta de todos os trabalhos nos ultimos 12 meses | Não utilizado | MDS_oficial |
| `p.fx_renda_individual_809_1` | Faixa do Valor recebido de doacao | Não utilizado | MDS_oficial |
| `p.fx_renda_individual_809_2` | Faixa do Valor recebido de aposentadoria | Não utilizado | MDS_oficial |
| `p.fx_renda_individual_809_3` | Faixa do Valor recebido de seguro desemprego | Não utilizado | MDS_oficial |
| `p.fx_renda_individual_809_4` | Faixa do Valor recebido de pensao alimenticia | Não utilizado | MDS_oficial |
| `p.fx_renda_individual_809_5` | Faixa do Valor recebido de outras fontes | Não utilizado | MDS_oficial |
| `p.ind_dormir_rua_memb` | Dorme na rua  | Não utilizado | MDS_oficial |
| `p.qtd_dormir_freq_rua_memb` | Quantidade de vezes por semana que dorme na rua  | Não utilizado | MDS_oficial |
| `p.ind_dormir_albergue_memb` | Dorme em albergue  | Não utilizado | MDS_oficial |
| `p.qtd_dormir_freq_albergue_memb` | Quantidade de vezes por semana que dorme em albergue  | Não utilizado | MDS_oficial |
| `p.ind_dormir_dom_part_memb` | Dorme em domicilio particular | Não utilizado | MDS_oficial |
| `p.qtd_dormir_freq_dom_part_memb` | Quantidade de vezes por semana que dorme em domicilio particular | Não utilizado | MDS_oficial |
| `p.ind_outro_memb` | Dorme de outra forma | Não utilizado | MDS_oficial |
| `p.qtd_freq_outro_memb` | Quantidade de vezes por semana que dorme de outra forma | Não utilizado | MDS_oficial |
| `p.cod_tempo_rua_memb` | Tempo em que vive na rua | Não utilizado | MDS_oficial |
| `p.ind_motivo_perda_memb` | Motivo da condicao de rua por perda de moradia  | Não utilizado | MDS_oficial |
| `p.ind_motivo_ameaca_memb` | Motivo da condicao de rua por ameaca  | Não utilizado | MDS_oficial |
| `p.ind_motivo_probs_fam_memb` | Motivo da condicao de rua por problemas familiares | Não utilizado | MDS_oficial |
| `p.ind_motivo_alcool_memb` | Motivo da condicao de rua por alcoolismo  | Não utilizado | MDS_oficial |
| `p.ind_motivo_desemprego_memb` | Motivo da condicao de rua por desemprego  | Não utilizado | MDS_oficial |
| `p.ind_motivo_trabalho_memb` | Motivo da condicao de rua por trabalho  | Não utilizado | MDS_oficial |
| `p.ind_motivo_saude_memb` | Motivo da condicao de rua por tratamento de saude  | Não utilizado | MDS_oficial |
| `p.ind_motivo_pref_memb` | Motivo da condicao de rua por preferencia  | Não utilizado | MDS_oficial |
| `p.ind_motivo_outro_memb` | Motivo da condicao de rua por outro motivo | Não utilizado | MDS_oficial |
| `p.ind_motivo_nao_sabe_memb` | Nao sabe/nao lembra o motivo da condicao de rua  | Não utilizado | MDS_oficial |
| `p.ind_motivo_nao_resp_memb` | Nao respondeu o motivo da condicao de rua | Não utilizado | MDS_oficial |
| `p.cod_tempo_cidade_memb` | Tempo em que mora na cidade | Não utilizado | MDS_oficial |
| `p.cod_vive_fam_rua_memb` | Vive com sua familia na rua | Não utilizado | MDS_oficial |
| `p.cod_contato_parente_memb` | Tem contato com parente fora da condicao de rua  | Não utilizado | MDS_oficial |
| `p.ind_ativ_com_escola_memb` | Atividade comunitaria em escola | Não utilizado | MDS_oficial |
| `p.ind_ativ_com_coop_memb` | Atividade comunitaria em cooperativa | Não utilizado | MDS_oficial |
| `p.ind_ativ_com_mov_soc_memb` | Atividade comunitaria em movimento social  | Não utilizado | MDS_oficial |
| `p.ind_ativ_com_nao_sabe_memb` | Nao sabe se frequentou atividade comunitaria | Não utilizado | MDS_oficial |
| `p.ind_ativ_com_nao_resp_memb` | Nao respondeu se frequentou atividade comunitaria | Não utilizado | MDS_oficial |
| `p.ind_atend_cras_memb` | Atendido por cras  | Não utilizado | MDS_oficial |
| `p.ind_atend_creas_memb` | Atendido por creas  | Não utilizado | MDS_oficial |
| `p.ind_atend_centro_ref_rua_memb` | Atendido por centro ref pop rua | Não utilizado | MDS_oficial |
| `p.ind_atend_inst_gov_memb` | Atendido por instituicao governamental | Não utilizado | MDS_oficial |
| `p.ind_atend_inst_nao_gov_memb` | Atendido por instituicao nao-governamental  | Não utilizado | MDS_oficial |
| `p.ind_atend_hospital_geral_memb` | Atendido por hospital/clinica geral | Não utilizado | MDS_oficial |
| `p.cod_cart_assinada_memb` | Teve emprego com carteira assinada? | Não utilizado | MDS_oficial |
| `p.ind_dinh_const_memb` | Ganha dinheiro com construcao civil  | Não utilizado | MDS_oficial |
| `p.ind_dinh_flanelhinha_memb` | Ganha dinheiro como guardador de carro | Não utilizado | MDS_oficial |
| `p.ind_dinh_carregador_memb` | Ganha dinheiro como carregador | Não utilizado | MDS_oficial |
| `p.ind_dinh_catador_memb` | Ganha dinheiro como catador | Não utilizado | MDS_oficial |
| `p.ind_dinh_servs_gerais_memb` | Ganha dinheiro com servicos gerais  | Não utilizado | MDS_oficial |
| `p.ind_dinh_pede_memb` | Ganha dinheiro como pedinte | Não utilizado | MDS_oficial |
| `p.ind_dinh_vendas_memb` | Ganha dinheiro com vendas | Não utilizado | MDS_oficial |
| `p.ind_dinh_outro_memb` | Ganha dinheiro de outra forma  | Não utilizado | MDS_oficial |
| `p.ind_dinh_nao_resp_memb` | Nao respondeu como ganha dinheiro  | Não utilizado | MDS_oficial |
| `p.ind_atend_nenhum_memb` | Nao foi atendido por nenhum local | Não utilizado | MDS_oficial |
| `p.ref_cad` | Referencia Cadastro Unico | Não utilizado | MDS_oficial |
| `p.ref_pbf` | Referencia Programa Bolsa Familia | Não utilizado | MDS_oficial |

---

## 5. Avisos de Implementação

**⚠️ Separador do arquivo:** ponto e vírgula (`;`)
```python
df = pd.read_csv('/tmp/cecad/tudo.csv', sep=';', encoding='utf-8')
```

**⚠️ Datas:** formato `DDMMAAAA`
```python
df['dta_nasc_pessoa'] = pd.to_datetime(
    df['p.dta_nasc_pessoa'], format='%d%m%Y', errors='coerce'
)
```

**⚠️ Risco de schema:** dicionário válido para `cadunico_v7_2025_12`.
Verificar versão antes de cada nova carga.

**⚠️ Nulos:** campos `p.grau_instrucao`, `p.cod_sabe_ler_escrever_memb`
e `p.dta_nasc_pessoa` podem ter valores ausentes — tratar antes de calcular.

**⚠️ Fronteira IVS-H × IPST-H:** campos marcados como `IPST-H` em
`variavel_ivsh` não devem ser inseridos em `fato_variavel_ivs_loteamento`.
Pertencem à modelagem do IPST-H.

---

## 6. Log de Alterações

| Versão | Data | Alterações |
| --- | --- | --- |
| v01 | "23/03/2026" | Criação — 5 variáveis MVP com colunas exatas, fórmulas Python, campos de endereço, Seção 8 de avisos |
| v02 | "23/03/2026" | Reestruturação completa: três campos de controle adicionados (status_validacao, fonte_dicionario, observacoes_metodologicas). Seções separadas por fase. Campos não utilizados catalogados em bloco. Fórmulas Python movidas para os notebooks — dicionário agora é referência de campos, não de código. |

---

*Atlas Social de Hortolândia — Documento Técnico*  
*"O campo certo, no notebook certo, no momento certo."*
ionario_cadunico_mvp_v02.md…]()
