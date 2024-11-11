""" Experiment with Quran db using SQL """

from pathlib import Path
from typing import Annotated
import typer
from rich import print

from quran_cli import update_safhah_table


def test(
    database: Annotated[
        Path,
        typer.Argument(exists=True, dir_okay=False, help="Database name"),
    ]
) -> None:
    """
    Experiment the Quran db

    Args:
        db (Path): Database filename.
    """

    try:
        update_safhah_table(database.name)

    except Exception as error:
        print(f"[bold red]Error[/bold red]: {error}")
