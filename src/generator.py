#!/usr/bin/env python3
from pathlib import Path
import subprocess
import sys

import click

ROOT = Path(__file__).resolve().parent.parent
TEMPLATES_DIR = ROOT / "templates"
DATA_DIR = ROOT / "data"
OUTPUT_DIR = ROOT / "output"
DEFAULT_TEMPLATE = "tabla_nutricional_generica.typ"


def run_typst_compile(template_path: Path, output_path: Path, data_path: Path) -> None:
    command = [
        "typst",
        "compile",
        str(template_path),
        str(output_path),
        "--input",
        f"data={data_path.relative_to(ROOT)}",
    ]
    subprocess.run(command, check=True, cwd=ROOT)


@click.command()
@click.option(
    "--template",
    "template_name",
    default=DEFAULT_TEMPLATE,
    show_default=True,
    help="Nombre del archivo .typ dentro de templates/.",
)
@click.option(
    "--data",
    "data_name",
    default=None,
    help="Nombre del archivo .yaml dentro de data/ para compilar uno solo.",
)
@click.option(
    "--output",
    "output_name",
    default=None,
    help="Nombre del PDF de salida dentro de output/.",
)
def main(template_name: str, data_name: str | None, output_name: str | None) -> None:
    if not TEMPLATES_DIR.exists():
        raise click.ClickException(f"No existe el directorio de plantillas: {TEMPLATES_DIR}")
    if not DATA_DIR.exists():
        raise click.ClickException(f"No existe el directorio de datos: {DATA_DIR}")

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    template_path = TEMPLATES_DIR / template_name
    if not template_path.exists():
        raise click.ClickException(f"Plantilla no encontrada: {template_path}")

    if data_name:
        data_path = DATA_DIR / data_name
        if not data_path.exists():
            raise click.ClickException(f"Archivo de datos no encontrado: {data_path}")
        data_files = [data_path]
    else:
        data_files = sorted(DATA_DIR.glob("*.yaml"))

    if not data_files:
        raise click.ClickException("No se encontraron archivos .yaml en data/")

    compiled = 0
    for data_path in data_files:
        pdf_name = output_name or f"{data_path.stem}.pdf"
        output_path = OUTPUT_DIR / pdf_name
        try:
            run_typst_compile(template_path, output_path, data_path)
            click.echo(
                f"Generado: {output_path.relative_to(ROOT)} usando {data_path.relative_to(ROOT)}"
            )
            compiled += 1
        except subprocess.CalledProcessError as exc:
            raise click.ClickException(
                f"Falló la compilación de {data_path.name} con código {exc.returncode}"
            ) from exc

        if output_name:
            break

    click.echo(f"Archivos compilados: {compiled}")


if __name__ == "__main__":
    try:
        main()
    except click.ClickException as exc:
        click.echo(f"Error: {exc.message}", err=True)
        sys.exit(1)
