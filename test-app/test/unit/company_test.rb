require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  test "should not validate with invalid cnpj" do
    company = Company.new :cnpj => '1'*14
    assert ! company.valid?
    assert company.errors[:cnpj].present?
  end

  test "should validate with valid cnpj" do
    company = Company.new :cnpj => '07340306000136'
    assert company.valid?
  end

end
