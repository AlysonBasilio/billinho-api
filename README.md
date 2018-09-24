# README

This README document what steps are necessary to get the
application up and running.

## Ruby version
2.4.4p296 (2018-03-28 revision 63013) [x64-mingw32]

#### Install system dependencies
```
bundle install
```

#### Database creation
```
rails db:migrate
```

#### How to run the test suite
```
rails db:migrate RAILS_ENV=test
bundle exec rspec
```

#### Run
```
rails s
```

## API Endpoints
| Endpoint | Functionality | Data Constraints |
| --- | --- | --- |
| GET /institutions | Get a list of all registered institutions | |
| POST /institutions | Register a new Institution | { "name": "[valid unique name]", "cnpj": "[unique, only numbers]", "institution_type": "['Universidar', 'Escola' or 'Creche']" } |
| GET /institutions/:id | Get institution data by id |   |
| PUT /institutions/:id | Update Institution info by id | { "name": "[valid unique name]", "cnpj": "[unique, only numbers]", "institution_type": "['Universidade', 'Escola' or 'Creche']" } |
| DELETE /institutions/:id  | Delete institution by id | |
| GET /students | Get a list of all registered students | |
| POST /students | Register a new Student | { "name": "[valid unique name]", "cpf": "[unique, only numbers]", "birth_date": "[date]", "phone": "[only numbers]", "gender": "['M' or 'F']", "payment_method": "['Boleto' or 'Cartao']" } |
| GET /students/:id | Get student data by id |   |
| PUT /students/:id | Update Student info by id | { "name": "[valid unique name]", "cpf": "[unique, only numbers]", "birth_date": "[date]", "phone": "[only numbers]", "gender": "['M' or 'F']", "payment_method": "['Boleto' or 'Cartao']" } |
| DELETE /students/:id  | Delete student by id | |
| GET /registrations | Get a list of all registrations | |
| POST /registrations | Create a new Registration | { "value": "[decimal value]", "invoice_qty": "[positive integer]", "expiration_date": "[day of month between 1 and 31]", "course": "[course name is required]", "institution_id": "[existing institution id]", "student_id": "[existing student id]" } |
| GET /registrations/:id | Get registration data by id |   |
| DELETE /registrations/:id  | Delete registration by id | |
| GET /invoices | Get a list of all invoices | |
| GET /invoices/:id | Get invoice data by id |   |
| PUT /invoices/:id  | Update invoice by id | {"status": "['Aberta', 'Atrasada', 'Paga']"} |
