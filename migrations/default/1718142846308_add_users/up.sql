CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    password TEXT,
    email TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    is_online BOOLEAN DEFAULT FALSE
);

CREATE TABLE todos (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    is_completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    user_id INTEGER REFERENCES "users" (id)
);

ALTER TABLE "users" ADD COLUMN country VARCHAR(255);

INSERT INTO "users" (name, email, password, country) VALUES
    ('John', 'john@example.com', 'password123', 'US'),
    ('Jane', 'jane@example.com', 'password456', 'GB');

INSERT INTO todos (title, description, user_id) VALUES
    ('Buy groceries', 'Milk, eggs, bread', 1),
    ('Clean apartment', 'Vacuum, dust, do laundry', 1),
    ('Finish project', 'Complete tasks A, B, and C', 2),
    ('Schedule meeting', 'With client X', 2);
