def prompt(message)
  puts("=> #{message}")
end

def valid_number?(number)
  number.to_i() != 0
end

def operation_to_msg(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator. Enter your name:")
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("C'mon, gimme your name please!")
  else
    prompt("Hi #{name}!")
    break
  end
end

# main loop
loop do
  number1 = ''
  loop do
    prompt("Please enter the first number")
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("Invalid. Please try again")
    end
  end

  number2 = ''
  loop do
    prompt("What is the second number?")
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("Invalid. Please try again")
    end
  end

  operator_prompt = <<-MSG
  "Which operation would you like to perform?
    1: add
    2: subtract
    3: multiply
    4: divide"
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Invalid. Please select your desired operation.")
    end
  end

  prompt("#{operation_to_msg(operator)} the two numbers....")

  answer = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The answer is #{answer}")
  prompt("Again? (Y/N)")
  reply = gets.chomp
  break unless reply.upcase == 'Y'
end
