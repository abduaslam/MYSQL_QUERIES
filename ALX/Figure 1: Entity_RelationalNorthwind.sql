-- Exercise 1
-- Identify and list the primary key(s) for each table in the ERD. Why do you think these specific columns were chosen as the primary keys?
/*The primary keys for the Northwind database tables will vary, but some examples could be:
Customers: CustomerID
Orders: OrderID
OrderDetails: OrderID, ProductID (composite key)*/

/* Exercise 2
-- In the ERD, which tables represent entities, and which ones represent relationships? Justify your categorisation.
-- Entities are objects that we're interested in within the system. For example, Customers, Employees, and Products can be considered entities.
Relationships are often represented by verb phrases and typically require junction tables (like OrderDetails), 
which define the relationship between other entities such as Orders and Products.*/

/* Exercise 3
-- Discuss the concept of cardinality by explaining the cardinality of the relationship between the Customers and Orders tables in the Northwind database.
 In the context of the business rules of the Northwind company, why do you think this type of cardinality is appropriate?
 
The cardinality between the Customers and Orders tables is typically one-to-many (1:M). 
This means that one customer can place multiple orders, but each order can only be linked to one customer. 
This makes sense from a business perspective, as a customer may place multiple orders over time.*/

/* Exercise 4
-- Analyse the relationship between the Orders and OrderDetails tables. 
What does this relationship represent in terms of business processes in Northwind? Identify the foreign key(s) in these tables and explain how they are used to establish this relationship.?

The relationship between the Orders and OrderDetails tables is one-to-many (1:M). 
Each order can have multiple order details (representing different products), but each order detail is linked to only one order. 
The OrderDetails table would likely have a composite primary key including OrderID and ProductID, 
where OrderID is a foreign key linking to the Orders table and ProductID is a foreign key linking to the Products table.
*/

/* Exercise 5
-- Based on your ERD, can you identify any associative entities in the Northwind database?
 Explain why these tables are considered associative entities and discuss the relationships they facilitate.
 
 The OrderDetails table can be considered an associative entity. 
 This table enables a many-to-many (M:M) relationship between Orders and Products by storing the foreign keys from both tables.
*/

/*Exercise 6
-- Suppose you were asked to add a new attribute to the Products entity that tracks the date the product was last ordered. 
Show how you would update the ERD to reflect this change and discuss any potential impacts on existing relationships.

To add the LastOrderedDate attribute to the Products entity, you would simply add a new column to the Products table in the ERD. 
This change should not impact existing relationships but would require updating the OrderDetails or Orders processing to set the LastOrderedDate whenever a product is ordered.
*/

/* Exercise 7
- Northwind plans to introduce a new feature for "discount coupons". 
Each coupon can be used multiple times but has a maximum total use. 
A customer can use multiple coupons for a single order. Sketch how you would modify the existing ERD to accommodate this new feature. 
Be sure to specify entities, attributes, relationships, and cardinalities.

To add the LastOrderedDate attribute to the Products entity, you would simply add a new column to the Products table in the ERD. 
This change should not impact existing relationships but would require updating the OrderDetails or Orders processing to set the LastOrderedDate whenever a product is ordered.

*/