module CPF

  def self.valid?(cpf)
    Validator.new(cpf).valid?
  end

  def self.invalid?(cpf)
    not valid?(cpf)
  end

  class Validator < DocumentValidator

    def initialize cpf
      @document = cpf.to_s
      @size = 11
    end

    private

    def valid_format?
      @document =~ /^\d{10,11}|\d{3}\.\d{3}\.\d{3}-\d{2}$/
    end

    def factor
      (2..11).to_a.reverse
    end

  end
end
