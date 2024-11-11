""" Normalize initial Quran db """

from pathlib import Path
from typing import Annotated
import typer
from rich import print

from quran_cli import (
    apply_normalized_schema,
    insert_chapters,
    insert_metadata,
    insert_verses,
    update_verses_table,
    update_pages_table,
    update_verse_count,
)


def normalize(
    database: Annotated[
        Path,
        typer.Argument(exists=True, dir_okay=False, help="Database name"),
    ]
) -> None:
    """
    Normalize initial Quran database.

    Args:
        name (str): Database name.
    """

    db_name = (
        database.name
        if database.name.endswith((".sqlite3", ".db"))
        else database.name + ".sqlite3"
    )

    try:
        apply_normalized_schema(db_name)
        insert_chapters(db_name)
        insert_verses(db_name)
        insert_metadata(db_name)
        update_verses_table(db_name)
        update_verse_count(db_name)
        update_pages_table(db_name)

    except Exception as error:
        print(f"[bold red]Error[/bold red]: {error}")
