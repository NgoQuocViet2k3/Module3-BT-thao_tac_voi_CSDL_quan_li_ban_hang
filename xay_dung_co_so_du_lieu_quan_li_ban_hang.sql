create database quanlisanpham;
use quanlisanpham;
create table customer(
cID int not null auto_increment primary key,
cName varchar(50),
cAge int check(cAge >0)
);
CREATE TABLE orders(
oID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cID INT,
oDate DATETIME,
oTotalPrice FLOAT,
FOREIGN KEY (cID) REFERENCES customer(cID)
);
CREATE TABLE products(
pID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
pName VARCHAR(50),
pPrice FLOAT CHECK (pPrice > 0)
);
CREATE TABLE orderDetails(
pID INT, oID INT,
FOREIGN KEY(pID) REFERENCES products(pID),
FOREIGN KEY(oID) REFERENCES orders(oID),
PRIMARY KEY(pID, oID),
oQuantity FLOAT CHECK (oQuantity > 0)
);
