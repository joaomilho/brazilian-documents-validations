class Person < ActiveRecord::Base
  validates :cpf, :cpf => true, :allow_nil => true, :allow_blank => true
end