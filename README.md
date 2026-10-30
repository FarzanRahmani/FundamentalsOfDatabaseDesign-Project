# Movie System Database

A four-phase database-design project completed for the fourth-semester Fundamentals of Database Design course at Iran University of Science and Technology, taught by Dr. Hossein Rahmani.

**Team:** Farzan Rahmani, Mohammad Osoolian, and Ahmadreza Tahmasebi.

The project develops a relational movie-information system from requirements and conceptual modeling through a Microsoft SQL Server implementation. Its schema includes movies, genres, users, ratings, artists, and film-production relationships.

## Project Phases

| Directory | Deliverables |
| --- | --- |
| `phase 1/` | Initial project documentation and first-phase specification |
| `phase 2/` | Revised documentation and editable ER diagram (`ERdiagram.eddx`) |
| `phase 3/` | Relational-design diagram and phase specification |
| `phase 4/` | T-SQL schema, database programs, sample data, and queries |

Reports and comments include Persian text. PDF exports can be read without the original diagram-editing tools.

## Running the SQL Implementation

Use Microsoft SQL Server with SQL Server Management Studio or another client that supports T-SQL and `GO` batch separators. This SQL is not directly portable to SQLite, PostgreSQL, or MySQL.

**The first script drops an existing database named `MovieSystem` before recreating it. Run it only on a disposable development instance where that database can be replaced.**

Execute the files in this order:

1. `phase 4/1-CREATE TABLES.sql`: create `MovieSystem`, tables, keys, and constraints.
2. `phase 4/2-PROGRAMS.sql`: create functions, procedures, and other database programs.
3. `phase 4/3-INSERT VALUES.sql`: load the supplied sample records.
4. `phase 4/4-QUERIES.sql`: explore the example queries.

The scripts use `USE master` and `CREATE DATABASE`, so the connection needs the corresponding development-instance permissions. Review every batch before running it; these are coursework scripts rather than an idempotent migration system.

## Suggested Reading

Follow the phases in order to connect the requirements to the ER model, relational schema, and final SQL. In the implementation, compare foreign keys and constraints with the diagrams, then inspect functions such as `get_movie_score` and procedures such as `selectAllArtists` and `directorMovies`.

## License

See [LICENSE](LICENSE) for license terms.
