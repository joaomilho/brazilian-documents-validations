require_relative 'test_helper'

class CPFTest < ActiveSupport::TestCase

  test "should validate my cpf" do
    assert CPF.valid? '00251782026'
  end

  test "should generate a mock" do
    mock = CPF.mock
    assert mock =~ /\d{11}/
  end

  test "mocks should be valid" do
    valid_cpfs = CPF.mock(100)
    assert_equal valid_cpfs.size, 100
    assert valid_cpfs.all?{|cpf| CPF.valid?(cpf) }
  end

  test "should not be valid" do
    invalid_cpfs = (0..9).map{|i| i.to_s * 11 } << %w{12343234543 12345678909}
    assert invalid_cpfs.all?{|cpf| ! CPF.valid?(cpf) }
  end

end
