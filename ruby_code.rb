class Board
    def initialize(size)
        @size = size
        @board_state = Array.new(size) {Array.new(size, 0)}
    end

    def print_board
        puts "printing board"
        @board_state.each do |row|
            row.each do |spot|
                print spot.to_s + ("   ")
            end
            print "\n\n"
        end
    end
    def add_move(row, column, player)
        @board_state[row][column] = player
    end


    def check_horizontal_winner
        winner = false
        @board_state.each do |row|
            winner = true if (row.uniq.length == 1) && (row[0] != 0)
        end
        return winner
    end
    def check_vertical_winner
        for i in (0..@size-1) do
            top_value = @board_state[0][i]
            winner = top_value != 0
            for j in (1..@size-1) do
                winner = false if(@board_state[j][i] != top_value)
            end
            return winner if winner
        end
        return false
    end
    def check_diagonal_winner
        top_left = @board_state[0][0]
        top_left_winner = top_left != 0
        bottom_left = @board_state[0][@size - 1]
        bottom_left_winner = bottom_left != 0
        @board_state.each_index do |i|
            top_left_winner = false if(@board_state[i][i] != top_left)
            bottom_left_winner = false if(@board_state[-i][i] != bottom_left)
        end
        return (top_left_winner || bottom_left_winner)
    end

    def check_winner
        return (check_diagonal_winner || check_horizontal_winner || check_vertical_winner)
    end
    
    def get_move(player)
        puts "\nPlease enter your move"
        move_string = gets.chomp
        move_arr = move_string.split(",")
        move_x_pos = move_arr[0].to_i
        move_y_pos = move_arr[1].to_i
        add_move(move_x_pos, move_y_pos, player)
    end

    def game_loop
        
        while (!check_winner) do 
            print_board
            get_move("X")
        end
        print_board
        puts "\n\n\nWe have a winner!"
    end
end

my_board = Board.new(3)

my_board.game_loop
