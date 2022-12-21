CREATE TABLE patients (
  id SERIAL NOT NULL,
  name VARCHAR(250) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id SERIAL NOT NULL,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT,
  status VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);


CREATE TABLE invoices (
  id SERIAL NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  generate_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);


CREATE TABLE invoice_items (
  id SERIAL NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);

CREATE TABLE treatments (
  id SERIAL NOT NULL,
  type VARCHAR(250),
  name VARCHAR(250),
  PRIMARY KEY (id)
);

/* Create medical_treatment_history join table */
CREATE TABLE medical_treatment_history (
  id SERIAL NOT NULL,
  medical_histories_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);

--- CREATE FK INDEXES
CREATE INDEX ON medical_histories(patient_id);

CREATE INDEX ON invoices(medical_history_id);

CREATE INDEX ON invoice_items(invoice_id);

CREATE INDEX ON invoice_items(treatment_id);

CREATE INDEX ON medical_treatment_history(medical_histories_id);

CREATE INDEX ON medical_treatment_history(treatment_id);
