# 📐 Padrão de Nomenclatura do Projeto Atlas Social de Hortolândia

**Versão:** v01  
**Data:** 20/04/2026  
**Responsável:** Ailton Vendramini  

---

## 🎯 Finalidade

Estabelecer regras simples e consistentes para nomeação de arquivos, pastas, colunas e notebooks, garantindo:

- padronização do projeto
- facilidade de leitura e manutenção
- interoperabilidade entre bases
- redução de erros operacionais

---

## 🗂️ 1. Estrutura de Diretórios (Dados)

As camadas de dados devem seguir o padrão:

```text
dados/
 └── <fonte_dados>/
      ├── 01_bruto/
      ├── 02_limpo/
      ├── 03_curado/
      └── 04_exportacao/
