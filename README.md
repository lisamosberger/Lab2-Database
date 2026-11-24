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





