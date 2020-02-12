CREATE TABLE categories (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE authors (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE publishers (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	PRIMARY KEY(id)
);

CREATE TABLE books (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	author_id INT NOT NULL,
	category_id INT NOT NULL,
	publisher_id INT NOT NULL,
	pieces INT NOT NULL,
	active BOOLEAN NOT NULL,
	buy_price FLOAT NOT NULL,
	sell_price FLOAT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (author_id) REFERENCES authors (id),
	FOREIGN KEY (category_id) REFERENCES categories (id),
	FOREIGN KEY (publisher_id) REFERENCES publishers (id)
);

CREATE TABLE clients (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(50),
	PRIMARY KEY(id)
);

CREATE TABLE addresses (
	id INT NOT NULL AUTO_INCREMENT,
	client_id INT NOT NULL,
	address VARCHAR(100),
	postal_code VARCHAR(40),
	city VARCHAR(40),
	PRIMARY KEY(id),
	FOREIGN KEY (client_id) REFERENCES clients (id)
);

CREATE TABLE purchases (
	id INT NOT NULL AUTO_INCREMENT,
	purchase_date DATE NOT NULL,
	sent_date DATE,
	package_num VARCHAR(30),
	client_id INT NOT NULL,
	address_id INT NOT NULL,
	total FLOAT DEFAULT 0,
	PRIMARY KEY(id)
);

CREATE TABLE purchased_books (
	id INT NOT NULL AUTO_INCREMENT,
	purchase_id INT NOT NULL,
	book_id INT NOT NULL,
	pcs INT NOT NULL,
	value FLOAT,
	PRIMARY KEY (id),
	FOREIGN KEY (purchase_id) REFERENCES purchases (id),
	FOREIGN KEY (book_id) REFERENCES books (id)
);

INSERT INTO clients (name,email,phone) VALUES ('Sasha Gilliam','Morbi@Vivamus.ca','111 302 712');
INSERT INTO clients (name,email,phone) VALUES ('Pearl Farley','libero@pedeultricesa.com','864 367 635');
INSERT INTO clients (name,email,phone) VALUES ('Timothy Hodges','Vestibulum.accumsan.neque@ettristique.ca','483 519 537');
INSERT INTO clients (name,email,phone) VALUES ('Rajah Hartman','libero.Proin@tortoratrisus.com','347 902 362');
INSERT INTO clients (name,email,phone) VALUES ('Micah Henderson','scelerisque@orci.com','139 224 492');
INSERT INTO clients (name,email,phone) VALUES ('Quinn Mack','ipsum.sodales.purus@molestiein.ca','897 819 436');
INSERT INTO clients (name,email,phone) VALUES ('September Hart','metus.eu@eratSed.edu','712 945 873');
INSERT INTO clients (name,email,phone) VALUES ('Idona Jordan','risus.Quisque.libero@NullamenimSed.org','635 719 178');
INSERT INTO clients (name,email,phone) VALUES ('Ishmael Haynes','ipsum.Curabitur.consequat@vulputatenisi.org','516 154 798');
INSERT INTO clients (name,email,phone) VALUES ('Dahlia Obrien','ac.sem.ut@lorem.org','413 602 487');
INSERT INTO clients (name,email,phone) VALUES ('Phoebe Ortega','lobortis.Class@imperdietornare.ca','688 335 228');
INSERT INTO clients (name,email,phone) VALUES ('Samuel Wynn','pulvinar.arcu.et@pellentesqueeget.com','551 574 352');
INSERT INTO clients (name,email,phone) VALUES ('Adrienne Carney','sit.amet@litoratorquent.com','325 676 855');
INSERT INTO clients (name,email,phone) VALUES ('Scarlett Fitzpatrick','amet.massa@Quisquetincidunt.ca','123 856 376');
INSERT INTO clients (name,email,phone) VALUES ('Jarrod Cook','enim@felisDonec.edu','618 366 825');
INSERT INTO clients (name,email,phone) VALUES ('Brent Parker','lorem.fringilla.ornare@dignissimtemporarcu.org','885 448 213');
INSERT INTO clients (name,email,phone) VALUES ('Gary Fox','ultricies@sodalesatvelit.com','827 575 636');
INSERT INTO clients (name,email,phone) VALUES ('Fredericka Bailey','diam@Loremipsum.ca','553 934 968');
INSERT INTO clients (name,email,phone) VALUES ('Ebony Rodgers','a.odio@in.ca','364 119 383');
INSERT INTO clients (name,email,phone) VALUES ('Freya Bird','lectus.ante@nostra.com','563 802 585');
INSERT INTO clients (name,email,phone) VALUES ('Derek Hicks','fringilla.est@aliquetmolestie.org','187 270 914');
INSERT INTO clients (name,email,phone) VALUES ('Ariana Horn','consequat@montesnasceturridiculus.org','395 310 273');
INSERT INTO clients (name,email,phone) VALUES ('Kiayada French','lobortis.quis@montesnasceturridiculus.edu','612 402 543');
INSERT INTO clients (name,email,phone) VALUES ('Vernon Page','natoque.penatibus@tristiquesenectus.ca','363 463 289');
INSERT INTO clients (name,email,phone) VALUES ('Jamalia Lynn','id.risus.quis@magnamalesuadavel.ca','913 927 467');
INSERT INTO clients (name,email,phone) VALUES ('Brenda White','nisi.magna@Nunc.org','652 383 288');
INSERT INTO clients (name,email,phone) VALUES ('Mira Moreno','nisi@tortorat.com','625 899 571');
INSERT INTO clients (name,email,phone) VALUES ('Hollee Barker','varius.orci@nonummy.edu','843 774 551');
INSERT INTO clients (name,email,phone) VALUES ('Bryar Lucas','at.iaculis@neccursus.edu','661 655 359');
INSERT INTO clients (name,email,phone) VALUES ('Gil Ballard','ultricies.sem@eu.org','672 417 838');

INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('1','Ap #863-5745 Sed Ave','91-309','Manassas');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('2','Ap #968-3673 Vulputate Rd.','18-532','Starkville');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('3','Ap #607-7544 Mauris. Avenue','30-007','Springdale');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('4','7285 Nam St.','94-358','Birmingham');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('5','804-6152 Proin Street','66-555','Detroit');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('6','P.O. Box 398, 5736 Penatibus Rd.','91-161','Atwater');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('7','Ap #721-3534 Phasellus Rd.','81-505','Hartford');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('8','719-5944 Donec St.','58-919','Durant');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('9','5788 Mattis Road','68-983','Parma');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('10','Ap #338-6097 Penatibus Rd.','16-336','Newcastle');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('11','1669 Sem, St.','28-497','Somersworth');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('12','Ap #332-2770 Duis Rd.','99-764','Jamestown');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('13','Ap #431-9055 Libero Rd.','19-841','Plainfield');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('14','P.O. Box 446, 2589 Diam Rd.','81-537','Seattle');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('15','450-2166 Auctor, Ave','72-238','Newport News');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('16','P.O. Box 516, 7895 Tincidunt Rd.','80-230','Nenana');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('17','P.O. Box 287, 5542 Ipsum. Ave','07-271','Pawtucket');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('18','338-8199 Accumsan Avenue','85-857','Frankfort');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('19','Ap #969-4263 Hendrerit Road','16-388','Mandan');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('20','Ap #655-4532 Tellus Street','46-348','Nenana');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('21','P.O. Box 338, 8552 Erat St.','35-470','Hot Springs');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('22','200-8128 Eget St.','05-633','Edina');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('24','P.O. Box 230, 7426 Cubilia Av.','73-484','Rockville');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('23','P.O. Box 635, 4125 Neque Street','57-652','Rancho Cucamonga');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('25','P.O. Box 653, 5948 Ac Street','23-315','Laconia');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('26','233-3074 Per Av.','18-140','Reading');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('27','Ap #286-7698 Donec Rd.','25-056','Ontario');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('28','163-5903 Vestibulum St.','99-873','Yuma');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('29','P.O. Box 993, 9463 Penatibus Av.','98-543','San Angelo');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('30','233-9995 Urna Road','92-997','Winooski');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('3','439-3208 Dui Avenue','44-836','Selma');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('8','258 Enim Ave','06-269','Lawrenceville');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('26','P.O. Box 905, 3986 Lorem Road','88-948','Hayward');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('25','973-1059 Mauris, Av.','87-344','Citrus Heights');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('15','Ap #343-7678 Tellus Av.','11-762','Norton');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('1','5142 Quam Rd.','33-341','Murray');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('14','616-9474 Luctus Rd.','77-435','Camden');
INSERT INTO addresses (client_id,address,postal_code,city) VALUES ('18','Ap #137-9352 Libero Street','96-902','Toledo');

INSERT INTO authors (name) VALUES ('Zoe Ball');
INSERT INTO authors (name) VALUES ('Cameran Riggs');
INSERT INTO authors (name) VALUES ('April Chandler');
INSERT INTO authors (name) VALUES ('Dante Christian');
INSERT INTO authors (name) VALUES ('Len Raymond');
INSERT INTO authors (name) VALUES ('Macy Matthews');
INSERT INTO authors (name) VALUES ('Tanner Webb');
INSERT INTO authors (name) VALUES ('Kiayada Chase');
INSERT INTO authors (name) VALUES ('Harding Turner');
INSERT INTO authors (name) VALUES ('Halee Green');
INSERT INTO authors (name) VALUES ('Jeremy Smith');
INSERT INTO authors (name) VALUES ('Todd Adkins');
INSERT INTO authors (name) VALUES ('Ariana May');
INSERT INTO authors (name) VALUES ('Kaden Fitzgerald');
INSERT INTO authors (name) VALUES ('Ella Larson');
INSERT INTO authors (name) VALUES ('Nita Fisher');
INSERT INTO authors (name) VALUES ('Kirsten Soto');
INSERT INTO authors (name) VALUES ('April Melendez');
INSERT INTO authors (name) VALUES ('Alec Forbes');
INSERT INTO authors (name) VALUES ('Raya Meadows');
INSERT INTO authors (name) VALUES ('Angelica Hendricks');
INSERT INTO authors (name) VALUES ('Chantale Washington');
INSERT INTO authors (name) VALUES ('Grace Pitts');
INSERT INTO authors (name) VALUES ('Branden Prince');
INSERT INTO authors (name) VALUES ('Margaret Kane');
INSERT INTO authors (name) VALUES ('Bethany Bullock');
INSERT INTO authors (name) VALUES ('Garth Alvarez');
INSERT INTO authors (name) VALUES ('Brenden Hebert');
INSERT INTO authors (name) VALUES ('Lenore Miller');
INSERT INTO authors (name) VALUES ('Neil Strickland');
INSERT INTO authors (name) VALUES ('Callum Hebert');
INSERT INTO authors (name) VALUES ('Cassady Parrish');
INSERT INTO authors (name) VALUES ('Dieter Dean');
INSERT INTO authors (name) VALUES ('Ferdinand Fitzpatrick');
INSERT INTO authors (name) VALUES ('Keelie Brooks');
INSERT INTO authors (name) VALUES ('Teegan Mcclure');
INSERT INTO authors (name) VALUES ('Kareem Booth');
INSERT INTO authors (name) VALUES ('Keely Stephenson');
INSERT INTO authors (name) VALUES ('Rose Morris');
INSERT INTO authors (name) VALUES ('Lynn Huff');
INSERT INTO authors (name) VALUES ('Bruce Perez');
INSERT INTO authors (name) VALUES ('Lana Jensen');
INSERT INTO authors (name) VALUES ('Orla Ortega');
INSERT INTO authors (name) VALUES ('Sybill Gaines');
INSERT INTO authors (name) VALUES ('Felicia Mays');
INSERT INTO authors (name) VALUES ('Ciaran Irwin');
INSERT INTO authors (name) VALUES ('Yuri Guthrie');
INSERT INTO authors (name) VALUES ('Cassidy Downs');
INSERT INTO authors (name) VALUES ('Lillian Keith');
INSERT INTO authors (name) VALUES ('Kermit Cain');
INSERT INTO authors (name) VALUES ('Lewis Horne');
INSERT INTO authors (name) VALUES ('Nola Bruce');
INSERT INTO authors (name) VALUES ('Keely Dodson');
INSERT INTO authors (name) VALUES ('Yuli Glover');
INSERT INTO authors (name) VALUES ('Tamara Mcintosh');
INSERT INTO authors (name) VALUES ('Rhoda Atkins');
INSERT INTO authors (name) VALUES ('Fatima Guerrero');
INSERT INTO authors (name) VALUES ('Josephine Bass');
INSERT INTO authors (name) VALUES ('Aphrodite Hall');
INSERT INTO authors (name) VALUES ('Guinevere Hall');

INSERT INTO categories (name) VALUES ('jobs'), ('skills'), ('novels'), ('plants'), ('animals'), ('travels');

INSERT INTO publishers (name) VALUES ('Kirlin and Sons');
INSERT INTO publishers (name) VALUES ('Mitchell Inc');
INSERT INTO publishers (name) VALUES ('Walsh LLC');
INSERT INTO publishers (name) VALUES ('Hagenes Group');
INSERT INTO publishers (name) VALUES ('Reinger, King and Brakus');
INSERT INTO publishers (name) VALUES ('Mayert LLC');
INSERT INTO publishers (name) VALUES ('Gerlach Group');
INSERT INTO publishers (name) VALUES ('Franecki Inc');
INSERT INTO publishers (name) VALUES ('Anderson, Murray and Morissette');
INSERT INTO publishers (name) VALUES ('Thompson, Hand and Becker');
INSERT INTO publishers (name) VALUES ('Heathcote Inc');
INSERT INTO publishers (name) VALUES ('Stoltenberg, Mosciski and Kshlerin');
INSERT INTO publishers (name) VALUES ('Schaden-Wiegand');
INSERT INTO publishers (name) VALUES ('Buckridge-Littel');
INSERT INTO publishers (name) VALUES ('Satterfield, Lebsack and Sanford');
INSERT INTO publishers (name) VALUES ('O Connell, Osinski and Cremin');
INSERT INTO publishers (name) VALUES ('Muller, Daugherty and Abbott');
INSERT INTO publishers (name) VALUES ('Kshlerin-Heidenreich');
INSERT INTO publishers (name) VALUES ('Kozey LLC');
INSERT INTO publishers (name) VALUES ('Rempel, Dach and Braun');

INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Design Engineer', 5, 1, 18, 1, 1, 34.0, 48.28);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Programmer I', 58, 1, 13, 13, 0, 32.23, 45.77);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Operator', 20, 1, 1, 11, 1, 17.8, 25.28);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Assistant Media Planner', 26, 1, 14, 7, 1, 71.6, 101.67);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Data Coordiator', 36, 1, 12, 1, 1, 8.35, 11.86);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Staff Scientist', 43, 1, 16, 2, 1, 84.31, 119.72);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Tax Accountant', 13, 1, 7, 10, 1, 89.32, 126.83);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Quality Engineer', 10, 1, 19, 16, 0, 27.6, 39.19);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('GIS Technical Architect', 13, 1, 18, 10, 1, 14.89, 21.14);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('VP Quality Control', 45, 1, 8, 8, 1, 75.47, 107.17);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Programmer IV', 11, 1, 10, 11, 1, 22.46, 31.89);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Marketing Manager', 6, 1, 20, 7, 1, 83.46, 118.51);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Quality Control Specialist', 55, 1, 9, 4, 1, 54.4, 77.25);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Account Coordinator', 39, 1, 18, 1, 1, 8.16, 11.59);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Environmental Tech', 28, 1, 15, 12, 1, 60.07, 85.3);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Internal Auditor', 20, 1, 9, 8, 1, 39.91, 56.67);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Media Manager I', 34, 1, 20, 0, 1, 37.11, 52.7);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Structural Engineer', 22, 1, 16, 7, 1, 12.21, 17.34);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Pharmacist', 43, 1, 11, 5, 1, 36.86, 52.34);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Software Engineer II', 17, 1, 16, 6, 1, 83.36, 118.37);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Luxury Goods', 29, 2, 18, 14, 1, 58.77, 83.45);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Aerodynamics', 60, 2, 7, 4, 1, 54.41, 77.26);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Business Ideas', 2, 2, 9, 6, 1, 16.09, 22.85);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Cinema 4D', 41, 2, 6, 9, 1, 68.98, 97.95);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('HP NonStop', 35, 2, 1, 10, 1, 80.84, 114.79);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('QAQC', 10, 2, 1, 8, 1, 92.75, 131.71);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('TPL', 33, 2, 15, 5, 0, 31.66, 44.96);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('iOS Development', 53, 2, 1, 14, 1, 3.4, 4.83);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Curriculum Design', 47, 2, 14, 5, 1, 69.05, 98.05);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Freight Forwarding', 22, 2, 1, 9, 1, 26.34, 37.4);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Legal Documents', 12, 2, 1, 2, 1, 91.85, 130.43);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('FPSO', 31, 2, 7, 16, 1, 95.95, 136.25);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Fur: An Imaginary Portrait of Diane Arbus', 19, 3, 6, 15, 0, 97.42, 138.34);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Legally Blonde 2: Red, White & Blonde', 58, 3, 11, 5, 1, 81.02, 115.05);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Cinderfella', 16, 3, 11, 16, 0, 31.76, 45.1);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Ocean''s Eleven', 56, 3, 3, 16, 0, 42.47, 60.31);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('49 Up', 32, 3, 20, 3, 1, 47.28, 67.14);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Love Steaks', 40, 3, 20, 5, 1, 76.48, 108.6);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('If You Could Only Cook', 33, 3, 6, 16, 1, 67.64, 96.05);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Riding the Bullet', 34, 3, 9, 12, 1, 64.37, 91.41);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Terumae romae (Thermae Romae)', 42, 3, 3, 6, 1, 89.33, 126.85);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Slugger''s Wife, The', 24, 3, 1, 1, 1, 58.11, 82.52);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Brats, The (Les gamins)', 12, 3, 12, 4, 1, 55.15, 78.31);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Kind Lady', 23, 3, 7, 0, 1, 65.08, 92.41);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Oh, Heavenly Dog!', 53, 3, 14, 7, 1, 48.94, 69.49);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Dragon Ball Z: Dead Zone', 45, 3, 9, 16, 0, 50.35, 71.5);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Dangerous Lives of Altar Boys, The', 4, 3, 3, 3, 1, 88.83, 126.14);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Spy Hard', 2, 3, 4, 10, 0, 76.07, 108.02);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Puccini for Beginners', 23, 3, 10, 13, 1, 97.87, 138.98);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Theatre of Blood', 57, 3, 11, 2, 0, 57.17, 81.18);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Green Lantern: First Flight', 59, 3, 4, 5, 1, 33.76, 47.94);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Comin'' at Ya!', 18, 3, 5, 5, 1, 99.99, 141.99);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Antitrust', 49, 3, 18, 9, 1, 44.84, 63.67);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Beautiful Mind, A', 43, 3, 15, 13, 1, 52.23, 74.17);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('And Now My Love (Toute une vie)', 18, 3, 1, 15, 1, 86.97, 123.5);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Counterfeiters, The (Le cave se rebiffe)', 21, 3, 19, 9, 1, 84.47, 119.95);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Elevator Girl', 28, 3, 2, 8, 1, 68.03, 96.6);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Titfield Thunderbolt, The', 56, 3, 18, 0, 1, 40.53, 57.55);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Advance to the Rear', 52, 3, 12, 3, 1, 53.97, 76.64);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Grand Amour, Le', 1, 3, 3, 12, 1, 99.43, 141.19);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Star Trek VI: The Undiscovered Country', 60, 3, 4, 0, 0, 89.59, 127.22);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('One 2 Ka 4', 19, 3, 8, 0, 1, 33.14, 47.06);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Honky Tonk Freeway', 50, 3, 4, 16, 0, 73.19, 103.93);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Wrongfully Accused', 35, 3, 14, 14, 1, 83.26, 118.23);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Piranhaconda', 15, 3, 6, 11, 1, 55.69, 79.08);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Grand Theft Auto', 55, 3, 3, 11, 0, 77.74, 110.39);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Wholly Moses', 56, 3, 14, 14, 1, 88.34, 125.44);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Asteraceae', 42, 4, 15, 15, 1, 66.75, 94.79);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Cactaceae', 27, 4, 11, 16, 1, 86.57, 122.93);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Asteraceae', 14, 4, 8, 10, 1, 59.29, 84.19);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Aspleniaceae', 4, 4, 4, 16, 0, 22.89, 32.5);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Poaceae', 3, 4, 4, 0, 1, 86.79, 123.24);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Onagraceae', 48, 4, 6, 10, 1, 74.26, 105.45);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Cactaceae', 60, 4, 3, 2, 1, 24.39, 34.63);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Fabaceae', 14, 4, 12, 7, 1, 41.46, 58.87);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Aceraceae', 59, 4, 11, 9, 1, 33.75, 47.93);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Saxifragaceae', 2, 4, 2, 7, 1, 96.75, 137.39);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Anacardiaceae', 60, 4, 13, 15, 0, 22.07, 31.34);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Celastraceae', 29, 4, 2, 9, 1, 67.41, 95.72);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Cyperaceae', 1, 4, 11, 3, 1, 64.48, 91.56);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Orchidaceae', 4, 4, 7, 13, 1, 67.7, 96.13);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Fabaceae', 45, 4, 14, 5, 1, 30.9, 43.88);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Fabaceae', 37, 4, 20, 5, 1, 81.21, 115.32);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Brassicaceae', 56, 4, 2, 3, 1, 49.17, 69.82);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Arecaceae', 51, 4, 7, 16, 0, 82.39, 116.99);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Hedgehog, south african', 37, 5, 4, 11, 0, 83.85, 119.07);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Columbian rainbow boa', 4, 5, 1, 2, 1, 95.32, 135.35);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Mongoose, eastern dwarf', 11, 5, 15, 16, 1, 37.54, 53.31);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Jackal, black-backed', 25, 5, 15, 8, 1, 56.65, 80.44);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Fowl, helmeted guinea', 58, 5, 10, 11, 1, 36.03, 51.16);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Pintail, white-cheeked', 9, 5, 17, 7, 1, 32.66, 46.38);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Siskin, yellow-rumped', 38, 5, 17, 4, 1, 35.47, 50.37);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Duck, mountain', 7, 5, 12, 8, 1, 66.28, 94.12);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Steenbok', 29, 5, 6, 4, 0, 22.19, 31.51);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Elephant, african', 18, 5, 11, 3, 1, 72.13, 102.42);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Langur, common', 8, 5, 1, 1, 1, 39.67, 56.33);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Stork, yellow-billed', 45, 5, 20, 9, 1, 62.29, 88.45);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Pelican, great white', 21, 5, 5, 3, 1, 72.42, 102.84);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Tammar wallaby', 53, 5, 12, 10, 0, 57.98, 82.33);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Tortoise, asian foreset', 54, 5, 16, 8, 1, 92.86, 131.86);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Gulls (unidentified)', 3, 5, 20, 15, 1, 91.54, 129.99);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Hornbill, leadbeateri''s ground', 21, 5, 2, 0, 0, 89.58, 127.2);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('American marten', 40, 5, 7, 6, 0, 61.37, 87.15);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Poland', 27, 6, 20, 5, 1, 58.64, 83.27);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('China', 23, 6, 14, 6, 1, 60.79, 86.32);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Czech Republic', 14, 6, 6, 4, 0, 40.03, 56.84);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Russia', 23, 6, 14, 0, 1, 62.34, 88.52);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('France', 5, 6, 5, 12, 1, 51.78, 73.53);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Portugal', 48, 6, 20, 4, 1, 45.24, 64.24);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Kazakhstan', 37, 6, 5, 3, 1, 81.33, 115.49);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Mongolia', 40, 6, 2, 4, 1, 28.01, 39.77);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Russia', 15, 6, 11, 14, 1, 49.43, 70.19);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('China', 30, 6, 17, 3, 1, 73.89, 104.92);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Serbia', 32, 6, 13, 15, 0, 25.01, 35.51);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Greece', 35, 6, 12, 3, 1, 55.71, 79.11);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Malaysia', 46, 6, 15, 0, 0, 31.22, 44.33);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Portugal', 41, 6, 5, 0, 0, 67.45, 95.78);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Indonesia', 11, 6, 11, 0, 1, 28.68, 40.73);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Russia', 2, 6, 12, 8, 1, 66.69, 94.7);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Spain', 42, 6, 2, 3, 0, 71.28, 101.22);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('France', 44, 6, 12, 8, 0, 29.46, 41.83);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Malaysia', 57, 6, 15, 2, 0, 70.33, 99.87);
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price) VALUES ('Colombia', 45, 6, 12, 13, 0, 69.81, 99.13);

INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-06-18', '2018-06-20', '247138807-8', 28, 28);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-12-20', '2018-12-21', '006864252-0', 15, 15);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2019-01-11', '2019-01-13', '834527078-6', 30, 30);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2019-01-03', '2019-01-04', '203630396-X', 25, 25);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-10-05', '2018-10-07', '675125136-X', 4, 4);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-09-12', '2018-09-13', '186334916-2', 7, 7);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-03-15', '2018-03-16', '919294622-4', 19, 19);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-04-03', '2018-04-04', '526507518-6', 29, 29);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-02-05', '2018-02-07', '158310294-9', 17, 17);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-09-10', '2018-09-11', '570242931-1', 13, 13);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-04-23', '2018-04-25', '884688898-7', 17, 17);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-09-05', '2018-09-06', '741573566-8', 2, 2);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-05-25', '2018-05-26', '735984955-1', 26, 26);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-11-14', '2018-11-15', '376986252-X', 8, 8);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-02-25', '2018-02-26', '314541429-1', 20, 20);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-09-30', '2018-10-01', '157258424-6', 22, 22);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-09-18', '2018-09-19', '168194992-X', 22, 22);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-12-20', '2018-12-21', '233359537-X', 20, 20);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-04-23', '2018-04-25', '380186927-X', 26, 26);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-03-04', '2018-03-05', '088891140-8', 28, 28);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-10-02', '2018-10-03', '022875467-4', 6, 6);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2019-01-13', '2019-01-14', '676732293-8', 22, 22);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-08-06', '2018-08-07', '132876894-5', 11, 11);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-06-04', '2018-06-05', '899115955-9', 1, 1);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-11-09', '2018-11-10', '101857028-4', 12, 12);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-01-24', '2018-01-25', '000960748-X', 5, 5);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-05-26', '2018-05-27', '436460165-9', 15, 15);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-05-29', '2018-05-30', '109847242-X', 18, 18);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-05-13', '2018-05-14', '062015900-6', 10, 10);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-04-16', '2018-04-18', '093414233-5', 23, 23);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2019-01-01', '2019-01-03', '795661496-1', 9, 9);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-07-03', '2018-07-05', '763156273-3', 20, 20);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-08-19', '2018-08-20', '682143814-5', 19, 19);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-08-23', '2018-08-24', '568668735-8', 3, 3);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-08-21', '2018-08-22', '478388385-8', 29, 29);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-04-20', '2018-04-21', '843480172-8', 18, 18);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-04-18', '2018-04-20', '147298021-2', 29, 29);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-11-13', '2018-11-14', '796928519-8', 28, 28);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-04-01', '2018-04-02', '521421426-X', 13, 13);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-07-20', '2018-07-21', '661552263-2', 21, 21);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-12-19', '2018-12-20', '321716667-1', 3, 31);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-03-20', '2018-03-21', '171486566-5', 8, 32);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-02-27', '2018-02-28', '710625588-2', 26, 33);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-05-22', '2018-05-24', '551105220-5', 25, 34);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-11-22', '2018-11-23', '123089901-4', 15, 35);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-10-11', '2018-10-13', '911841547-4', 1, 36);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-07-23', '2018-07-24', '572311137-X', 14, 37);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-03-10', '2018-03-12', '988685424-3', 18, 38);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-03-27', '2018-03-28', '519279121-9', 8, 32);
INSERT INTO purchases (purchase_date, sent_date, package_num, client_id, address_id) VALUES ('2018-03-16', '2018-03-17', '623083862-1', 14, 37);

INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (8, 80, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 51, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (29, 30, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (36, 63, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (33, 40, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (2, 82, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (1, 2, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (30, 51, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (24, 58, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (1, 21, 2);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (30, 4, 2);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (36, 43, 2);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (20, 7, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (15, 26, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (6, 91, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (29, 71, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (33, 110, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (36, 44, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (17, 1, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (3, 62, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (13, 32, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (3, 30, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (16, 31, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (34, 23, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (31, 89, 3);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 30, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (35, 76, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (6, 100, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (30, 39, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (25, 74, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 115, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (19, 56, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (31, 50, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (32, 8, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (27, 120, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (22, 27, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (35, 64, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (10, 16, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (24, 109, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (27, 40, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (2, 51, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (36, 67, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (4, 5, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (3, 94, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 122, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (17, 103, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (24, 101, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (22, 40, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (34, 26, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (14, 74, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (32, 99, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (27, 79, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (13, 115, 3);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (4, 48, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (19, 76, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (20, 101, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (13, 121, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (21, 62, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (12, 117, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (17, 40, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (11, 16, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 19, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (1, 48, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (10, 25, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (26, 103, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (18, 78, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (31, 40, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (11, 13, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (18, 23, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (12, 14, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (14, 91, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 5, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (22, 58, 3);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (18, 92, 2);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 27, 3);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (31, 25, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (6, 1, 2);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 81, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (32, 60, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (22, 8, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 62, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 72, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (22, 116, 2);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (14, 56, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (24, 104, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (10, 69, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (3, 81, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (3, 28, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (8, 38, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (6, 45, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (6, 60, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (24, 89, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 11, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (15, 118, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (8, 1, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (18, 55, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (12, 34, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (14, 36, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (24, 102, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (19, 58, 5);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (6, 1, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (7, 6, 3);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (13, 62, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (19, 108, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (32, 65, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (21, 113, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (8, 12, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (4, 53, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (2, 28, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (1, 96, 3);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (11, 98, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (21, 27, 5);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (2, 77, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (30, 42, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (21, 99, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (6, 115, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (8, 75, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (19, 59, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (20, 97, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (26, 112, 5);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (26, 36, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (22, 87, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 110, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 18, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (8, 39, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (2, 73, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (34, 93, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (32, 118, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (4, 24, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (25, 75, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (7, 79, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (7, 92, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 79, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (4, 62, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (31, 118, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (4, 69, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 11, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (3, 38, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (29, 10, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (19, 13, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (32, 37, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (7, 101, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 25, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 68, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (21, 104, 2);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (33, 12, 3);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (20, 110, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (7, 77, 5);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 12, 3);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (25, 112, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (5, 49, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (14, 68, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (22, 113, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (31, 66, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (2, 3, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (7, 95, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (6, 23, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (31, 3, 3);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (2, 93, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (8, 94, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (21, 36, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (8, 120, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (7, 78, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (22, 59, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (6, 60, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (14, 38, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (15, 15, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (6, 86, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (24, 116, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (7, 95, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (2, 29, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (27, 3, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (3, 77, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (16, 72, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (13, 13, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (16, 20, 5);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (16, 92, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 106, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 5, 2);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (13, 87, 2);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (4, 82, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (14, 106, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (8, 109, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (26, 40, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (12, 21, 5);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (8, 20, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (2, 86, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (29, 96, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (31, 19, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (29, 11, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (24, 32, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (32, 105, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (4, 2, 4);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (16, 17, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (4, 123, 3);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (9, 47, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (23, 53, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (1, 51, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (36, 63, 1);
INSERT INTO purchased_books (purchase_id, book_id, pcs) VALUES (36, 6, 1);

START TRANSACTION;
UPDATE books SET sell_price = ROUND(sell_price * 0.9, 2) WHERE publisher_id = 2;
COMMIT;

DELIMITER //

CREATE PROCEDURE add_book(IN n VARCHAR(50), a INT, c INT, p INT, pcs INT, act BOOLEAN, buy_p FLOAT, sell_p FLOAT)
BEGIN
START TRANSACTION;
INSERT INTO books (name, author_id, category_id, publisher_id, pieces, active, buy_price, sell_price)
VALUES (n, a, c, p, pcs, act, buy_p, sell_p);
COMMIT;
END
//

CREATE PROCEDURE calculate_total()
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE tmp_id INT;
DECLARE sum_tmp FLOAT;
DECLARE cur1 CURSOR FOR SELECT id FROM purchases;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN cur1;
WHILE done = 0 DO
FETCH cur1 INTO tmp_id;
START TRANSACTION;
SELECT SUM(purchased_books.pcs * books.sell_price) INTO sum_tmp FROM purchased_books
INNER JOIN books ON purchased_books.book_id = books.id AND purchased_books.purchase_id = tmp_id;
IF (SELECT purchases.total FROM purchases WHERE purchases.id = tmp_id) = 0 THEN
UPDATE purchases SET purchases.total = sum_tmp WHERE purchases.id = tmp_id;
COMMIT;
END IF;
END WHILE;
CLOSE cur1;
END
//

DELIMITER ;

CALL calculate_total();
CALL add_book('Poland', '11', '6', '3', '2', '1', '32.88', '50.99');
