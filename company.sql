DROP TABLE IF EXISTS users;
 
CREATE TABLE users(
    user_pk             TEXT,
    user_name           TEXT,
    user_last_name      TEXT,
    user_email          TEXT,
    user_created_at     TEXT,
    user_updated_at     TEXT,
    user_deleted_at     TEXT,
    PRIMARY KEY(user_pk)
) WITHOUT ROWID;
 
DROP TABLE IF EXISTS pets;
 
CREATE TABLE pets(
    pet_pk              TEXT,
    pet_species         TEXT,
    pet_name            TEXT,
    PRIMARY KEY(pet_pk)                     --primary key
)WITHOUT ROWID;

DROP TABLE IF EXISTS user_pets;

CREATE TABLE user_pets(                     -- junction table
    pets_fk        TEXT,
    user_fk        TEXT,
    FOREIGN KEY(pets_fk) REFERENCES pets(pets_pk) ON DELETE CASCADE,
    FOREIGN KEY(user_fk) REFERENCES users(user_pk) ON DELETE CASCADE,
    PRIMARY KEY(pets_fk, user_fk)           -- compound key
) WITHOUT ROWID;

DROP TABLE IF EXISTS user_phones;

CREATE TABLE user_phones (                  -- lookup table
    phone_pk       TEXT,                    -- Unique identifier for each phone record
    user_fk        TEXT,                    -- Foreign key referencing the users table
    user_phonenumber     TEXT NOT NULL,
    PRIMARY KEY(phone_pk, user_fk),          -- compossite key
    FOREIGN KEY(user_fk) REFERENCES users(user_pk) ON DELETE CASCADE
) WITHOUT ROWID; 

DROP TABLE IF EXISTS user_vehicles;
CREATE TABLE user_vehicles (
    vehicle_pk     TEXT,
    user_fk        TEXT,
    PRIMARY KEY (vehicle_pk, user_fk)
    FOREIGN KEY (user_fk) REFERENCES users(user_pk) ON DELETE CASCADE
) WITHOUT ROWID;

DROP TABLE IF EXISTS vehicle_types;
CREATE TABLE vehicle_types (
    vehicle_type_pk     TEXT,
    vehicle_type_type   TEXT NOT NULL,
    vehicle_type_brand  TEXT,
    PRIMARY KEY(vehicle_type_pk)
) WITHOUT ROWID;

DROP TABLE IF EXISTS user_hobbies;
CREATE TABLE user_hobbies (
    user_fk             TEXT,
    user_hobbies_pk     TEXT,
    user_hobbies_name   TEXT,
    PRIMARY KEY (user_hobbies_pk, user_fk)
    FOREIGN KEY (user_fk) REFERENCES users(user_pk) ON DELETE CASCADE
) WITHOUT ROWID;

