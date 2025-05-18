do
$$
    begin

        CREATE TABLE users
        (
            id         UUID PRIMARY KEY,
            username   VARCHAR(255) NOT NULL UNIQUE,
            email      VARCHAR(255) NOT NULL UNIQUE,
            created_at TIMESTAMP DEFAULT now()
        );

        CREATE TABLE nodes
        (
            id         UUID PRIMARY KEY,
            name       VARCHAR(255) NOT NULL,
            type       VARCHAR(10)  NOT NULL CHECK (type IN ('FILE', 'FOLDER')),
            parent_id  UUID REFERENCES nodes (id) ON DELETE CASCADE,
            owner_id    UUID         NOT NULL REFERENCES users (id),
            created_at TIMESTAMP DEFAULT now(),
            updated_at TIMESTAMP DEFAULT now()
        );

        CREATE TABLE files
        (
            id           UUID PRIMARY KEY REFERENCES nodes (id) ON DELETE CASCADE,
            mime_type    VARCHAR(100),
            size         BIGINT,
            version      INT DEFAULT 1,
            storage_path TEXT
        );
    end;

$$