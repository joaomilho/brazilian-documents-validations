module CPF

  BLACK_LIST = (0..9).map{|i| i.to_s * 11 } << '12345678909' unless defined?(BLACK_LIST)

  def self.mock
    ns = Array.new(9){ (rand*9).round }
    rec = 10
    d1 = ns.inject(0){|s,i| s = s + i*rec; rec -= 1; s }

    d1 = 11 - ( d1 % 11 )
    d1 = 0 if d1 >= 10
    rec = 11
    d2 = d1*2 + ns.inject(0){|s,i| s = s + i*rec; rec -= 1; s }
    d2 = 11 - ( d2 % 11 )
    d2 = 0 if d2 >= 10
    ns << d1 << d2
    ns.join   
  end

  def self.valid?(cpf)
    cpf = cpf.to_s

    # could be 10 or 11 digits or with mask 999.999.999-99
    return false if cpf !~ /^\d{10,11}|\d{3}\.\d{3}\.\d{3}-\d{2}$/

    cpf = cpf.scan(/\d/).collect(&:to_i)
    cpf.unshift(0) if cpf.length == 10

    # filter black list
    return false if BLACK_LIST.include? cpf.join

    # calculate first digit
    sum = (0..8).inject(0) do |sum, i|
      sum + cpf[i] * (10 - i)
    end

    result = sum % 11
    result = result < 2 ? 0 : 11 - result

    return false if result != cpf[9]

    # calculate second digit
    sum = (0..8).inject(0) do |sum, i|
      sum + cpf[i] * (11 - i)
    end

    sum += cpf[9] * 2

    result = sum % 11
    result = result < 2 ? 0 : 11 - result

    result == cpf[10]
  end

  def self.invalid?(cpf)
    !valid?(cpf)
  end
end