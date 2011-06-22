require File.dirname(__FILE__) + '/test_helper'

class CNPJTest < ActiveSupport::TestCase
  test "should validate softas cnpj" do
    assert CNPJ.valid? '07340306000136'
  end

  test "should not be valid" do
    invalids = (0..9).map{|i| i.to_s * 14 }
    for invalid in invalids
      assert ! CNPJ.valid?(invalid), "Testando inválido #{invalid}"
    end
  end

end