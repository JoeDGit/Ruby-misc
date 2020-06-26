# frozen_string_literal: true



# mastermind class
class Mastermind

  def initialize()
    @colours = [ 'r', 'b','y', 'g', 'w', 'o', 'p', 'c']
    @code = []
    @computer_guess = []
  end

  def CodeCreate
    colour_one = @colours.sample
    colour_two = @colours.sample
    colour_three = @colours.sample
    colour_four = @colours.sample
    pre_code = [colour_one, colour_two, colour_three, colour_four]
    @code = pre_code.map { |k| @colours.index(k)}
    
  end

  public
  def CodeInput(input)
    user_input_keys = input.map { |v| @colours.index(v) }
    if user_input_keys.any? { |e| e.respond_to?(:empty?) && e.empty? } == true
      puts 'Invalid selection, please try again'
    elsif user_input_keys.length > 4 || user_input_keys.length < 4
      puts 'The code is 4 digits long, please try again entering a 4 digit guess'
    else
      CodeCompare(user_input_keys)
    end
  
  end
  
  def CodeCompare(array_input)
  @game_won = 0
  local_code = @code.clone
  i = 0
  incorrects = 0
  correct_place = []
  incorrect_place = []
    while i < 4
      n = local_code[i]
      j = array_input[i]
      if array_input == local_code
      puts "Congratulations! you cracked the code!!!"
      @game_won = 1
      exit!
      elsif n == j
        correct_place.push('X')
        local_code[i] = ''
        i += 1
      else
        i += 1
      end
    end
    while incorrects < 4
      code_item = local_code[incorrects]
      input_item = array_input[incorrects]

      if input_item != code_item && local_code.include?(input_item)
        incorrect_place.push('O')
        incorrects += 1
      else
        incorrects += 1
      end
    end
      puts "############{correct_place}###########"
      puts "############{incorrect_place}###########"
  end


  def GameLoop
    @guesses = 8
    puts 'Welcome to mastermind! Please enter your guess consisting of a 4 digit code of the following letters: r, b, y, g, w, o, p, or c'
    puts 'For each guess feedback will be provided, you have 8 attempts to crack the code'
    puts 'O represents a character out of position and X represents a character in position'
      while @guesses.positive?
      puts 'Keep guessing to crack the code!'
      user_input = gets.chomp.downcase.split(//)
      CodeInput(user_input)
      @guesses -= 1
      puts "#{@guesses} guesses remaining"
        if @game_won == 1
          @guesses = 0
        elsif @guesses == 0 && @game_won == 0
        puts 'Game over, better luck next time!'
        end
      end
  end

  def ComputerGuess
    @computer_guess.clear
    pre_guess.clear
    colour_one = @colours.sample
    colour_two = @colours.sample
    colour_three = @colours.sample
    colour_four = @colours.sample
    pre_guess = [colour_one, colour_two, colour_three, colour_four]
    @computer_guess = pre_guess.map { |k| @colours.index(k)}
  end

  def ComputerAttempt
    computer_attempts = 8
    while computer_attempts.positive? && @computer_guess != @code do
      ComputerGuess
      CodeCompare(@computer_guess)
      computer_attempts -= 1
    end
  end

  def HumanCode
    puts 'Please enter your code consisting of 4 colours, represented by the following letters: r, b, y, g, w, o, p, or c (e.g rbyg)'
    user_code = gets.chomp.downcase.split(//)
    user_code_keys = user_code.map { |v| @colours.index(v) }
      if user_code_keys.any? { |e| e.respond_to?(:empty?) && e.empty? } == true
        puts 'Invalid selection, please try again'
      elsif user_code_keys.length > 4 || user_code_keys.length < 4
        puts 'The code must be 4 digits long, please try again entering a 4 digit code'
      else
        @code = user_code_keys
        ComputerAttempt
      end
  end
end

puts 'Welcome to mastermind, would you like to be the CodeBreaker(1) or CodeMaker?(2)'
game_choice = gets.chomp
if game_choice == '1'
  new_game = Mastermind.new
  new_game.CodeCreate
  new_game.GameLoop
elsif game_choice == '2'
  comp_game = Mastermind.new
  comp_game.HumanCode
end


