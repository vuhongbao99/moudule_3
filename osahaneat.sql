create database osahaneat;
use osahaneat;
create table roles(
 id int auto_increment,
 role_name varchar(20),
 create_date timestamp,
 primary key (id)
);
create table users(
 id int auto_increment,
 user_name varchar(100) ,
 passwords varchar(100) ,
 full_name varchar(100) ,
 create_date timestamp,
 role_id int,
 
 primary key(id)
 
);

create table rating_food(
 id int auto_increment,
 user_id int,
 food_id int,
 content text,
 rate_point int (5),
 
 primary key (id)
);



create table category(
  id int auto_increment,
  name_cate varchar(100),
  create_date timestamp,
  
  primary key (id)
);

create table food(
id int auto_increment,
title varchar(255),
image text,
time_ship varchar(10),
price decimal,
cate_id int,

primary key(id)
);


create table rating_restaurant(
 id int auto_increment,
 user_id int,
 res_id int,
 content text,
 rate_point int(5) ,
 
 
 primary key (id)
);

create table orders(
id int auto_increment,
user_id int,
res_id int ,
create_date timestamp,

primary key(id)
);

create table menu_restaurant(
cate_id int,
res_id int,
create_date timestamp,

primary key(cate_id,res_id)
);

create table restaurant(
 id int auto_increment,
 title varchar(255),
 subtitle varchar(255),
 descript text,
 image text,
 is_freeship boolean,
 address varchar(255),
 open_date timestamp,
 
 primary key(id)
);

create table promo(
  id int auto_increment,
  res_id int,
  percent int,
  start_date timestamp,
  end_date timestamp,
  
  primary key(id)
  
);

create table order_item(
 order_id int,
 food_id int,
 create_date timestamp,
 
 primary key(order_id,food_id)
);

alter table users add constraint fk_user_role_id foreign key (role_id) references roles(id);
alter table rating_food add constraint fk_rating_food_user_id foreign key (user_id) references users(id);
alter table rating_food add constraint fk_rating_food_food_id foreign key (food_id) references food(id);
alter table food add constraint fk_food_cate_id foreign key (cate_id) references category(id);
alter table rating_restaurant add constraint fk_rating_restaurant_user_id foreign key (user_id) references users(id);
alter table rating_restaurant add constraint fk_rating_restaurant_res_id foreign key (res_id) references restaurant(id);
alter table orders add constraint fk_orders_user_id foreign key (user_id) references users(id);
alter table orders add constraint fk_orders_res_id foreign key (res_id) references restaurant(id);
alter table order_item add constraint fk_order_item_order_id foreign key (order_id) references orders(id);
alter table order_item add constraint fk_order_item_food_id foreign key (food_id) references food(id);
alter table menu_restaurant add constraint fk_menu_restaurant_cate_id foreign key (cate_id) references category(id);
alter table menu_restaurant add constraint fk_menu_restaurant_res_id foreign key (res_id) references restaurant(id);
alter table promo add constraint fk_promo_res_id foreign key (res_id) references restaurant(id);


-- Sample data for OsahanEat database

-- Insert roles
INSERT INTO roles (role_name, create_date) VALUES
('Admin', NOW()),
('Customer', NOW());

-- Insert users
INSERT INTO users (user_name, passwords, full_name, create_date, role_id) VALUES
('admin', 'admin123', 'System Administrator', NOW(), 1),
('john_doe', 'password123', 'John Doe', NOW(), 2),
('jane_smith', 'password123', 'Jane Smith', NOW(), 2),
('mike_wilson', 'password123', 'Mike Wilson', NOW(), 2),
('alice_brown', 'password123', 'Alice Brown', NOW(), 2),
('bob_jones', 'password123', 'Bob Jones', NOW(), 2),
('mary_johnson', 'password123', 'Mary Johnson', NOW(), 2),
('david_lee', 'password123', 'David Lee', NOW(), 2),
('sarah_davis', 'password123', 'Sarah Davis', NOW(), 2),
('tom_nguyen', 'password123', 'Tom Nguyen', NOW(), 2);

-- Insert categories
INSERT INTO category (name_cate, create_date) VALUES
('Vietnamese Food', NOW()),
('Fast Food', NOW()),
('Pizza', NOW()),
('Asian Cuisine', NOW()),
('Desserts', NOW()),
('Drinks', NOW()),
('Seafood', NOW()),
('Vegetarian', NOW());

-- Insert restaurants
INSERT INTO restaurant (title, subtitle, descript, image, is_freeship, address, open_date) VALUES
('Pho Saigon', 'Authentic Vietnamese Cuisine', 'Traditional Vietnamese pho and other local dishes made with fresh ingredients', 'pho_saigon.jpg', true, '123 Nguyen Hue Street, District 1, Ho Chi Minh City', NOW()),
('Pizza Corner', 'Best Pizza in Town', 'Wood-fired pizzas with fresh toppings and homemade sauce', 'pizza_corner.jpg', false, '456 Le Loi Street, District 3, Ho Chi Minh City', NOW()),
('Burger Palace', 'Premium Burgers & Fries', 'Gourmet burgers made with premium beef and fresh vegetables', 'burger_palace.jpg', true, '789 Dong Khoi Street, District 1, Ho Chi Minh City', NOW()),
('Sushi Master', 'Fresh Japanese Sushi', 'Authentic Japanese sushi and sashimi prepared by experienced chefs', 'sushi_master.jpg', false, '321 Pasteur Street, District 3, Ho Chi Minh City', NOW()),
('Sweet Dreams Bakery', 'Delicious Cakes & Pastries', 'Fresh baked goods, cakes, and desserts made daily', 'sweet_dreams.jpg', true, '654 Hai Ba Trung Street, District 1, Ho Chi Minh City', NOW()),
('Ocean Fresh', 'Premium Seafood Restaurant', 'Fresh seafood dishes with Vietnamese and international flavors', 'ocean_fresh.jpg', false, '987 Nguyen Thai Hoc Street, District 1, Ho Chi Minh City', NOW()),
('Green Garden', 'Healthy Vegetarian Options', 'Organic vegetarian and vegan dishes for health-conscious diners', 'green_garden.jpg', true, '147 Cach Mang Thang Tam Street, District 3, Ho Chi Minh City', NOW()),
('Milk Tea House', 'Fresh Bubble Tea & Drinks', 'Variety of milk teas, fruit juices, and refreshing beverages', 'milk_tea_house.jpg', true, '258 Nguyen Trai Street, District 5, Ho Chi Minh City', NOW());

-- Insert food items
INSERT INTO food (title, image, time_ship, price, cate_id) VALUES
-- Vietnamese Food
('Pho Bo', 'pho_bo.jpg', '20-30min', 45000, 1),
('Banh Mi Thit', 'banh_mi.jpg', '10-15min', 25000, 1),
('Com Tam', 'com_tam.jpg', '25-35min', 40000, 1),
('Bun Bo Hue', 'bun_bo_hue.jpg', '30-40min', 50000, 1),

-- Fast Food
('Classic Burger', 'burger.jpg', '15-20min', 65000, 2),
('Chicken Wings', 'wings.jpg', '20-25min', 55000, 2),
('French Fries', 'fries.jpg', '10-15min', 30000, 2),
('Fried Chicken', 'fried_chicken.jpg', '20-30min', 70000, 2),

-- Pizza
('Margherita Pizza', 'margherita.jpg', '25-35min', 120000, 3),
('Pepperoni Pizza', 'pepperoni.jpg', '25-35min', 150000, 3),
('Hawaiian Pizza', 'hawaiian.jpg', '25-35min', 140000, 3),
('Meat Lovers Pizza', 'meat_lovers.jpg', '30-40min', 180000, 3),

-- Asian Cuisine
('California Roll', 'california_roll.jpg', '20-30min', 85000, 4),
('Salmon Sashimi', 'salmon_sashimi.jpg', '15-25min', 120000, 4),
('Chicken Teriyaki', 'teriyaki.jpg', '25-35min', 95000, 4),
('Pad Thai', 'pad_thai.jpg', '20-30min', 75000, 4),

-- Desserts
('Chocolate Cake', 'chocolate_cake.jpg', '15-20min', 45000, 5),
('Tiramisu', 'tiramisu.jpg', '15-20min', 55000, 5),
('Ice Cream Sundae', 'ice_cream.jpg', '10-15min', 35000, 5),
('Cheesecake', 'cheesecake.jpg', '15-20min', 50000, 5),

-- Drinks
('Milk Tea', 'milk_tea.jpg', '10-15min', 25000, 6),
('Fresh Orange Juice', 'orange_juice.jpg', '5-10min', 20000, 6),
('Vietnamese Coffee', 'vietnamese_coffee.jpg', '10-15min', 18000, 6),
('Smoothie Bowl', 'smoothie.jpg', '15-20min', 40000, 6),

-- Seafood
('Grilled Salmon', 'grilled_salmon.jpg', '30-40min', 180000, 7),
('Shrimp Tempura', 'shrimp_tempura.jpg', '25-35min', 120000, 7),
('Fish and Chips', 'fish_chips.jpg', '25-30min', 95000, 7),
('Seafood Hotpot', 'seafood_hotpot.jpg', '40-50min', 250000, 7),

-- Vegetarian
('Vegetable Curry', 'veg_curry.jpg', '25-30min', 65000, 8),
('Quinoa Salad', 'quinoa_salad.jpg', '15-20min', 55000, 8),
('Veggie Burger', 'veggie_burger.jpg', '20-25min', 60000, 8),
('Tofu Stir Fry', 'tofu_stirfry.jpg', '20-30min', 50000, 8);

-- Insert menu_restaurant (linking categories to restaurants)
INSERT INTO menu_restaurant (cate_id, res_id, create_date) VALUES
(1, 1, NOW()), -- Vietnamese food at Pho Saigon
(2, 3, NOW()), -- Fast food at Burger Palace
(3, 2, NOW()), -- Pizza at Pizza Corner
(4, 4, NOW()), -- Asian cuisine at Sushi Master
(5, 5, NOW()), -- Desserts at Sweet Dreams Bakery
(6, 8, NOW()), -- Drinks at Milk Tea House
(7, 6, NOW()), -- Seafood at Ocean Fresh
(8, 7, NOW()), -- Vegetarian at Green Garden
(1, 7, NOW()), -- Vietnamese food also at Green Garden
(6, 5, NOW()); -- Drinks also at Sweet Dreams Bakery

-- Insert promotions
INSERT INTO promo (res_id, percent, start_date, end_date) VALUES
(1, 15, '2024-08-01 00:00:00', '2024-08-31 23:59:59'),
(2, 20, '2024-08-15 00:00:00', '2024-09-15 23:59:59'),
(3, 10, '2024-08-10 00:00:00', '2024-08-25 23:59:59'),
(4, 25, '2024-08-01 00:00:00', '2024-08-20 23:59:59'),
(5, 30, '2024-08-05 00:00:00', '2024-08-30 23:59:59'),
(6, 15, '2024-08-12 00:00:00', '2024-09-12 23:59:59'),
(7, 20, '2024-08-01 00:00:00', '2024-08-28 23:59:59'),
(8, 25, '2024-08-08 00:00:00', '2024-08-22 23:59:59');

-- Insert orders
INSERT INTO orders (user_id, res_id, create_date) VALUES
(2, 1, '2024-08-10 12:30:00'), -- John orders from Pho Saigon
(3, 2, '2024-08-11 19:45:00'), -- Jane orders from Pizza Corner
(4, 3, '2024-08-12 13:15:00'), -- Mike orders from Burger Palace
(2, 4, '2024-08-13 20:30:00'), -- John orders from Sushi Master
(9, 5, '2024-08-14 15:20:00'), -- Alice orders from Sweet Dreams
(10, 1, '2024-08-14 12:00:00'), -- Bob orders from Pho Saigon
(3, 6, '2024-08-15 18:30:00'), -- Jane orders from Ocean Fresh
(4, 7, '2024-08-15 13:45:00'), -- Mike orders from Green Garden
(9, 8, '2024-08-15 16:10:00'), -- Alice orders from Milk Tea House
(2, 2, '2024-08-15 20:00:00'); -- John orders from Pizza Corner again

-- Insert order items
INSERT INTO order_item (order_id, food_id, create_date) VALUES
-- Order 1: John's order from Pho Saigon
(1, 1, '2024-08-10 12:30:00'), -- Pho Bo
(1, 2, '2024-08-10 12:30:00'), -- Banh Mi Thit

-- Order 2: Jane's order from Pizza Corner
(2, 9, '2024-08-11 19:45:00'), -- Margherita Pizza
(2, 22, '2024-08-11 19:45:00'), -- Vietnamese Coffee

-- Order 3: Mike's order from Burger Palace
(3, 5, '2024-08-12 13:15:00'), -- Classic Burger
(3, 7, '2024-08-12 13:15:00'), -- French Fries

-- Order 4: John's order from Sushi Master
(4, 13, '2024-08-13 20:30:00'), -- California Roll
(4, 14, '2024-08-13 20:30:00'), -- Salmon Sashimi

-- Order 5: Alice's order from Sweet Dreams
(5, 17, '2024-08-14 15:20:00'), -- Chocolate Cake
(5, 19, '2024-08-14 15:20:00'), -- Ice Cream Sundae

-- Order 6: Bob's order from Pho Saigon
(6, 3, '2024-08-14 12:00:00'), -- Com Tam
(6, 22, '2024-08-14 12:00:00'), -- Vietnamese Coffee

-- Order 7: Jane's order from Ocean Fresh
(7, 25, '2024-08-15 18:30:00'), -- Grilled Salmon
(7, 26, '2024-08-15 18:30:00'), -- Shrimp Tempura

-- Order 8: Mike's order from Green Garden
(8, 29, '2024-08-15 13:45:00'), -- Vegetable Curry
(8, 30, '2024-08-15 13:45:00'), -- Quinoa Salad

-- Order 9: Alice's order from Milk Tea House
(9, 21, '2024-08-15 16:10:00'), -- Milk Tea
(9, 24, '2024-08-15 16:10:00'), -- Smoothie Bowl

-- Order 10: John's order from Pizza Corner
(10, 10, '2024-08-15 20:00:00'), -- Pepperoni Pizza
(10, 11, '2024-08-15 20:00:00'); -- Hawaiian Pizza

-- Insert food ratings
INSERT INTO rating_food (user_id, food_id, content, rate_point) VALUES
(2, 1, 'Amazing pho! Very authentic taste and fresh ingredients.', 5),
(2, 2, 'Great banh mi, crispy bread and tasty filling.', 4),
(3, 9, 'Perfect margherita pizza, love the thin crust!', 5),
(4, 5, 'Juicy burger, cooked perfectly. Will order again.', 4),
(4, 7, 'Fries were crispy and well-seasoned.', 4),
(2, 13, 'Fresh sushi roll, very good quality fish.', 5),
(2, 14, 'Excellent sashimi, melts in your mouth.', 5),
(9, 17, 'Rich chocolate cake, not too sweet. Perfect!', 5),
(9, 19, 'Delicious ice cream with great toppings.', 4),
(10, 3, 'Com tam was flavorful and portion was generous.', 4),
(3, 25, 'Perfectly grilled salmon, very fresh.', 5),
(3, 26, 'Crispy tempura with great dipping sauce.', 4),
(4, 29, 'Healthy and tasty vegetable curry.', 4),
(4, 30, 'Fresh quinoa salad with good mix of vegetables.', 4),
(9, 21, 'Best milk tea in town! Perfect sweetness.', 5);

-- Insert restaurant ratings
INSERT INTO rating_restaurant (user_id, res_id, content, rate_point) VALUES
(2, 1, 'Excellent Vietnamese restaurant! Authentic food and great service.', 5),
(3, 2, 'Best pizza place in the area. Always consistent quality.', 5),
(4, 3, 'Great burgers and fast service. Highly recommended.', 4),
(2, 4, 'Amazing sushi quality. Fresh fish and skilled chefs.', 5),
(9, 5, 'Perfect place for desserts. Everything is freshly made.', 5),
(10, 1, 'Great pho and friendly staff. Will definitely come back.', 4),
(3, 6, 'Fresh seafood and excellent preparation. A bit pricey but worth it.', 4),
(4, 7, 'Love the healthy options. Great for vegetarians.', 4),
(9, 8, 'Best milk tea shop! So many flavors to choose from.', 5),
(2, 2, 'Ordered pizza for delivery, arrived hot and delicious.', 4);

