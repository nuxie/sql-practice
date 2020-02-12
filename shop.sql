CREATE TABLE species (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(20),
	PRIMARY KEY(id)
);

CREATE TABLE types (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(20),
	PRIMARY KEY(id)
);

CREATE TABLE categories (
	id INT NOT NULL AUTO_INCREMENT,
	species_id INT,
	type_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY (species_id) REFERENCES species(id),
	FOREIGN KEY (type_id) REFERENCES types(id)
);

CREATE TABLE assortment (
	id INT NOT NULL AUTO_INCREMENT,
	category_id INT,
	name VARCHAR(50),
	price DECIMAL(15,2),
	unit VARCHAR(20),
	purchasable BOOL,
	PRIMARY KEY(id),
	FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE suppliers (
	id integer NOT NULL AUTO_INCREMENT,
	name varchar(50),
	taxpayer_id_num BIGINT,
	address VARCHAR(50),
	town VARCHAR(30),
	PRIMARY KEY(ID)
);

CREATE TABLE discounts (
	id INT NOT NULL AUTO_INCREMENT,
	value DECIMAL(15,2),
	description VARCHAR(50),
	PRIMARY KEY(id)
);

CREATE TABLE customers (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50),
	town VARCHAR(50),
	taxpayer_id_num BIGINT NOT NULL,
	phone VARCHAR(20),
	discount_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY (discount_id) REFERENCES discounts(id)
);

CREATE TABLE invoices (
	id INT NOT NULL AUTO_INCREMENT,
	customer_id INT,
	total DECIMAL(15,2) DEFAULT 0.0,
	discount_id INT DEFAULT '1',
	paid BOOL,
	PRIMARY KEY(id),
	FOREIGN KEY (discount_id) REFERENCES discounts(id)
);

CREATE TABLE invoice_articles (
	id INT NOT NULL AUTO_INCREMENT,
	invoice_id INT NOT NULL,
	article_id INT NOT NULL,
	quantity DECIMAL(15,2) NOT NULL,
	value DECIMAL(15,2),
	PRIMARY KEY(id),
	FOREIGN KEY (invoice_id) REFERENCES invoices(id),
	FOREIGN KEY (article_id) REFERENCES assortment(id)
);

CREATE TABLE supplied_articles (
	id INT NOT NULL AUTO_INCREMENT,
	supplier_id INT,
	article_id INT,
	article_price DECIMAL(15,2),
	PRIMARY KEY(id),
	FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
	FOREIGN KEY (article_id) REFERENCES assortment(id)
);

INSERT INTO species (name) VALUES
('dog'), ('cat');

INSERT INTO types (name) VALUES
('accessories'), ('food');

INSERT INTO categories (species_id, type_id) VALUES
('1', '1'),
('1', '2'),
('2', '1'),
('2', '2');

INSERT INTO assortment (category_id, name, price, unit) VALUES
('2', 'Pedigree Senior', '25.99', 'kg'),
('2', 'Pedigree Junior', '21.50', 'kg'),
('2', 'Royal Canin', '30.25', 'kg'),
('4', 'Whiskas Adult', '15.99', 'kg'),
('4', 'Whiskas Sterile', '24.50', 'kg'),
('3', 'Pet carrier small - blue', '69.99', 'piece'),
('1', 'Pet carrier large - red', '109.99', 'piece'),
('1', 'Frisbee', '7.99', 'piece'),
('1', 'Dog chew', '15.50', 'piece'),
('3', 'Catnip pillow', '8.99', 'piece'),
('3', 'Scratching post', '69.75', 'piece');

INSERT INTO customers (name, address, town, taxpayer_id_num, phone) VALUES
('Right Meow Pet Shop', '49 Weatherhead Avenue', 'Middlesbrough', '8943538976', '(01728) 436218'),
('Pet Tree', '37 Sleaford Road', 'Bexleyheath', '4794267253', '(01322) 680001'),
('Happy Paws', '27 Sheldon Road', 'Lexington', '1599359424', '(01834) 161244'),
('Pounce and Play Pet Store', '10 Deer Park', 'Buntingford', '7288761192', '(01422) 475522'),
('BINGO Pets', '28 Stone Cottage', 'Wordsley', '7217233879', '(01492) 504308'),
('Blue Collar Pet Store', '17 Ashdown Drive', 'Tenby', '(01661) 357804', '(01763) 063584'),
('Puppy Paws Pets', '3 Hall Lane', 'Kemberton', ' 5316925528', '(01384) 583251');

INSERT INTO suppliers (name, taxpayer_id_num, address, town) VALUES
('Everything for dogs', '1231245862', '38 Hawes Drive', 'Deganwy'),
('Everything for cats', '6861753958', '12A Kingsway', 'Ryton'),
('Accessories for pets', '8615354896', '4 Denbigh Close', 'Trethurgy'),
('Food for pets', '1284652496', '114 Acton Lane', 'Great Fransham');

INSERT INTO supplied_articles
(ID_DOSTAWCY, ID_TOWARU) VALUES
('1', '1'),
('1', '2'),
('1', '6'),
('1', '7'),
('2', '3'),
('2', '4'),
('2', '5'),
('2', '8'),
('3', '5'),
('3', '6'),
('3', '7'),
('3', '8'),
('4', '1'),
('4', '2'),
('4', '3'),
('4', '4');

INSERT INTO discounts (value, description) VALUES
('0', 'no discount'),
('0.05', 'invoice > 4000'),
('0.07', 'regular customer: > 3 purchases'),
('0.10', 'total invoices > 10000'),
('0.12', 'total invoices > 12000');

INSERT INTO invoices (customer_id) VALUES
('6'), ('2'), ('3'), ('5'), ('6'), ('7'), ('5'),
('1'), ('2'), ('4'), ('3'), ('5'), ('1'), ('6'),
('7'), ('5'), ('4'), ('7'), ('3');

INSERT INTO invoice_articles (invoice_id, article_id, quantity) VALUES
('1', '8', '50'),
('2', '5', '12'),
('2', '11', '20'),
('3', '7', '15'),
('3', '9', '12'),
('3', '6', '18'),
('13', '1', '30.5'),
('13', '2', '32'),
('13', '3', '10.2'),
('13', '8', '15'),
('13', '7', '9'),
('13', '9', '5'),
('19', '10', '7'),
('19', '8', '10'),
('17', '3', '10.7'),
('17', '5', '20'),
('4', '4', '150'),
('5', '2', '29.5'),
('6', '7', '50'),
('7', '5', '30'),
('8', '8', '13'),
('9', '11', '24'),
('10', '10', '16'),
('11', '9', '16'),
('12', '8', '36'),
('14', '8', '11'),
('15', '7', '87'),
('16', '5', '75'),
('18', '10', '48'),
('1', '8', '25'),
('4', '5', '45'),
('5', '6', '18'),
('6', '7', '26'),
('7', '5', '32'),
('8', '8', '12'),
('9', '11', '65'),
('10', '10', '19'),
('11', '9', '65'),
('12', '8', '64'),
('14', '8', '130'),
('15', '7', '12'),
('16', '5', '52'),
('18', '10', '38');

DELIMITER //

CREATE PROCEDURE helper_fill_paid()
BEGIN
UPDATE invoices SET paid = '1' WHERE ISNULL(paid);
END //

CREATE PROCEDURE helper_fill_purchasable()
BEGIN
UPDATE assortment SET purchasable = '1' WHERE ISNULL(purchasable);
END //

CREATE PROCEDURE add_invoice (IN cust_id INT)
BEGIN
INSERT INTO invoices (customer_id) VALUES (cust_id);
END //

CREATE PROCEDURE add_invoice_articles (IN id_fak INT, IN id_tow INT, IN il INT)
BEGIN
DECLARE tmp_index INT;
INSERT INTO invoice_articles (invoice_id, article_id, quantity) VALUES (id_fak, id_tow, il);
SELECT MAX(id) INTO tmp_index FROM invoice_articles;
END //

CREATE PROCEDURE calculate_discount(IN cust_id INT, IN invoice_id INT)
BEGIN
DECLARE sum DECIMAL(15,2);
DECLARE invoice_total DECIMAL(15,2);
DECLARE total_purchases INT;
DECLARE tmp_discount_id INT;
SELECT total INTO invoice_total FROM invoices WHERE invoices.id = invoice_id;
SELECT SUM(total) INTO sum FROM invoices WHERE invoices.customer_id = cust_id;
SELECT COUNT(*) INTO total_purchases FROM (SELECT * FROM invoices LIMIT invoice_id) AS a1 WHERE a1.customer_id = cust_id;
IF invoice_total > '4000' AND sum < '10000' AND total_purchases <= '3' THEN SET tmp_discount_id = '2';
ELSEIF total_purchases > '3' AND sum < '10000' THEN SET tmp_discount_id = '3';
ELSEIF sum > '10000' AND sum < '15000' THEN SET tmp_discount_id = '4';
ELSEIF sum > '15000' THEN SET tmp_discount_id = '5';
ELSE SET tmp_discount_id = '1';
END IF;
UPDATE invoices SET discount_id = tmp_discount_id WHERE invoices.id = invoice_id;
IF tmp_discount_id != '2' THEN UPDATE customers SET discount_id = tmp_discount_id WHERE customers.id = cust_id;
END IF;
END //

CREATE PROCEDURE calculate_total_invoices()
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE tmp_id INT;
DECLARE cust_id INT;
DECLARE sum_tmp DECIMAL(15,2);
DECLARE tmp_discount DECIMAL(15,2) DEFAULT 0.0;
DECLARE cur1 CURSOR FOR SELECT id FROM invoices;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN cur1;
WHILE done=0 DO
FETCH cur1 INTO tmp_id;
UPDATE invoice_articles INNER JOIN assortment ON invoice_articles.article_id = assortment.id
SET invoice_articles.value = invoice_articles.quantity * assortment.price
WHERE invoice_articles.invoice_id = tmp_id;
SELECT invoices.total INTO sum_tmp FROM invoices WHERE invoices.id = tmp_id;
IF sum_tmp = 0 THEN
SELECT invoices.customer_id INTO cust_id FROM invoices WHERE invoices.id = tmp_id;
CALL calculate_discount(cust_id, tmp_id);
SELECT discounts.value INTO tmp_discount FROM discounts INNER JOIN invoices WHERE invoices.discount_id = discounts.id AND invoices.id = tmp_id;
SELECT DISTINCT sumy INTO sum_tmp FROM (SELECT invoice_id, SUM(value) AS sumy
	FROM invoice_articles GROUP BY invoice_id) AS a1 WHERE a1.invoice_id = tmp_id;
UPDATE invoices SET invoices.total = sum_tmp * (1 - tmp_discount) WHERE invoices.id = tmp_id;
END IF;
END WHILE;
CLOSE cur1;
END //

CREATE PROCEDURE show_invoice(IN input_id INT)
BEGIN
DECLARE cust_id INT;
SELECT customer_id INTO cust_id FROM invoices WHERE invoices.id = input_id;
SELECT input_id AS invoice_number, customers.name AS company, customers.town, address, invoices.total,
(SELECT discounts.value FROM invoices INNER JOIN discounts ON invoices.discount_id = discounts.id AND invoices.customer_id = cust_id AND invoices.id = input_id) AS rabat
FROM customers INNER JOIN invoices ON customers.id = cust_id AND invoices.id = input_id;
SELECT t.name, price, unit, af.quantity, value FROM assortment t
INNER JOIN invoice_articles af ON t.id = af.article_id AND af.invoice_id = input_id;
END //

DELIMITER ;

CALL helper_fill_purchasable();
CALL calculate_total_invoices();
CALL helper_fill_paid();
CALL add_invoice('5');
CALL add_invoice('4');
CALL add_invoice('6');
CALL add_invoice('1');
CALL add_invoice_articles('20', '2', '100');
CALL add_invoice_articles('20', '5', '20');
CALL add_invoice_articles('21', '3', '62');
CALL add_invoice_articles('21', '5', '19');
CALL add_invoice_articles('22', '6', '30');
CALL add_invoice_articles('23', '4', '35');
CALL add_invoice_articles('23', '2', '19');
CALL helper_fill_paid();
CALL calculate_total_invoices();