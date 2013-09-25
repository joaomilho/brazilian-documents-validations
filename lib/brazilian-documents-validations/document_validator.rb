class DocumentValidator

  def valid?
    valid_format? and
    whitelisted? and
    valid_first_digit? and
    valid_second_digit?
  end

  private

  def whitelisted?
    to_a.uniq.size > 1
  end

  def to_a
    @to_a ||= split(@document)
  end

  def calculate_mod value
    mod = value % 11
    mod < 2 ? 0 : 11 - mod
  end

  def valid_first_digit?
    first_digit_calculated == first_digit
  end

  def valid_second_digit?
    second_digit_calculated == second_digit
  end

  def first_digit
    to_a[-2]
  end

  def second_digit
    to_a.last
  end

  def split value
    splitted = value.scan(/\d/).collect(&:to_i)
    splitted.length == @size - 1 ? splitted.unshift(0) : splitted
  end

  def sum chars, factor
    (0..chars).inject(0) do |sum, i|
      sum + to_a[i] * factor[i]
    end
  end

  def first_sum
    sum @size-3, factor[1..-1]
  end

  def second_sum
    sum @size-2, factor
  end

  def first_digit_calculated
    calculate_mod(first_sum)
  end

  def second_digit_calculated
    calculate_mod(second_sum)
  end

end
