-- トランザクションの開始
START TRANSACTION;

-- データベースの作成
CREATE DATABASE IF NOT EXISTS db_coordinate;

-- 使用するデータベースを選択
USE db_coordinate;

-- テーブルの作成
CREATE TABLE IF NOT EXISTS user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT,
    sex CHAR(1),
    UNIQUE (name) -- ユニーク制約の追加
);

CREATE TABLE IF NOT EXISTS category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL,
    UNIQUE (category_name) -- ユニーク制約の追加
);

CREATE TABLE IF NOT EXISTS clothes (
    clothes_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    category_id INT,
    color VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    INDEX (color) -- インデックスの追加
);

CREATE TABLE IF NOT EXISTS coordinate (
    coord_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    scene_id INT,
    name VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (scene_id) REFERENCES scene(scene_id)
);

CREATE TABLE IF NOT EXISTS coordinate_clothes (
    coord_id INT,
    clothes_id INT,
    PRIMARY KEY (coord_id, clothes_id),
    FOREIGN KEY (coord_id) REFERENCES coordinate(coord_id),
    FOREIGN KEY (clothes_id) REFERENCES clothes(clothes_id)
);

CREATE TABLE IF NOT EXISTS scene (
    scene_id INT PRIMARY KEY AUTO_INCREMENT,
    scene_name VARCHAR(255) NOT NULL,
    UNIQUE (scene_name) -- ユニーク制約の追加
);

CREATE TABLE IF NOT EXISTS ai_recommendation (
    ai_recomm_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    ai_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE IF NOT EXISTS advice (
    advice_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    advice_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE IF NOT EXISTS sns_post (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    coord_id INT,
    caption TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (coord_id) REFERENCES coordinate(coord_id)
);

CREATE TABLE IF NOT EXISTS likes (
    likes_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES sns_post(post_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE IF NOT EXISTS comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES sns_post(post_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- 初期データの挿入
INSERT INTO user (name, age, sex) VALUES ('Alice', 30, 'F');
INSERT INTO user (name, age, sex) VALUES ('Bob', 25, 'M');

INSERT INTO category (category_name) VALUES ('Tops');
INSERT INTO category (category_name) VALUES ('Bottoms');

INSERT INTO scene (scene_name) VALUES ('Casual');
INSERT INTO scene (scene_name) VALUES ('Formal');

-- コミット
COMMIT;

-- エラーが発生した場合のロールバック
ROLLBACK;