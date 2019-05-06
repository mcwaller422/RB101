#get user input
#determine requested calculations
#return correct value

puts "Please enter the first number"
number1 = gets.chomp

puts "What is the second number?"
number2 = gets.chomp

puts "Which operation would you like to perform? 1: add, 2: subtract, 3: multiply, 4: divide"
operator = gets.chomp

if operator == '1'
    answer = number1.to_i + number2.to_i
  elsif operator == '2'
    answer = number1.to_i - number2.to_i
  elsif operator == '3'
    answer = number1.to_i * number2.to_i
  elsif operator == '4'
    answer = number1.to_f / number2.to_f
end

puts answer 
