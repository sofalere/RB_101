--CREATE
--check constraints, note that to add a name we use CONSTRAINT
CREATE TABLE bidders(
  id serial PRIMARY KEY,
  name text NOT NULL CHECK(length(name) >= 1),
  price numeric(6,2) CONSTRAINT valid_name CHECK(price BETWEEN 0 AND 1000)
  );

--foreign keys
CREATE TABLE bids(
  id serial PRIMARY KEY,
  bidder_id int NOT NULL REFERENCES bidders(id) ON DELETE CASCADE, --note
  items_id int REFERENCES items(id) ON DELETE CASCADE NOT NULL     --NOT NULL
  );
  
--create index
CREATE INDEX [idx_name] ON table_name (column_name[, column_name]);

--drop index
DROP INDEX "idx_name";

--UNIQUE constraint
CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id integer
    REFERENCES customers (id)
    ON DELETE CASCADE
    NOT NULL,
  service_id integer
    REFERENCES services (id)
    NOT NULL,
  UNIQUE(customer_id, service_id)
);




--ALTER
--Add check different from set not null
ALTER TABLE stars
  ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
  ALTER COLUMN spectral_type SET NOT NULL;

--Add unique
ALTER TABLE films 
  ADD CONSTRAINT title_unique UNIQUE (title);
  
--Drop unique
ALTER TABLE films 
  DROP CONSTRAINT title_unique;