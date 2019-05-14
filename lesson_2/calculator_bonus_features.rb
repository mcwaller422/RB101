
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def operation_to_msg(op)
  failsafe = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  x = ' '
  failsafe
end

prompt(MESSAGES['welcome'])
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    prompt("Hi #{name}!")
    break
  end
end

# main loop
loop do
  number1 = ''
  loop do
    prompt(MESSAGES['first'])
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second'])
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid'])
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
      prompt(MESSAGES['invalid'])
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
