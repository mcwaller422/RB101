require 'yaml'
MSG = YAML.load_file('mortgage_calc_msgs.yml')

def prompt(phrase)
  puts("=> #{phrase}")
end

prompt(MSG['welcome'])

loop do
  prompt(MSG['loan']) # loan amount
  p = gets.chomp.to_i
  prompt(MSG['apr']) # monthly interest
  apr = gets.chomp
  annual_interest = apr.to_f / 100
  j = annual_interest / 12
  prompt(MSG['time']) # loan duration in months
  years = gets.chomp.to_i
  n = years * 12
  m = p * (j / (1 - (1 + j)**(-n))) # monthly payment
  puts "Your monthly rate will be #{m.to_i}."
  prompt(MSG['again'])
  input = gets.chomp
  break unless input.downcase == 'y'
end
