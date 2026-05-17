

-- that is default script for setupping tables in app db

-- this script will not run if there is already installed database
-- that IS ansible work to create db and set up tables

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE,
    is_email_confirmed BOOLEAN DEFAULT FALSE,
    date_of_joining TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    seller_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    description VARCHAR(1000),
    stock_quantity INT DEFAULT 0
);

CREATE TABLE product_comments (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    is_user_purchased BOOLEAN DEFAULT FALSE,
    comment VARCHAR(500) NOT NULL,
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE INDEX product_comments_product_id ON product_comments(product_id);
CREATE INDEX products_name ON products(name);