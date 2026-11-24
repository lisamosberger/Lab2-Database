# Lab 2 
## Part A: normalize

**Task 1** Identify a data repetition (data redundancy) in the table and explain 
what problem it causes when updating data.

The owners name and phone number are repeated in several rows, Anna Berg appears 3 times for example. So does the 
pet Rex. If Anna's phone number changes we have to update it in 3 rows instead of just one. If we miss one of the
rows then the same person will have different phone numbers, and we don't know which one to use. 

**Task 5** Break against two rules, show the error message.

**Fee can't be below 0:**
```sql 
insert into visit (visit_date, diagnosis, fee, pet_id)
value ('2026-03-15', 'Vaccination', -200, (select pet_id from pet where pet_name = 'Rex'));
```
`[HY000][3819] Check constraint 'visit_chk_1' is violated.`

**Phone number can't be a dublicate:**
```sql
insert into owner ( owner_name, owner_phone)
value ('Fred Karlsson', '070-111 11 11');
```
`[23000][1062] Duplicate entry '070-111 11 11' for key 'owner.owner_phone'`
