class Calculator
  OPERATIONS = %w[+ - * /]

  def initialize(first_operand = nil, second_operand = nil, first_operation = nil, third_operand = nil, second_operation = nil)
    @first_operand = first_operand
    @second_operand = second_operand
    @third_operand = third_operand
    @first_operation = first_operation
    @second_operation = second_operation
  end

  def self.get_operations
    return OPERATIONS
  end

  def calculate(brackets = nil)

    if brackets == 1
      first_result = calculate_pairs(@first_operand, @second_operand, @first_operation)
      total_result = calculate_pairs(first_result, @third_operand, @second_operation)
      return "(#{@first_operand} #{@first_operation} #{@second_operand}) #{@second_operation} #{@third_operand} = #{total_result}"
    elsif brackets == 2
      first_result = calculate_pairs(@second_operand, @third_operand, @second_operation)
      total_result = calculate_pairs(@first_operand, first_result, @first_operation)
      return "#{@first_operand} #{@first_operation} (#{@second_operand} #{@second_operation} #{@third_operand}) = #{total_result}"
    end
    total_result = calculate_pairs(@first_operand, @second_operand, @first_operation)
    return "#{@first_operand} #{@first_operation} #{@second_operand} = #{total_result}"
  end

  def calculate_pairs(number_1, number_2, operation)
    return eval("#{number_1} #{operation} #{number_2}").to_s
  end

end

