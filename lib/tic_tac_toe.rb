# require 'pry'
# class TicTacToe
#     attr_accessor :board

#     WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6 ,7 ,8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4 ,6]]

#     def initialize(board = nil)
#         @board = board || Array.new(9, " ")
#     end

#     def display_board
#         puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#         puts "-----------"
#         puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#         puts "-----------"
#         puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#       end

#     def input_to_index(input)
#         input_num = input.to_i
#         input_num - 1
#     end

#     def move(index, token = "X")
#         @board[index] = token #why doesn't self.board[index] work?   
#     end

#     def position_taken?(index)
#         @board[index] != " " ? true : false
#     end

#     def valid_move?(index)
#         if index.between?(0,8) && @board[index] == " " #why doesnt @board[index].position_taken?(index) == false work?
#             true
#         else
#             false
#         end
#     end

#     def turn_count
#         @board.count{|token| token == "X" || token == "O"}
#     end

#     def current_player
#         turn_count % 2 == 0 ? "X" : "O"
#     end

#     def turn
#         puts "Please enter 1-9:"
#         input = gets.chomp
#         index = input_to_index(input)
#         if valid_move?(index)
#             token = current_player
#             move(index, token)
#         else
#             turn
#         end
#         display_board
#     end


#      def won?
#          WIN_COMBINATIONS.detect do |combo|
#              @board[combo[0]] == @board[combo[1]] &&
#              @board[combo[1]] == @board[combo[2]] &&
#             position_taken?(combo[0])
#          end
#      end

#     def full?
#         #@board == "X" || "O" ? true : false
#         @board.all?{|index| index != " "}
#     end

#     def draw?
#         !won? && full?
#     end

#     def over?
#         won? || full?
#     end

#     def winner
#          if winning_combo = won?
#             @board[winning_combo.first]
#         end
#     end

#     def play
#      #turn until over?
#     #     turn if !over?
#         while !over?
#             turn
#         end
#         if won?
#             puts "Congratulations #{winner}!"
#         else
#             puts "Cat's Game!"
#         end

#     end
   
# end

require 'pry'
class TicTacToe
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    def input_to_index(user_input)
        user_input.to_i - 1
     end
    def move(index, token)
        @board[index] = token
     end
    def position_taken?(index)
        @board[index] != " "
    end
    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end
    def turn_count
        @board.count{|square| square != " " }
    end
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(user_input)
        user_input.to_i - 1
      end
      def move(board_position, token)
        @board[board_position] = token
      end
      def position_taken?(board_position)
        @board[board_position] != " "
      end
      def valid_move?(board_position)
        if board_position >= 0 && board_position <= 8
            if @board[board_position] == " " 
                true
            end
            else
                false
            end
        end
      def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            turn
        end
        display_board
    end
    def won?
        WIN_COMBINATIONS.find do |indices|
        values = @board.values_at(*indices)
            if values.all?("X") || values.all?("O")
                values
            else
                false
            end
        end  
    end
    def full?
        @board.all?{|taken| taken != " "}
    end
    def draw?
        full? && !won?
    end
    def over?
        won? || draw?
    end
    def winner
        combo = won?
        if combo
            if combo.all? {|i| @board[i] == "X"}
            "X"
            elsif combo.all? {|i| @board[i] == "O"}
             "O"
            end
        end
    end
    def play
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
  end






