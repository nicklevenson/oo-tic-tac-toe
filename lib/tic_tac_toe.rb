require 'pry'

class TicTacToe
    attr_accessor :board
    def initialize()
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        #horizontal wins
        [0,1,2],
        [3,4,5],
        [6,7,8],
        #vertical wins
        [0,3,6],
        [1,4,7],
        [2,5,8],
        #diagnol wins
        [0,4,8],
        [6,4,2]
    ]


    def display_board
       puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
       puts "-----------"
       puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      
    end

    def input_to_index(input)
        #return index of user input
        input.to_i-1
    end

    def move(index, player_token = "X")
        @board[index] = player_token
    end

    def position_taken?(index)
        #return false if free, true if taken
        @board[index] == " " ? false : true
    end

    def valid_move?(index)
        #returns true if move is valid (valid spot on board and free of token)
        if index >=0 && index < 9
            position_taken?(index) == false ? true : false
        else
            false
        end
    end

    def turn_count
        #returns number of occupied spaces
        @board.count {|s| !(s == " ")}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)

        else
            # puts "invalid input. try again."
           
           turn
           
        end
        display_board
    end


    def won?
        WIN_COMBINATIONS.each do |combo|
            index1 = combo[0]
            index2 = combo[1]
            index3 = combo[2]

            if @board[index1] == "X" && @board[index2] == "X" && @board[index3] == "X"
                return combo

            elsif @board[index1] == "O" && @board[index2] == "O" && @board[index3] == "O"
                return combo
            end
        end 
        false
    end

    def full?
        @board.include?(" ") ? false : true
    end

    def draw?
        won? ? false : full? ? true : false
    end

    def over?
        draw? || won? ? true : false
    end

    def winner
        if won? 
            @board[won?[0]] == "X" ? "X" : "O"
        else
            nil
        end
    end

    def play
        if over?
            if won?
                puts "Congratulations #{winner}!"
            end
            
            if draw?
                puts "Cat's Game!"
            end
            return "Game over"
        end
        turn
        play
    end

end

# binding.pry