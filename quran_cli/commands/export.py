""" Export Quran """

from enum import Enum
import os
import sqlite3
from pathlib import Path
from typing import Annotated, Optional
import pandas as pd
import typer
from rich import print


class ExportFormat(str, Enum):
    """Export formats"""

    CSV = "csv"
    XML = "xml"
    JSON = "json"


def export(
    database: Annotated[
        Path,
        typer.Argument(exists=True, dir_okay=False, help="Database name"),
    ],
    output: Annotated[
        Optional[Path],
        typer.Option(
            "-o", "--output", file_okay=False, dir_okay=True, help="Output folder"
        ),
    ] = Path("quran-data"),
    format: Annotated[
        Optional[ExportFormat],
        typer.Option("-f", "--format", help="Export format."),
    ] = ExportFormat.JSON,
) -> None:
    """
    Export Quran data to csv, json, xml format.

    Args:
        database (Path): Database filename.
        output (Path, optional): Output folder.
        format (str, optional): Export format.
    """

    try:
        connection = sqlite3.connect(database.name)
        os.makedirs(output, exist_ok=True)

        tables = ["chapters", "parts", "groups", "quarters", "pages", "verses"]

        for table in tables:
            df = pd.read_sql(sql=f"SELECT * FROM {table}", con=connection)

            match format:
                case "csv":
                    with open(
                        f"{output}/{table}.csv",
                        "w",
                        encoding="utf-8",
                    ) as file:
                        df.to_csv(file, index=False)

                case "json":
                    with open(
                        f"{output}/{table}.json",
                        "w",
                        encoding="utf-8",
                    ) as file:
                        df.to_json(file, orient="records", indent=2, force_ascii=False)

                case "xml":
                    with open(
                        f"{output}/{table}.xml",
                        "w",
                        encoding="utf-8",
                    ) as file:
                        df.to_xml(file)

        connection.close()

    except Exception as error:
        print(f"[bold red]Error[/bold red]: {error}")
