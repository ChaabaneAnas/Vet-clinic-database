task a
# command for creating medical histories table
- many to one relationship with patients
- one to one relationship with invoices

# command for creating patients table
- one to many relationship with medical histories

# command for creating invoices table
- one to one relationship with medical histories
- one to many relationship with invoice iterms

task B
# command for creating invoice_items table
- many to one relationship with invoices
- many to one relationship with treatments

CREATE TABLE invoice_items (
id INT GENERATED ALWAYS AS IDENTITY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT NOT NULL,
treatment_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE CASCADE
);

# command for creating treatments table

CREATE TABLE treatments (
id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR,
name VARCHAR,
PRIMARY KEY (id),
);

# command for creating many to many relationship table between treatments and medical records
CREATE TABLE treatments_medical_histories (
id INT GENERATED ALWAYS AS IDENTITY,
PRIMARY KEY (id),
medical_histories_id INT NOT NULL,
treatment_id INT NOT NULL,
FOREIGN KEY(medical_histories_id) REFERENCES medical_histories(id) ON DELETE CASCADE,
FOREIGN KEY(treatment_id) REFERENCES treatments(id) ON DELETE CASCADE,
);
