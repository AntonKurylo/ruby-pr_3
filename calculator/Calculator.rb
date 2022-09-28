require_relative "CalculatorMethods"
require_relative "NotIntegerException"

begin
  operations = Calculator.get_operations
  operands = ""

  while operands != 2 && operands != 3 do
    puts "Введите количество операндов (2 или 3):"
    operands = Integer(STDIN.gets.chomp)
  end

  puts "Введите первое число:"
  number1 = Integer(STDIN.gets.chomp)

  puts "Выберите операцию (+, -, /, *):"
  operator1 = STDIN.gets.chomp

  raise NotIntegerException.new(operations) unless operations.include?(operator1)

  puts "Введите второе число:"
  number2 = Integer(STDIN.gets.chomp)

  if operands == 3
    brackets = ""

    puts "Выберите операцию (+, -, /, *):"
    operator2 = STDIN.gets.chomp

    raise NotIntegerException.new(operations) unless operations.include?(operator2)

    puts "Введите третье число:"
    number3 = Integer(STDIN.gets.chomp)

    while brackets != 1 && brackets != 2 do
      puts "\nВыберите, где расположить скобки:\n 1 → м/у 1-ым-2-ым операндами\n 2 → м/у 2-ым-3-им операндами"
      brackets = Integer(STDIN.gets.chomp)
    end

    calculator = Calculator.new(number1, number2, operator1, number3, operator2)
    result = calculator.calculate(brackets)
  else
    calculator = Calculator.new(number1, number2, operator1)
    result = calculator.calculate
  end

  puts "\nРезультат: #{result}"
rescue ZeroDivisionError
  puts "Error: Divide by 0."
rescue ArgumentError
  puts "Error: Non-integer used."
rescue NotIntegerException => error
  puts "Error: #{error.error_message}"
end
