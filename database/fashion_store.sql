CREATE DATABASE fashion_store;

USE fashion_store;

CREATE TABLE users (

    user_id INT PRIMARY KEY AUTO_INCREMENT,

    full_name VARCHAR(100),

    email VARCHAR(150) UNIQUE,

    phone VARCHAR(15),

    password VARCHAR(255)
);
CREATE TABLE categories (

    category_id INT PRIMARY KEY AUTO_INCREMENT,

    category_name VARCHAR(100),

    description TEXT
);
CREATE TABLE products (

    product_id INT PRIMARY KEY AUTO_INCREMENT,

    category_id INT,

    product_name VARCHAR(150),

    brand VARCHAR(100),

    description TEXT,

    price DECIMAL(10,2),

    image_url VARCHAR(255),

    FOREIGN KEY (category_id)
    REFERENCES categories(category_id)
);
CREATE TABLE product_variants (

    variant_id INT PRIMARY KEY AUTO_INCREMENT,

    product_id INT,

    size_label VARCHAR(10),

    stock_quantity INT,

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);
CREATE TABLE cart (

    cart_id INT PRIMARY KEY AUTO_INCREMENT,

    user_id INT,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);
CREATE TABLE cart_items (

    cart_item_id INT PRIMARY KEY AUTO_INCREMENT,

    cart_id INT,

    product_id INT,

    variant_id INT,

    quantity INT,

    unit_price DECIMAL(10,2),

    FOREIGN KEY (cart_id)
    REFERENCES cart(cart_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id),

    FOREIGN KEY (variant_id)
    REFERENCES product_variants(variant_id)
);
CREATE TABLE orders (

    order_id INT PRIMARY KEY AUTO_INCREMENT,

    user_id INT,

    total_amount DECIMAL(10,2),

    payment_method VARCHAR(50),

    order_status VARCHAR(50),

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);

CREATE TABLE order_items (

    order_item_id INT PRIMARY KEY AUTO_INCREMENT,

    order_id INT,

    product_id INT,

    quantity INT,

    unit_price DECIMAL(10,2),

    subtotal DECIMAL(10,2),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);
CREATE TABLE product_images (

    image_id INT PRIMARY KEY AUTO_INCREMENT,

    product_id INT,

    image_url VARCHAR(255),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);
INSERT INTO users
(full_name, email, phone, password)

VALUES

(
'Ramya BH',
'ramya@example.com',
'9876543211',
'ramya123'
),

(
'Karthik R',
'karthik@example.com',
'9876505678',
'karthik123'
);
INSERT INTO categories
(category_name, description)

VALUES

(
'Men',
'Men fashion clothing'
),

(
'Women',
'Women fashion clothing'
),

(
'Kids',
'Kids fashion clothing'
),

(
'Accessories',
'Fashion accessories'
);
INSERT INTO products
(product_id, category_id, product_name, brand, description, price, image_url)

VALUES

/* MEN */

(1, 1, 'Black Casual Shirt', 'Roadster',
'Men black casual cotton shirt',
1299.00,
'/assets/images/products/men/black_shirt.jpg'),

(2, 1, 'Blue Slim Fit Jeans', 'Levis',
'Men blue slim fit stretch jeans',
1999.00,
'/assets/images/products/men/blue_jeans.jpg'),

(3, 1, 'White Polo T-Shirt', 'US Polo',
'Men white polo t-shirt with collar',
999.00,
'/assets/images/products/men/polo.jpg'),

(12, 1, 'Green Hoodie', 'H&M',
'Men green cotton hoodie',
1899.00,
'/assets/images/products/men/hoodie.jpg'),

/* WOMEN */

(4, 2, 'Floral Summer Dress', 'Zara',
'Women floral printed summer dress',
2499.00,
'/assets/images/products/women/dress.jpg'),

(6, 2, 'Black High Waist Jeans', 'Only',
'Women black high waist jeans',
2199.00,
'/assets/images/products/women/jeans.jpg'),

(13, 2, 'Traditional Saree', 'Kalanjali',
'Beautiful traditional silk saree',
3499.00,
'/assets/images/products/women/saree.jpg'),

/* KIDS */

(7, 3, 'Boys Checked Shirt', 'Max',
'Boys checked casual shirt',
899.00,
'/assets/images/products/kids/shirt.jpg'),

/* ACCESSORIES */

(9, 4, 'Leather Belt', 'Allen Solly',
'Brown leather belt for men',
799.00,
'/assets/images/products/accessories/belt.jpg'),

(10, 4, 'Women Handbag', 'Caprese',
'Stylish handbag for women',
2299.00,
'/assets/images/products/accessories/handbag.jpg'),

(11, 4, 'Unisex Cap', 'Puma',
'Adjustable unisex casual cap',
599.00,
'/assets/images/products/accessories/cap.jpg'),

(14, 4, 'Luxury Sunglasses', 'RayBan',
'Premium black stylish sunglasses',
2499.00,
'/assets/images/products/accessories/sunglasses.jpg'),

(15, 4, 'Silver Watch', 'Titan',
'Modern premium silver wrist watch',
3999.00,
'/assets/images/products/accessories/watch.jpg'),

(16, 4, 'Gold Necklace', 'Tanishq',
'Beautiful luxury gold necklace',
5999.00,
'/assets/images/products/accessories/jewellery.jpg'),

(17, 4, 'White Sneakers', 'Nike',
'Modern white casual sneakers',
3499.00,
'/assets/images/products/accessories/shoes.jpg');

INSERT INTO product_variants
(product_id, size_label, stock_quantity)

VALUES

(1, 'S', 10),
(1, 'M', 15),
(1, 'L', 12),

(2, '30', 10),
(2, '32', 14),

(3, 'S', 9),
(3, 'M', 14),

(4, 'M', 8),
(4, 'L', 5);

INSERT INTO cart
(cart_id, user_id)

VALUES

(1, 1),
(2, 2);

INSERT INTO cart_items
(cart_id, product_id, variant_id, quantity, unit_price)

VALUES

(
1,
1,
1,
2,
1299.00
),

(
1,
3,
6,
1,
999.00
),

(
2,
2,
4,
1,
1999.00
);

INSERT INTO orders
(user_id, total_amount, payment_method, order_status)

VALUES

(
1,
3597.00,
'Cash On Delivery',
'PLACED'
),

(
2,
1999.00,
'UPI',
'PLACED'
);

INSERT INTO order_items
(order_id, product_id, quantity, unit_price, subtotal)

VALUES

(
1,
1,
2,
1299.00,
2598.00
),

(
1,
3,
1,
999.00,
999.00
),

(
2,
2,
1,
1999.00,
1999.00
);

INSERT INTO product_images
(product_id, image_url)

VALUES

(
1,
'/assets/images/products/men/black_shirt.jpg'
),

(
2,
'/assets/images/products/men/blue_jeans.jpg'
),

(
3,
'/assets/images/products/men/polo.jpg'
),

(
4,
'/assets/images/products/women/dress.jpg'
),

(
14,
'/assets/images/products/accessories/sunglasses.jpg'
),

(
15,
'/assets/images/products/accessories/watch.jpg'
);
CREATE TABLE wishlist (
    wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,

    UNIQUE(user_id, product_id),

    CONSTRAINT fk_wishlist_user
    FOREIGN KEY (user_id)
    REFERENCES users(user_id),

    CONSTRAINT fk_wishlist_product
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

CREATE TABLE admins(
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) DEFAULT 'ADMIN',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users
ADD address_line1 VARCHAR(200),
ADD address_line2 VARCHAR(200),
ADD city VARCHAR(100),
ADD state VARCHAR(100),
ADD pincode VARCHAR(20),
ADD country VARCHAR(100),
ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE products
ADD rating DECIMAL(2,1) DEFAULT 0,
ADD review_count INT DEFAULT 0,
ADD discount_percent DECIMAL(5,2) DEFAULT 0,
ADD active BOOLEAN DEFAULT TRUE;

CREATE TABLE reviews(

review_id INT AUTO_INCREMENT PRIMARY KEY,

product_id INT,

user_id INT,

rating INT CHECK(rating BETWEEN 1 AND 5),

review TEXT,

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY(product_id)
REFERENCES products(product_id),

FOREIGN KEY(user_id)
REFERENCES users(user_id)

);

CREATE TABLE payments(

payment_id INT AUTO_INCREMENT PRIMARY KEY,

order_id INT,

payment_method VARCHAR(50),

gateway_payment_id VARCHAR(200),

payment_status VARCHAR(50),

amount DECIMAL(10,2),

paid_at TIMESTAMP,

FOREIGN KEY(order_id)
REFERENCES orders(order_id)

);

ALTER TABLE orders

ADD order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

ADD confirmed_at TIMESTAMP NULL,

ADD packed_at TIMESTAMP NULL,

ADD shipped_at TIMESTAMP NULL,

ADD delivered_at TIMESTAMP NULL;

CREATE TABLE coupons(

coupon_id INT AUTO_INCREMENT PRIMARY KEY,

code VARCHAR(50),

discount_percent INT,

minimum_amount DECIMAL(10,2),

expiry_date DATE,

active BOOLEAN

);

CREATE TABLE user_addresses(

address_id INT AUTO_INCREMENT PRIMARY KEY,

user_id INT,

receiver_name VARCHAR(100),

phone VARCHAR(15),

address TEXT,

city VARCHAR(100),

state VARCHAR(100),

pincode VARCHAR(20),

country VARCHAR(100),

FOREIGN KEY(user_id)
REFERENCES users(user_id)

);

ALTER TABLE product_variants

ADD reserved_quantity INT DEFAULT 0;

SELECT

SUM(total_amount)

FROM orders

WHERE order_status='DELIVERED';

SELECT

MONTH(order_date),

SUM(total_amount)

FROM orders

GROUP BY MONTH(order_date);

SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM orders;
SELECT SUM(total_amount)
FROM orders
WHERE order_status='DELIVERED';

SHOW TABLES;
DESCRIBE users;
DESCRIBE orders;
SELECT * FROM admins;
DESCRIBE admins;

INSERT INTO admins(name,email,password)
VALUES
('Administrator','admin@mydresscode.com','admin123');
SELECT * FROM admins;

SELECT user_id,
       full_name,
       address_line1,
       address_line2,
       city,
       state,
       pincode,
       country
FROM users
WHERE user_id = 1;

UPDATE users
SET address_line1 = '12 MG Road',
    address_line2 = 'Near Bus Stand',
    city = 'Bengaluru',
    state = 'Karnataka',
    pincode = '560001',
    country = 'India'
WHERE user_id = 2;

UPDATE users
SET
    address_line1 = '101 Station Road',
    address_line2 = 'Vidyanagar',
    city = 'Hubballi',
    state = 'Karnataka',
    pincode = '580021',
    country = 'India'
WHERE user_id = 1;
