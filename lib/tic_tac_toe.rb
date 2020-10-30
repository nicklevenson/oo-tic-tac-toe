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
        print " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        print "-----------"
        print " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        print "-----------"
        print " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      
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
        position_taken?(index) == false && @board[index] != nil ? true : false 
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


    # def won?
    # end

    # def full?
    # end

    # def draw?
    # end

    # def over?
    # end

    # def winner
    # end

end

# binding.pry