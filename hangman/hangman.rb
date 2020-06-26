class Hangman

  def initialize
    @answer = Array.new(set_word)
    a = @answer.length.to_i
    @user_feedback = Array.new(a, '_')
    @incorrect_guesses = []
    welcome
    game_loop
  end

  def set_word
    word = nil
    File.foreach("5desk.txt").each_with_index do |line, number|
      word = line if rand < 1.0 / (number + 1) && line.length < 12 && line.length > 5
    end
    return word.chomp.downcase.split(//)
  end

  def user_input
    puts 'Please enter your guess'
    guess = gets.chomp
    if guess == '+s'
      save_game
    elsif guess == '+l'
      load_game
    elsif @incorrect_guesses.include?(guess)
      puts 'You\'ve already guessed this letter, try another'
      puts "Incorrect guesses #{@incorrect_guesses.join}"
      guess = gets.chomp
      guess
    else
      guess
    end
  end

  def user_attempt(guess)
    if guess != @answer.join && @answer.include?(guess)
      @answer.each_with_index do |letter, index|
        if guess == letter
          @user_feedback[index] = letter
        end
      end
    elsif guess == @answer.join
      puts 'Congratulations, you\'ve guessed the correct word!'
      @i -= 8
    elsif @user_feedback.join == @answer.join
      puts 'Congratulations, you\'ve guessed the correct word!'
      @i -= 8
    elsif @answer.none?(guess)
      if guess =~ /[a-z]/
        @incorrect_guesses << guess
      end
    else
      puts 'Incorrect guess, please try again'
    end
  end

  def game_loop
    @i = 8
    while @i > 0
      guess = user_input
      user_attempt(guess)
      @i -= 1
      if @i > 0
        puts "You have #{@i} guesses remaining"
        puts @user_feedback.join
        puts "Incorrect guesses: #{@incorrect_guesses.join}"
      end
    if @i == 0 
      puts 'You\'re out of guesses, game over!'
      puts "The Answer was #{@answer.join}"
    end
    end
  end

  def save_game
    j = 1
    Dir.mkdir('saves') unless Dir.exist? 'saves'
    filename = "saves/#{set_word.join}.txt"
    File.open(filename, 'w') do |file|
      file.puts @answer.join
      file.puts @user_feedback.join
      file.puts @incorrect_guesses.join
      file.puts @i
    end
    puts "Game Saved as #{filename}"
  end
  
  def load_game
    puts Dir.entries('saves')
    puts 'Which save game would you like to load?'
    filename = gets.chomp
    load_data = File.readlines("./saves/#{filename}").map(&:chomp)
    @answer = load_data[0].split(//)
    @user_feedback = load_data[1].split(//)
    @incorrect_guesses = load_data[2].split(//)
    @i = load_data[3].to_i
    puts "Game loaded, you have #{@i} guesses remaining"
    puts "Current inccorect guesses are: #{@incorrect_guesses}"
  end

  def welcome
    puts 'Welcome to hangman, you have 8 attempts to guess the random word'
    puts 'To load a previously saved game enter +l'
    puts 'To save your game at any point enter +s'
    puts @answer
  end
end

Hangman.new