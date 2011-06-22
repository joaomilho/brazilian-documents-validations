require File.dirname(__FILE__) + '/test_helper'

class CPFTest < ActiveSupport::TestCase
  test "should validate my cpf" do
    assert CPF.valid? '00251782026'
  end

  test "should generate a mock" do
    mock = CPF.mock
    assert mock =~ /\d{11}/
  end

  test "mocks should be valid" do
    mocks = []
    while mocks.length < 1000
      mock = CPF.mock
      mocks << mock unless mocks.include?(mock)
    end
    mocks.each do |mock|
      assert CPF.valid?(mock), "Testando #{mock}"
    end
  end
  
  test "should not be valid" do
    invalids = (0..9).map{|i| i.to_s * 11 } << %w{12343234543 12345678909}
    for invalid in invalids
      assert ! CPF.valid?(invalid), "Testando inválido #{invalid}"
    end
  end
  
  test "should validate inside AR model" do
    person = Person.new
    assert ! person.save
    assert person.errors[:cpf].present?
  end

end
