class Company < ActiveRecord::Base
  validates :cnpj, :cnpj => true, :allow_nil => true, :allow_blank => true
end
