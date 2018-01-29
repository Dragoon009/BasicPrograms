require 'pry'

class Evaluator
  def initialize(expressions)
    @expressions = expressions
  end
  
  def evaluate
    if is_valid_entry
      calculate
    else
      puts "Invalid entry, exiting."
      exit!
    end
  end

  def calculate
    stack = []
    operands = []

    @expressions.each do |token|
      case token
        when /\d/
          stack.push(token.to_f)
        when "+", "-", "/", "*"
          operands = stack.pop(2)
          stack.push(operands[0].send(token, operands[1]))
        end
    end
    stack[-1].to_f
  end

  def is_valid_entry
    @expressions -= [""]
    valid = @expressions.count <= 2 ? false : true
    validation = @expressions.join(" ")
    case validation
    when /^[-|+|\/|*]/
      valid = false
    when /^(([a-zA-Z]+).)*$/
      valid = false
    else
      valid
    end
    valid
  end

end