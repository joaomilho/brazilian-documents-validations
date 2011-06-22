require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  test "should not validate with invalid cpf" do
    person = Person.new :cpf => '1'*11
    assert ! person.valid?
    assert person.errors[:cpf].present?
  end

  test "should validate with valid cpf" do
    person = Person.new :cpf => '00251782026'
    assert person.valid?
  end

end
