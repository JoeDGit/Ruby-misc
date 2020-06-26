
player_one_total = []
player_two_total = []
winner_declared = false

class GameBoard

  @@game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize; end

  def display_board()
    puts " #{@@game_board[0]}  |  #{@@game_board[1]}  |  #{@@game_board[2]}"
    puts '---------------'
    puts " #{@@game_board[3]}  |  #{@@game_board[4]}  |  #{@@game_board[5]}"
    puts '---------------'
    puts " #{@@game_board[6]}  |  #{@@game_board[7]}  |  #{@@game_board[8]}"
  end
  
  def update_board(square, player)
    @square = square
    @player = player
    @@game_board[square - 1] = player
  end

  def win_condition(total)
    @win_conditions = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                       [2, 4, 6], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    
    winner_declared = false
    @win_conditions.each do |win|
      winner_declared = true if win - total == []
    end
      return winner_declared
    
  end

  def declare_winner(declare)
    if win_condition(declare) == true
      puts 'Player one wins!'      
      new_game.clearBoard
    elsif win_condition(declare) == true
      puts 'Player two wins!'
      new_game.clearBoard
    else 
      return
    end
  end

  def clearBoard
    @@game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    player_one_total.clear
    player_two_total.clear
    winner_declared = false
  end
  

end

# puts 'Would you like to start a new game? (Press y to begin or any other key to cancel)'
# game_start = gets.chomp 
# while game_start == 'y' 


puts 'Player one is noughts O'
puts 'Player two is crosses X'
puts 'Enter the value of the square you would like to occcupy 1-9'
puts 'Player one goes first

'

new_game = GameBoard.new()
puts new_game.display_board

i = 0
turn = true
while i < 9 && new_game.win_condition(player_one_total) == false && new_game.win_condition(player_two_total) == false
player_one = 0
player_two = 0
  if turn == true
    puts 'Player one, make your choice'
    player_one = gets.chomp.to_i
    if player_one_total.include?(player_one) || player_two_total.include?(player_one) || player_one > 9 || player_one <1
      puts 'Invalid selection, please enter another value'
    else

      player_one_total.push(player_one)
      turn = !turn
      i += 1
      new_game.update_board(player_one, 'O')
      puts new_game.display_board
      new_game.win_condition(player_one_total)
      new_game.declare_winner(player_one_total)
      puts new_game.win_condition(player_one_total)
    end
  else
    puts 'Player two, make your choice'
    player_two = gets.chomp.to_i
    if player_one_total.include?(player_two) || player_two_total.include?(player_two) || player_two > 9 || player_two < 1
      puts 'Invalid selection, please enter another value'
    else

      player_two_total.push(player_two)
      turn = !turn
      i += 1
      new_game.update_board(player_two, 'X')
      puts new_game.display_board
      new_game.win_condition(player_two_total)
      new_game.declare_winner(player_two_total)
    end
  end
end