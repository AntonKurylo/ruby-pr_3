class NotIntegerException < StandardError
  def initialize(msg = "Non-arithmetic operation used", exception_type = "custom", operations)
    @exception_type = exception_type
    @operations = operations
    super(msg)
  end

  def error_message
    return "Wrong operator, please use #{@operations.join(", ")} operators."
  end
end
