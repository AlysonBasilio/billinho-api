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
rails exec rspec
```

#### Run
```
rails s
```

## API Endpoints
| Endpoint | Functionality | Data Constraints |
| --- | --- | --- |
| GET /institutions | Get a list of all registered institutions | |
| POST /institutions | Register a new Institution | { "name": "[valid unique name]", "cnpj": "[only numbers]", "institution_type": "['Universidar', 'Escola' or 'Creche']" } |
| GET /institutions/:id | Get institution data by id |   |
| PUT /institutions/:id | Update Institution info by id | { "name": "[valid unique name]", "cnpj": "[only numbers]", "institution_type": "['Universidar', 'Escola' or 'Creche']" } |
| DELETE /institutions/:id  | Delete institution by id | | |
