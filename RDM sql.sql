#1-Convert the entity relationship diagram into relational model.
CREATE TABLE Producer ( NumP INT PRIMARY KEY, FirstName VARCHAR(20) NOT NULL, LastName VARCHAR(255) NOT NULL, Region VARCHAR(255) NOT NULL);
CREATE TABLE Wine ( NumW INT PRIMARY KEY, Category VARCHAR(20) NOT NULL, Yearr Date  NOT NULL, Degree int not null);
CREATE TABLE harvest ( NumH INT PRIMARY KEY, Quantity int NOT NULL, NumP int,NumW int, CONSTRAINT const_PRO FOREIGN KEY (NumP) REFERENCES Producer(NumP), CONSTRAINT const_wine FOREIGN KEY (NumW) REFERENCES Wine(NumW));
#2-Give the list the producers.
Select * From Producer;
#3-Give the list of producers sorted by name.
Select * From Producer order by FirstName;
#4-Give the list the producers of Sousse.
Select * From Producer where region = 'Souse';
#5-Calculate the total quantity of wine produced having the number 12.
Select Sum(Quantity) from Wine w inner join harvest h on w.NumW=h.NumW WHERE w.Degree> 12 and h.Quantity = 12;
#6-Calculate the quantity of wine produced by category.
Select Category, SUM(Quantity) From harvest h Inner join Wine w ON w.NumW=h.NumW group by Category;
#7-Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters? We want the names and first names of the producers, sorted in alphabetical order.
Select FirstName, LastName From Producer P  Inner join harvest h ON P.NumP=h.NumP Where P.Region = 'sousse' and h.Quantity > 300 Order by FirstName;
#8-List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24.
Select w.NumW from Wine w inner join harvest h on w.NumW = h.NumW where h.NumP=24 and w.degree >12;
