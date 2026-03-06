# DIM_OSC — Organizações da Sociedade Civil
**Versão:** v01  
**Data:** 06/03/2026  
**Responsável:** Ailton Vendramini  
**Repositório:** Atlas Social de Hortolândia  

---

## 1. Descrição

Dimensão que cataloga as Organizações da Sociedade Civil (OSCs) identificadas no município de Hortolândia, com foco na sua relação potencial com a política socioassistencial municipal.

Esta dimensão distingue dois grandes grupos:

- **OSCs com vínculo formal** com a prefeitura (conveniadas ou parceiras) — integram a rede socioassistencial executora de serviços públicos
- **OSCs territoriais** — atuam no município sem vínculo formal, mas representam potencial de parceria, especialmente em territórios com déficit de cobertura pública

---

## 2. Fonte de Dados

| Fonte | Descrição | Data de extração |
|---|---|---|
| IPEA — Mapa das OSCs | Base federal de OSCs por município (código IBGE 3519071) | 06/03/2026 |
| Secretaria de Inclusão — PMH | Validação institucional dos vínculos formais | Pendente |
| CMAS — Hortolândia | Registro de entidades inscritas no conselho | Pendente |

**Arquivo de dados:** `dados/referencia/dim_osc_v03_hortolandia.xlsx`

---

## 3. Critério de Deduplicação

A base original do IPEA continha registros duplicados por dois motivos distintos:

1. **Duplicata real** — mesmo CNPJ + mesmo endereço → removida, mantida uma ocorrência
2. **Matriz + Filial** — mesmo CNPJ + endereços diferentes → **mantidas como registros distintos**, pois representam presença territorial real em locais diferentes

**Chave de deduplicação adotada:** `CNPJ + endereço_normalizado`

---

## 4. Estrutura da Tabela

| Campo | Tipo | Descrição |
|---|---|---|
| `id_osc` | texto | Identificador interno — padrão `OSC_NNNN` |
| `id_osc_mae` | texto | FK para a matriz quando o registro é filial. Vazio para matrizes |
| `cnpj` | texto | CNPJ oficial da organização |
| `nome` | texto | Razão social conforme Receita Federal |
| `nome_fantasia` | texto | Nome fantasia, quando disponível |
| `tipo` | texto | Classificação institucional — ver valores permitidos |
| `matriz_filial` | texto | Indica se o registro é Matriz, Filial ou Não Identificado |
| `dt_fundacao` | data | Data de fundação conforme IPEA/Receita Federal |
| `cnae` | texto | CNAE principal da organização |
| `area_atuacao_social` | texto | Área de atuação — ver valores permitidos |
| `potencial_relacao_assistencia` | texto | Nível de potencial de interface com assistência social |
| `nucleo_cras` | texto | Núcleo de CRAS mais próximo por proximidade geográfica |
| `regiao_cidade` | texto | Região da cidade derivada do núcleo de CRAS |
| `loteamento_referencia` | texto | Loteamento/bairro extraído do endereço |
| `dist_cras_km` | decimal | Distância em km até o CRAS mais próximo |
| `endereco` | texto | Endereço completo conforme IPEA |
| `longitude` | decimal | Coordenada geográfica |
| `latitude` | decimal | Coordenada geográfica |
| `registro_valido` | inteiro | 1 = registro válido na base IPEA; 0 = inválido |
| `vinculo_prefeitura` | texto | Tipo de vínculo com a Prefeitura — ver valores permitidos |
| `validacao_secretaria` | texto | Status de validação pela Secretaria de Inclusão |
| `fonte` | texto | Origem do registro |

---

## 5. Valores Permitidos

### `tipo`
| Valor | Descrição |
|---|---|
| `Igreja` | Organização religiosa |
| `Associacao` | Associação civil (natureza jurídica 3220) |
| `Fundacao` | Fundação privada (natureza jurídica 3069) |
| `Instituto` | Instituto sem fins lucrativos |
| `Outro` | Demais naturezas jurídicas |

### `area_atuacao_social`
| Valor | Descrição |
|---|---|
| `assistencia_social` | Atuação direta em assistência social |
| `educacao_infantil` | Educação infantil (creches, pré-escola) |
| `educacao_fundamental` | Ensino fundamental |
| `educacao_profissional` | Educação e capacitação profissional |
| `educacao_superior` | Ensino superior |
| `educacao_apoio` | Atividades de apoio à educação |
| `educacao_outras` | Outras formas de educação e ensino |
| `educacao_pesquisa` | Estudos e pesquisas educacionais |
| `educacao_multipla` | Mais de uma subárea de educação |
| `saude_comunitaria` | Saúde comunitária e serviços de saúde |
| `religiosa` | Atuação predominantemente religiosa |
| `comunitaria` | Associações comunitárias e de bairro |
| `multiplas` | Atuação em mais de uma área principal |
| `outra` | Área não classificada nas categorias acima |

### `potencial_relacao_assistencia`
| Valor | Critério de classificação |
|---|---|
| `ALTA` | CNAE 88xx (assistência social) ou 87xx (acolhimento/residências) ou `Area_Assistencia_social = 1` |
| `MEDIA` | CNAE 85xx (educação) ou `Area_Educacao = 1` ou `Area_Saude = 1` |
| `BAIXA` | Demais casos — inclui maioria das organizações religiosas e comunitárias |

### `vinculo_prefeitura`
| Valor | Descrição |
|---|---|
| `conveniada` | Possui termo de colaboração, fomento ou convênio ativo com a Prefeitura |
| `parceira` | Parceria informal ou pontual sem instrumento jurídico formal |
| `sem_vinculo` | Identificada no município, sem relação formal com a Prefeitura |
| `desconhecido` | Situação não confirmada — aguarda validação da Secretaria |

### `validacao_secretaria`
| Valor | Descrição |
|---|---|
| `confirmada` | Validada pela Secretaria de Inclusão |
| `nao_confirmada` | Verificada e sem correspondência na rede municipal |
| `avaliar` | Pendente de análise — estado inicial de todos os registros |

### `nucleo_cras`
| Valor | Endereço de referência |
|---|---|
| `Santa Clara` | Rua Estados Unidos, 217 |
| `Amanda` | Av. Tarsila do Amaral, 540 |
| `Novo Ângulo` | Rua Francisco Bereta, 330 |
| `Rosolém` | Rua Guido Rosolém, 177 |
| `Primavera` | Rua Amoreira, 35 |
| `Jardim Brasil` | Rua da Amizade, 240 |
| `Vila Real` | Rua Ernesto Bergamasco, 185 |
| `fora_hortolandia` | Coordenadas fora do bbox do município — requer verificação |
| `a_mapear` | Sem coordenadas disponíveis |

---

## 6. Decisões Metodológicas

**D01 — Exclusão de OSCs de cultura**  
OSCs com atuação exclusiva em cultura foram excluídas da base. Decisão: manter foco analítico na interface com a política socioassistencial. Cultura tem interface com política social, mas não substitui serviço socioassistencial.

**D02 — Subdivisão de educação**  
A categoria `educacao` foi subdividida em 8 subáreas com base nas colunas `SubArea_*` da base IPEA. Objetivo: permitir análise específica de déficit por tipo de serviço educacional no território.

**D03 — Proximidade geográfica para núcleo CRAS**  
O campo `nucleo_cras` foi calculado por distância euclidiana (fórmula de Haversine) entre as coordenadas da OSC e os endereços dos 7 CRAS confirmados. Não representa área de abrangência oficial — é aproximação territorial para análise.

**D04 — 30 OSCs fora de Hortolândia**  
30 registros apresentaram coordenadas fora do bbox do município. Podem ser filiais com CEP de outro município ou erro de geocodificação do IPEA. Marcados como `fora_hortolandia` para revisão.

**D05 — campo `situacao_cadastral` não utilizado**  
O campo original do IPEA apresentou apenas 1 registro como "Ativa" em 477 — claramente desatualizado. Substituído pelo campo `registro_valido` (1/0) como critério de qualidade.

---

## 7. Pendências

| # | Pendência | Responsável | Prazo |
|---|---|---|---|
| P01 | Validação da lista pela Secretaria de Inclusão — preencher `vinculo_prefeitura` | Ailton + Secretaria | A definir |
| P02 | Identificar OSCs registradas no CMAS não presentes na base IPEA | Ailton | Ciclo futuro |
| P03 | Verificar 30 OSCs marcadas como `fora_hortolandia` | Ailton | Ciclo futuro |
| P04 | Cruzar com planilha de convênios e termos de colaboração vigentes | Secretaria de Inclusão | A definir |
| P05 | Adicionar coluna `servico_executado` para OSCs conveniadas | Ailton + Secretaria | Após P01 |

---

## 8. Relacionamentos

```
DIM_OSC
  └── nucleo_cras → DIM_UNIDADES_DE_ATENDIMENTO (id_unidade do CRAS)
  └── loteamento_referencia → DIM_MUNICIPIO_REGIOES_LOTEAMENTOS (nome_loteamento)
  └── id_osc_mae → DIM_OSC (autorelacionamento matriz → filial)
```

---

## 9. Distribuição da Base (v03 — 06/03/2026)

| Indicador | Valor |
|---|---|
| Total de registros | 423 |
| No município de Hortolândia | 393 |
| Fora de Hortolândia (a verificar) | 30 |
| Matrizes | 264 |
| Filiais | 124 |
| ALTA potencial | 49 |
| MÉDIA potencial | 53 |
| BAIXA potencial | 321 |

---

*Documento de modelagem conceitual. Uso interno do projeto Atlas Social de Hortolândia.*

