CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE t_property (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    address VARCHAR(150) NOT NULL
);

INSERT INTO t_property
  (id, address)
VALUES
  ('a81bc81b-dead-4e5d-abff-90865d1e13b1', 'Whitton Rd, Twickenham TW2 7BA'),
  ('a153fd13-afdb-4682-836e-b6a13d25a530', 'Royal Botanic Gardens, Kew, Richmond, Surrey, TW9 3AE'),
  ('33316ec1-a951-4e95-86df-69520ba1e7c5', 'Plough Ln, London SW17 0BL'),
  ('56ea244e-fcbe-4de3-b213-bc5dbade2664', 'Stables Market, Chalk Farm Road, London NW1');
