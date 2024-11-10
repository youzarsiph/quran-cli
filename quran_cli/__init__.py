""" Quran CLI """

from pathlib import Path
import sqlite3


def create_db(name: str) -> bool:
    """
    Creates the database to insert quran text.

    Args:
        name (str): Database name

    Returns:
        bool: True if the database is created successfully else False
    """

    try:
        connection = sqlite3.connect(name)
        cursor = connection.cursor()
        cursor.executescript(
            """
            DROP TABLE IF EXISTS quran;
            CREATE TABLE quran (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                chapter_id INTEGER NOT NULL,
                verse_number INTEGER NOT NULL,
                text TEXT NOT NULL
            );"""
        ).fetchall()
        connection.commit()
        connection.close()

        return True

    except Exception as error:
        print(error)

        return None


def insert_quran(db: str) -> bool:
    """
    Inserts the Quran text into the database

    Args:
        db (sqlite3.Cursor): Cursor to the database

    Returns:
        bool: True if the data is inserted successfully else False.
    """

    try:
        connection = sqlite3.connect(db)
        cursor = connection.cursor()

        with open(
            Path(__file__).parent / "assets" / "quran.sql",
            "r",
            encoding="utf-8",
        ) as file:
            cursor.executescript(file.read())
            connection.commit()
            connection.close()

        return True

    except Exception as error:
        print(error)

        return False
