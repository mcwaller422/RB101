require 'yaml'
PICK = YAML.load_file('rps_bonus.yml')
VALID_CHOICES = %w[rock paper scissors lizard spock]
count = 0
player_score = 0
computer_score = 0

def prompt(message)
  puts message
end

def win?(first, second)
  ((first == PICK['r'] || first == PICK['sp']) && second == PICK['s']) ||
  ((first == PICK['p'] || first == PICK['sp']) && second == PICK['r']) ||
  ((first == PICK['s'] || first == PICK['l']) && second == PICK['p']) ||
  ((first == PICK['s'] || first == PICK['r']) && second == PICK['l']) ||
  ((first == PICK['l'] || first == PICK['p']) && second == PICK['sp'])
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt(PICK['invalid'])
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
  display_results(choice, computer_choice)

  loop do
    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end
    count += 1
    break
  end 
  
  prompt("You: #{player_score} vs. Computer: #{computer_score}")
  
  loop do
    if player_score >= 3
      puts "Congratulations, you are the Grand Winner!"
    elsif computer_score >= 3
      puts "Better luck next time, Computer is the Grand Winner."
    elsif count == 5
      puts "Maximum matches reached."
      player_score = 0
      computer_score = 0
    end
    break
  end

  prompt(PICK['again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
