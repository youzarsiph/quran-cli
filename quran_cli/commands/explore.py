""" Interact with Quran db using SQL """

from pathlib import Path
import sqlite3
from typing import Annotated
import typer
from rich import box, print
from rich.console import Console
from rich.table import Table


def explore(
    db: Annotated[
        Path,
        typer.Argument(exists=True, dir_okay=False, help="Database name"),
    ]
) -> None:
    """
    Explore the Quran db

    Args:
        db (Path, optional): Database file.
    """

    try:
        connection = sqlite3.connect(db)
        cursor = connection.cursor()

        while True:
            query = typer.prompt("SQLite3", prompt_suffix=" >>> ")

            if query.lower() in ("exit", "quit"):
                break

            results = cursor.execute(query).fetchall()

            console = Console()
            table = Table(
                title="Query Results",
                title_justify="left",
                title_style="bold",
                box=box.ROUNDED,
            )

            for column in cursor.description:
                table.add_column(column[0])

            for row in results:
                table.add_row(*[str(item) for item in row])

            console.print(table)

    except Exception as error:
        print(error)
