module CNPJ

  def self.valid? cnpj
    Validator.new(cnpj).valid?
  end

  def self.invalid?(cnpj)
    not valid?(cnpj)
  end

  class Validator

    VALID_FORMATS = /^\d{13,14}|\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$/

    def initialize cnpj
      @cnpj = cnpj.to_s
    end

    def valid?
      return false if @cnpj !~ VALID_FORMATS
      return false if same_number?
      return false if first_digit_calculated != first_digit

      second_digit_calculated == second_digit
    end

    private

    def first_digit
      integer_cnpj[12]
    end

    def second_digit
      integer_cnpj[13]
    end

    def integer_cnpj
      return @integer_cnpj if defined?(@integer_cnpj)

      @integer_cnpj = @cnpj.scan(/\d/).collect(&:to_i)
      @integer_cnpj.unshift(0) if @integer_cnpj.length == 13
      @integer_cnpj
    end

    def same_number?
      integer_cnpj.uniq.size == 1
    end

    def first_sum
      sum 11, first_factor
    end

    def second_sum
      sum 12, second_factor
    end

    def sum chars, factor
      (0..chars).inject(0) do |sum, i|
        sum + integer_cnpj[i] * factor[i]
      end
    end

    def first_factor
      @first_factor ||= [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
    end

    def second_factor
      @second_factor ||= first_factor.unshift 6
    end

    def first_digit_calculated
      calculate_mod(first_sum)
    end

    def second_digit_calculated
      calculate_mod(second_sum)
    end

    def calculate_mod value
      mod = value % 11
      mod < 2 ? 0 : 11 - mod
    end
  end
end
