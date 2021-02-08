require 'pry'

class TicTacToe

    attr_accessor :board


    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize(board = nil)
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(board_selection)
        indexed_by_zero = board_selection.to_i - 1
    end

    def move(input_to_index, player_token)
        @board[input_to_index] = player_token
    end

    def position_taken?(input_to_index)
        if @board[input_to_index] == "X" || @board[input_to_index] == "O"
            true
        else
            false
        end
    end

    def valid_move?(player_input)
        !position_taken?(player_input) && player_input.between?(0,8)
    end


    def turn_count
        count = 0
        @board.each do |turn_taken|
            if turn_taken == "X" || turn_taken == "O"
                count+=1
            end
        end
        count
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter your choice: "
         player_move = gets.strip # gets is a built-in method for getting the user input
         player_position = input_to_index(player_move)
         if valid_move?(player_position)
            move(player_position, current_player)
            display_board
         else
            puts "Try again!"
            turn
         end
  
    end

    def won?
        wins_board = nil
        WIN_COMBINATIONS.each do |winning_combo| #! this iterates through each value of array returning the child arrays within
            winning_combo[0] #! this is value of first index position in child array
            winning_combo[1] #! this is value of second index position in child array
            winning_combo[2] #! this is value of third index position in child array

            if @board[winning_combo[0]] == "X" && @board[winning_combo[1]] == "X" && @board[winning_combo[2]] == "X"

                wins_board = winning_combo

            elsif @board[winning_combo[0]] == "O" && @board[winning_combo[1]] == "O" && @board[winning_combo[2]] == "O"

                wins_board = winning_combo

            end
        end
        wins_board
    end

    def full?
        if turn_count == 9 && !won?
            true
        else
            false
        end
    end

    def draw?
        if full? && !won?
            "Cat's game!"
            true
        else
            false
        end
    end

    def over?
        if won? || draw?
            true
        else
            false
        end
    end

    def winner
        ## check to see if won? returned value that includes "X" and return that as winner, if not return "O" as winner
        if won?
            if turn_count.odd?
                "Congratulations X!"
                "X"
            else
                "Congratulations O!"
                "O"
            end
        end
    end

    def play
        until over?
            turn
        end
        if won?
            champion = winner
            puts "Congratulations #{champion}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end


end



