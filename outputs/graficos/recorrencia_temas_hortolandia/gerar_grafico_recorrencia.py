"""Gera gráfico institucional da recorrência temática no corpus jornalístico.

O script usa exclusivamente a tabela temática aprovada na auditoria dos
registros atribuídos a Hortolândia. Não lê nem altera os CSVs de origem e não
sobrescreve o consolidado oficial.
"""

from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd


PASTA_SAIDA = Path(__file__).resolve().parent
ARQUIVO_CSV = PASTA_SAIDA / "tabela_base_recorrencia_temas_hortolandia.csv"
ARQUIVO_PNG = PASTA_SAIDA / "recorrencia_temas_hortolandia.png"
ARQUIVO_PDF = PASTA_SAIDA / "recorrencia_temas_hortolandia.pdf"

UNIVERSO_HORTOLANDIA = 657
SEM_TEMA_PREDOMINANTE = 158

DADOS = [
    {
        "tema": "Meio ambiente, saneamento\ne riscos urbanos",
        "governanca": 59,
        "pressao_social": 29,
        "contexto": 8,
    },
    {
        "tema": "Segurança pública\ne criminalidade",
        "governanca": 9,
        "pressao_social": 51,
        "contexto": 18,
    },
    {
        "tema": "Saúde pública e\nserviços de saúde",
        "governanca": 40,
        "pressao_social": 16,
        "contexto": 9,
    },
    {
        "tema": "Mobilidade, trânsito e\nsegurança viária",
        "governanca": 37,
        "pressao_social": 18,
        "contexto": 9,
    },
    {
        "tema": "Trabalho, renda e\ndesenvolvimento econômico",
        "governanca": 32,
        "pressao_social": 3,
        "contexto": 12,
    },
    {
        "tema": "Educação e\nambiente escolar",
        "governanca": 33,
        "pressao_social": 4,
        "contexto": 4,
    },
    {
        "tema": "Violência contra mulheres\ne família",
        "governanca": 7,
        "pressao_social": 23,
        "contexto": 2,
    },
    {
        "tema": "Governança e\nadministração pública",
        "governanca": 19,
        "pressao_social": 0,
        "contexto": 6,
    },
    {
        "tema": "Proteção social,\ndireitos e inclusão",
        "governanca": 19,
        "pressao_social": 3,
        "contexto": 2,
    },
    {
        "tema": "Registros sem tema\npredominante",
        "governanca": 94,
        "pressao_social": 23,
        "contexto": 41,
    },
]

CORES = {
    "governanca": "#174A73",
    "pressao_social": "#B24C3D",
    "contexto": "#7C8791",
}


def preparar_base() -> pd.DataFrame:
    """Monta e valida a tabela usada no gráfico."""
    base = pd.DataFrame(DADOS)
    base = base[~base["tema"].str.startswith("Registros sem tema")].copy()
    base["total"] = base[["governanca", "pressao_social", "contexto"]].sum(axis=1)
    base["tema_rotulo"] = base["tema"]
    base["tema"] = base["tema"].str.replace("\n", " ", regex=False)
    base = base.sort_values(
        ["pressao_social", "total"],
        ascending=[False, False],
        kind="stable",
    ).reset_index(drop=True)

    if int(base["total"].sum()) != 472:
        raise ValueError("A soma dos nove temas deve permanecer igual a 472.")
    if (base[["governanca", "pressao_social", "contexto"]] < 0).any().any():
        raise ValueError("A tabela não pode conter contagens negativas.")
    return base


def gerar_grafico(base: pd.DataFrame) -> None:
    """Gera as versões PNG e PDF do gráfico."""
    plt.rcParams.update(
        {
            "font.family": "DejaVu Sans",
            "font.size": 11,
            "axes.titlesize": 19,
            "figure.facecolor": "white",
            "axes.facecolor": "white",
        }
    )

    plot = base.copy()
    plot = plot.iloc[::-1].reset_index(drop=True)

    fig, ax = plt.subplots(figsize=(15, 12.5), dpi=180)
    fig.subplots_adjust(left=0.31, right=0.94, top=0.69, bottom=0.22)

    y = range(len(plot))
    esquerda = pd.Series(0, index=plot.index, dtype=int)

    for coluna, rotulo in [
        ("governanca", "Governança"),
        ("pressao_social", "Pressão social"),
        ("contexto", "Contexto"),
    ]:
        barras = ax.barh(
            y,
            plot[coluna],
            left=esquerda,
            height=0.62,
            color=CORES[coluna],
            label=rotulo,
        )
        for indice, (barra, valor) in enumerate(zip(barras, plot[coluna])):
            if valor >= 7:
                ax.text(
                    esquerda.iloc[indice] + valor / 2,
                    barra.get_y() + barra.get_height() / 2,
                    f"{valor}",
                    ha="center",
                    va="center",
                    color="white",
                    fontsize=10,
                    fontweight="bold",
                )
            elif valor > 0:
                ax.text(
                    esquerda.iloc[indice] + valor / 2,
                    barra.get_y() + barra.get_height() / 2,
                    f"{valor}",
                    ha="center",
                    va="center",
                    color="#20252A",
                    fontsize=8,
                    fontweight="bold",
                )
        esquerda = esquerda + plot[coluna]

    for indice, total in enumerate(plot["total"]):
        ax.text(
            total + 2,
            indice,
            f"{total}",
            va="center",
            ha="left",
            fontsize=11,
            fontweight="bold",
            color="#20252A",
        )

    ax.set_yticks(list(y))
    ax.set_yticklabels(plot["tema_rotulo"], fontsize=11.5)
    ax.set_xlim(0, 105)
    ax.xaxis.grid(True, color="#D9DEE3", linewidth=0.8)
    ax.set_axisbelow(True)
    ax.spines[["top", "right", "left"]].set_visible(False)
    ax.spines["bottom"].set_color("#AAB2B9")
    ax.tick_params(axis="y", length=0, pad=10)
    ax.tick_params(axis="x", colors="#5D6770")

    fig.text(
        0.055,
        0.955,
        "Atlas Social de Hortolândia",
        fontsize=15,
        fontweight="bold",
        color="#174A73",
    )
    fig.text(
        0.055,
        0.915,
        "Onde o noticiário concentra ações públicas e pressões sociais em Hortolândia",
        fontsize=19,
        fontweight="bold",
        color="#20252A",
    )
    fig.text(
        0.055,
        0.875,
        "Registros jornalísticos classificados por tema e por tipo de leitura institucional",
        fontsize=13,
        color="#4D5963",
    )
    fig.text(
        0.055,
        0.848,
        "Base: dezembro/2025 a julho/2026 · 472 registros nos nove temas exibidos · universo municipal: 657",
        fontsize=11,
        color="#66717A",
    )
    fig.text(
        0.055,
        0.795,
        "Leitura principal: segurança pública e violência contra mulheres apresentam maior predominância de "
        "pressão social;\nmeio ambiente lidera em volume, mas com maioria de ações e respostas públicas.",
        fontsize=11,
        fontweight="bold",
        color="#174A73",
        bbox={
            "boxstyle": "round,pad=0.65",
            "facecolor": "#EAF1F6",
            "edgecolor": "#B9CBD9",
            "linewidth": 0.9,
        },
    )

    legenda = (
        "Governança = ações, entregas, obras, programas ou respostas do poder público\n"
        "Pressão social = problemas, conflitos, riscos ou ocorrências que pressionam a gestão\n"
        "Contexto = fatos relevantes para leitura da cidade, mas que não representam, por si só, "
        "resposta pública nem pressão direta"
    )
    fig.text(
        0.055,
        0.135,
        legenda,
        fontsize=10.5,
        color="#303840",
        linespacing=1.55,
        bbox={
            "boxstyle": "round,pad=0.7",
            "facecolor": "#F2F5F7",
            "edgecolor": "#D5DCE1",
            "linewidth": 0.8,
        },
    )
    fig.text(
        0.055,
        0.185,
        "Nota de taxonomia: 158 registros não tiveram tema predominante definido pela taxonomia atual.",
        fontsize=11.3,
        color="#4D5963",
        fontweight="bold",
    )

    nota = (
        "Nota de leitura: o tamanho das barras mostra a frequência com que cada tema apareceu no "
        "noticiário monitorado. Isso não significa automaticamente maior gravidade real do tema, "
        "mas sim maior recorrência jornalística no período analisado."
    )
    fig.text(
        0.055,
        0.065,
        nota,
        fontsize=11.3,
        color="#4D5963",
        style="italic",
        wrap=True,
    )

    handles, labels = ax.get_legend_handles_labels()
    fig.legend(
        handles,
        labels,
        loc="upper right",
        bbox_to_anchor=(0.94, 0.755),
        frameon=False,
        ncol=3,
        fontsize=10.5,
    )

    fig.savefig(ARQUIVO_PNG, dpi=220, facecolor="white")
    fig.savefig(ARQUIVO_PDF, facecolor="white")
    plt.close(fig)


def main() -> None:
    PASTA_SAIDA.mkdir(parents=True, exist_ok=True)
    base = preparar_base()
    base.drop(columns=["tema_rotulo"]).to_csv(
        ARQUIVO_CSV,
        index=False,
        encoding="utf-8-sig",
    )
    gerar_grafico(base)

    print(f"CSV: {ARQUIVO_CSV}")
    print(f"PNG: {ARQUIVO_PNG}")
    print(f"PDF: {ARQUIVO_PDF}")
    print(f"Universo Hortolândia: {UNIVERSO_HORTOLANDIA}")
    print(f"Registros exibidos: {int(base['total'].sum())}")
    print(f"Registros sem tema predominante: {SEM_TEMA_PREDOMINANTE}")
    print(
        "Outros registros fora dos nove temas exibidos: "
        f"{UNIVERSO_HORTOLANDIA - int(base['total'].sum()) - SEM_TEMA_PREDOMINANTE}"
    )


if __name__ == "__main__":
    main()
