class Board
    def initialize(size)
        @size = size
        @board_state = Array.new(size) {Array.new(size, 0)}
    end

    def print_board
        puts "printing board"
        @board_state.each do |row|
            row.each do |spot|
                print spot.to_s.concat("|")
            end
            print "\n-+-+-\n"
        end
    end
    def add_move(row, column, player)
        @board_state[row][column] = player
    end


    def check_horizontal_winner
        @board_state.each do |row|
            return (row.uniq.length == 1)
        end
    end
    def check_vertical_winner
        for i in (0..@size-1) do
            winner = true
            top_value = @board_state[0][i]
            for j in (1..@size-1) do
                winner = false if(@board_state[j][i] != top_value)
            end
            return winner if winner
        end
        return false
    end
    def check_diagonal_winner
        top_left = @board_state[0][0]
        top_left_winner = true
        bottom_left = @board_state[0][@size - 1]
        bottom_left_winner = true
        @board_state.each_index do |i|
            top_left_winner = false if(@board_state[i][i] != top_left)
            bottom_left_winner = false if(@board_state[-i][i] != bottom_left)
        end
        return (top_left_winner || bottom_left_winner)
    end

    def check_winner
        return (check_diagonal_winner || check_horizontal_winner || check_vertical_winner)
    end
                
end

my_board = Board.new(3)

my_board.print_board
