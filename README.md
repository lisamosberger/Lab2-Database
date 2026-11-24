# Lab 2: Database (vetclinic)

A small database for a veterinary clinic. 

## Database 
The database `vetclinic` has these tables: 

| Table | Description | 
|-------|-------------| 
| `owner` | Pet owners (name  and a unqiue phone number |
| `pet` | Pet (name, each connected to the owner and to species) |
| `visit` | visit (reason, fee and it is connected to a pet |
| `species` | species, connected with pet | 

## Tables

**Owner**
| owner\_id | owner\_name | owner\_phone |
| :--- | :--- | :--- |
| 1 | Anna Berg | 070-111 11 11 |
| 2 | Erik Holm | 070-222 22 22 |
| 3 | Sara Lind | 070-333 33 33 |
| 4 | Lisa Mosberger | 076-886 63 64 |
| 5 | Maja Larsson | 073-456 93 54 |

**Pet**
| pet\_id | pet\_name | owner\_id | species\_id |
| :--- | :--- | :--- | :--- |
| 1 | Rex | 1 | 1 |
| 2 | Misse | 1 | 2 |
| 3 | Bella | 5 | 1 |
| 4 | Pelle | 3 | 3 |
| 5 | Luna | 4 | 2 |

**Species**
| species\_id | species\_name |
| :--- | :--- |
| 1 | Hund |
| 3 | Kanin |
| 2 | Katt |


**Visit**
| visit\_id | visit\_date | diagnosis | fee | pet\_id |
| :--- | :--- | :--- | :--- | :--- |
| 1 | 2026-01-10 | Vaccination | 450 | 1 |
| 2 | 2026-03-02 | Klokklippning | 150 | 1 |
| 3 | 2026-02-14 | Öroninflammation | 600 | 2 |
| 4 | 2026-01-20 | Hälta | 800 | 3 |
| 5 | 2026-04-05 | Kontroll | 300 | 3 |
| 6 | 2026-02-28 | Tandkontroll | 350 | 4 |
| 7 | 2026-10-15 | Vaccination | 450 | 5 |




## Project structure

```
Lab2-Database/
├───.idea
├───.mvn
├───Database
│   ├───Questions.md  (Task 1, 5, 10) 
│   └───vetclinic.sql (Task 2, 3, 4, 6, 9)
└───src
    └───main
       ├───java
       │   └───org
       │       └───example
       └───resources
```

## TODO 

**PART A: Normalize**
- [X] Task 1: Find data repetition and explain the update problem 
- [X] Task 2: Create the database and tables with keys
- [X] Task 3: Insert the data and show `count(*)`for each table

**PART B: Protect the data**
- [X] Task 4: `not null`, `unique` and `check`
- [X] Task 5: Break two rules and show the error messages
- [X] Task 6: Transaction with `insert`, `update`and `commit`

**PART C: Java against the database**
- [ ] Task 7: List all pets with JDBC and with JPA/Hibernate (with SQL logging)
- [ ] Task 8: `findPetsByName(String name` with `PreparedStatement`

**PART D: Advanced (VG)**
- [X] Task 9: `species`table and forgein key in `pet`
- [X] Task 10: When not to normalize





