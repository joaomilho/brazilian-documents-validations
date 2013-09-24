[![Build Status](https://travis-ci.org/joaomilho/brazilian-documents-validations.png?branch=master)](https://travis-ci.org/joaomilho/brazilian-documents-validations.)

[![Code climate](https://codeclimate.com/github/joaomilho/brazilian-documents-validations..png)](https://codeclimate.com/github/joaomilho/brazilian-documents-validations.)

## Brazilian Documents Validations

Validates brazilian documents (CPF and CNPJ).

## Usage

```ruby

class Company < ActiveRecord::Base
  validates :cnpj, cnpj: true
end

class Person < ActiveRecord::Base
  validates :cpf, cpf: true
end

```

## License

This project is released under the MIT license.

## Author

[Maiz Lulkin] (https://github.com/joaomilho)
