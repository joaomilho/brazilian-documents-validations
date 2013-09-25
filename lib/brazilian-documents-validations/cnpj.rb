module CNPJ

  def self.valid? cnpj
    Validator.new(cnpj).valid?
  end

  def self.invalid?(cnpj)
    not valid?(cnpj)
  end

  class Validator < DocumentValidator

    def initialize cnpj
      @document = cnpj.to_s
      @size = 14
    end

    private

    def valid_format?
      @document =~ /^\d{13,14}|\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$/
    end

    def factor
      [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
    end

  end
end
