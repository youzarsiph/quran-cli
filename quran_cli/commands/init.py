""" Init Quran db """

from typing import Annotated
import typer
from rich import print

from quran_cli import create_db, insert_quran


def init(name: Annotated[str, typer.Argument(help="Database name")]) -> None:
    """
    Initialize Quran database with structure of Tanzil Project

    Args:
        name (str, optional): Database name.
    """

    db_name = name if name.endswith((".sqlite3", ".db")) else name + ".sqlite3"

    try:
        is_created = create_db(db_name)

        if not is_created:
            raise typer.Abort("Database creation failed.")

        is_inserted = insert_quran(db_name)

        if not is_inserted:
            raise typer.Abort("Data insertion failed.")

    except Exception as error:
        print(error)
