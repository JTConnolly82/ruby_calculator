@calc = []
@calc_history = []


# ISSUES
  # can't type exit to quit
  # error checking -> see raising exceptions eg. can't divide by 0..

  
def display
  @calc = 0
  puts 'main menu'
  puts '1) perform calculation'
  puts '2) calc history' 
  puts '3) clear calc history'
  route = gets.chomp.to_i
  if route == 1
    calcing
  elsif route == 2
    puts '--calc history--' + "\n"
    puts @calc_history
  elsif route == 3
    puts 'calc history cleared'
    @calc_history.clear
  end
  display
end


def calcing
  if @answer_to_first_num == nil
    puts 'enter first number'
    first_num = gets.chomp.to_i
  elsif @answer_to_first_num != nil
    puts 'do you want to use your prior answer? (y/n)'
    use_prior_or_not = gets.chomp.to_s.downcase
    if use_prior_or_not == 'y'
      first_num = @answer_to_first_num
      puts 'first number is ' + "#{@answer_to_first_num}"
    else
      puts 'enter first number'
      first_num = gets.chomp.to_i
    end
  end
  # @calc << first_num
  puts 'select modifier'
  puts ' + - / *'
  modifier = gets.chomp
  # @calc.insert(1, modifier)
  puts 'enter second number'
  second_num = gets.chomp.to_i
  # @calc << second_num
  @calc = [first_num, modifier, second_num]
  print @calc
  number_eval
end

def number_eval
  answer_to_first_num = 0
  answer = eval(@calc.join(''))
  puts ' = ' + answer.to_s
  puts '----------'
  @answer_to_first_num = answer.to_i
  @calc_history.push(@calc)
end

display
