""" Init Quran db """

from pathlib import Path
from typing import Annotated
import typer
from rich import print

from quran_cli import create_db, insert_initial_data


def init(
    database: Annotated[Path, typer.Argument(dir_okay=False, help="Database name")]
) -> None:
    """
    Initialize Quran database with structure of Tanzil Project

    Args:
        name (str): Database name.
    """

    db_name = (
        database.name
        if database.name.endswith((".sqlite3", ".db"))
        else database.name + ".sqlite3"
    )

    try:
        create_db(db_name)
        insert_initial_data(db_name)

    except Exception as error:
        print(f"[bold red]Error[/bold red]: {error}")
