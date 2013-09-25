require_relative 'test_helper'

class ModelsTest < ActiveSupport::TestCase

  class Company
    include ActiveModel::Model
    attr_accessor :cnpj
    validates :cnpj, cnpj: true
  end

  class Person
    include ActiveModel::Model
    attr_accessor :cpf
    validates :cpf, cpf: true
  end

  test "should not validate with invalid cnpj" do
    company = Company.new cnpj: '1'*14
    assert ! company.valid?
    assert company.errors[:cnpj].present?
  end

  test "should validate with valid cnpj" do
    company = Company.new cnpj: '07340306000136'
    assert company.valid?
  end

  test "should not validate with invalid cpf" do
    person = Person.new cpf: '1'*11
    assert ! person.valid?
    assert person.errors[:cpf].present?
  end

  test "should validate with valid cpf" do
    person = Person.new cpf: '00251782026'
    assert person.valid?
  end

end
