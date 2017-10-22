-- Table: users
# CREATE TABLE users (
#   id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
#   username VARCHAR(255) NOT NULL,
#   password VARCHAR(255) NOT NULL ,
#   email VARCHAR(255),
#   firstName VARCHAR(255),
#   lastName VARCHAR(255)
# )
#   ENGINE = InnoDB;
-- Table profile

# CREATE TABLE profile (
#   id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
#   interest VARCHAR(255) NOT NULL,
#   aim VARCHAR(255) NOT NULL,
#   user_id INT
# )
#   ENGINE = InnoDB;
-- Table: roles
# CREATE TABLE roles (
#   id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
#   name VARCHAR(100) NOT NULL
# )
#   ENGINE = InnoDB;


-- Table for mapping user and roles: user_roles
# CREATE TABLE user_roles (
#   user_id INT NOT NULL,
#   role_id INT NOT NULL,
#
#   FOREIGN KEY (user_id) REFERENCES users (id),
#   FOREIGN KEY (role_id) REFERENCES roles (id),
#
#   UNIQUE (user_id, role_id)
# )
#   ENGINE = InnoDB;

-- Insert data


INSERT INTO user VALUES (1,1,1,'ROLE_ADMIN',NULL ,1,'loginoleg123@gmail.com',
                            1,'Oleg', 'Login','$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG','Travolta');

# INSERT INTO roles VALUES (1, 'ROLE_USER');
# INSERT INTO roles VALUES (2, 'ROLE_ADMIN');
#
# INSERT INTO user_roles VALUES (1, 2);