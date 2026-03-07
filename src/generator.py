#!/usr/bin/env python3
from pathlib import Path
import subprocess
import sys

import click

ROOT = Path(__file__).resolve().parent.parent
TEMPLATES_DIR = ROOT / "templates"
OUTPUT_DIR = ROOT / "output"


def run_typst_compile(template_path: Path, output_path: Path) -> None:
    command = [
        "typst",
        "compile",
        str(template_path),
        str(output_path),
    ]
    subprocess.run(command, check=True, cwd=ROOT)


@click.command()
@click.option(
    "--template",
    "template_name",
    default=None,
    help="Nombre del archivo .typ dentro de templates/ para compilar uno solo.",
)
def main(template_name: str | None) -> None:
    if not TEMPLATES_DIR.exists():
        raise click.ClickException(f"No existe el directorio de plantillas: {TEMPLATES_DIR}")

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    if template_name:
        template_path = TEMPLATES_DIR / template_name
        if not template_path.exists():
            raise click.ClickException(f"Plantilla no encontrada: {template_path}")
        templates = [template_path]
    else:
        templates = sorted(TEMPLATES_DIR.glob("*.typ"))

    if not templates:
        raise click.ClickException("No se encontraron archivos .typ en templates/")

    compiled = 0
    for template_path in templates:
        output_path = OUTPUT_DIR / f"{template_path.stem}.pdf"
        try:
            run_typst_compile(template_path, output_path)
            click.echo(f"Generado: {output_path.relative_to(ROOT)}")
            compiled += 1
        except subprocess.CalledProcessError as exc:
            raise click.ClickException(
                f"Falló la compilación de {template_path.name} con código {exc.returncode}"
            ) from exc

    click.echo(f"Plantillas compiladas: {compiled}")


if __name__ == "__main__":
    try:
        main()
    except click.ClickException as exc:
        click.echo(f"Error: {exc.message}", err=True)
        sys.exit(1)
