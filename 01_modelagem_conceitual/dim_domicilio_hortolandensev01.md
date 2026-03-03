# DIM_DOMICILIO — Domicílio como Entidade Analítica
**Versão:** 01
**Data de criação:** 03/03/2026
**Responsável:** Ailton Vendramini / Claude (Anthropic)
**Repositório:** Projeto CadÚnico — Hortolândia

---

## Objetivo

Registrar o domicílio como entidade analítica independente de família,
reconhecendo que um mesmo endereço pode abrigar múltiplas famílias —
situação frequente em contextos de vulnerabilidade social.

**Princípio estruturante:**
Domicílio não é família. Família não é pessoa.
Cada entidade tem identidade, atributos e relacionamentos próprios.

---

## Posição na cadeia relacional do projeto
```
DIM_LOTEAMENTO
      ↓
DIM_DOMICILIO
      ↓
DIM_FAMILIA
      ↓
DIM_PESSOA
```

Um loteamento contém vários domicílios.
Um domicílio pode abrigar várias famílias.
Uma família é composta por várias pessoas.

---

## Por que DIM_DOMICILIO é necessária

No contexto da população vulnerável de Hortolândia:

- Famílias em situação de rua compartilham abrigos temporários
- Famílias extensas coabitam o mesmo endereço por necessidade econômica
- O CadÚnico registra famílias — não domicílios
- Sem DIM_DOMICILIO, o modelo confunde endereço com família
- A análise de densidade habitacional por território fica impossível

**Exemplo concreto:**
Um imóvel no Jardim Amanda pode ter:
- Família A — titular do CadÚnico
- Família B — parente agregado
- Família C — inquilino informal

Sem DIM_DOMICILIO, são três registros sem conexão.
Com DIM_DOMICILIO, são três famílias em um mesmo endereço —
dado analítico completamente diferente.

---

## Estrutura da DIM_DOMICILIO
```
id_domicilio         (chave surrogate)
id_loteamento        (FK → DIM_LOTEAMENTO)
logradouro
numero
complemento
cep
tipo_domicilio       (Casa | Apartamento | Cômodo | 
                      Improvisado | Abrigo | Rua | Outro)
situacao_posse       (Próprio quitado | Próprio financiado | 
                      Alugado | Cedido | Invasão | Outro)
material_parede      (Alvenaria | Madeira | Taipa | 
                      Improvisado | Outro)
abastecimento_agua   (Rede pública | Poço | Outro | Sem acesso)
esgotamento          (Rede pública | Fossa | Céu aberto | Outro)
energia_eletrica     (Rede oficial | Informal | Sem acesso)
ativo                (S/N)
data_cadastro
data_atualizacao
observacoes
```

---

## Relação DIM_DOMICILIO → DIM_FAMILIA
```
DIM_FAMILIA
---
id_familia
id_domicilio         (FK → DIM_DOMICILIO)
...demais atributos
```

Um domicílio pode ter várias famílias — relação 1:N.

---

## Alinhamento com o CadÚnico

O CadÚnico V7 registra atributos do domicílio dentro do
cadastro familiar. A DIM_DOMICILIO extrai e normaliza
esses atributos como entidade própria, permitindo:

- Análise de condições habitacionais por território
- Identificação de coabitação
- Cruzamento com dados do cadastro imobiliário (IPTU)
- Subsidiar o PHLIS — Plano Municipal de Habitação

---

## Indicadores que esta dimensão viabiliza

| Indicador | Descrição |
|-----------|-----------|
| Densidade habitacional | Média de famílias por domicílio por território |
| Precariedade habitacional | % domicílios improvisados ou sem saneamento |
| Coabitação | % domicílios com mais de uma família |
| Cobertura de regularização | % domicílios em áreas de regularização fundiária |

---

## Pendências

1. Verificar campos disponíveis no CadÚnico V7 para
   alimentar esta dimensão
2. Avaliar integração futura com cadastro imobiliário (IPTU)
3. Definir chave de deduplicação de domicílios
   (logradouro + número + complemento + CEP)
4. Confirmar tratamento para domicílios sem endereço formal
   (pop. em situação de rua)

---

## Log de alterações

| Versão | Data | Alterações |
|--------|------|-----------|
| v01 | 03/03/2026 | Criação da dimensão |

---

*Documento de registro interno. Uso restrito ao projeto.*
