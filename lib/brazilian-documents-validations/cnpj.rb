module CNPJ

  def self.valid?(cnpj)
    cnpj = cnpj.to_s

    # could be 13 or 14 digits or with mask 99.999.999/9999-99
    return false if cnpj !~ /^\d{13,14}|\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$/


    cnpj = cnpj.scan(/\d/).collect(&:to_i)

    # filter 111... to 999...
    return false if cnpj.uniq.size == 1

    cnpj.unshift(0) if cnpj.length == 13


    # calculate first digit
    factor = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

    sum = (0..11).inject(0) do |sum, i|
      sum + cnpj[i] * factor[i]
    end

    result = sum % 11
    result = result < 2 ? 0 : 11 - result

    return false if result != cnpj[12]

    # calculate second digit
    factor.unshift 6

    sum = (0..12).inject(0) do |sum, i|
      sum + cnpj[i] * factor[i]
    end

    result = sum % 11
    result = result < 2 ? 0 : 11 - result

    result == cnpj[13]
  end
  
  def self.invalid?(cnpj)
    !valid?(cnpj)
  end
end