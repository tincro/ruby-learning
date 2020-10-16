# Tic Tac Toe Project for The Odin Project


class Player
    def initialize(name)
        @name = name
        @spaces = []
    end

    def claim(slot)
        # available slot is chosen from the board
        # game_board[slot] = @name
        # @spaces.push(slot)
    end
end

class GameBoard
    def initialize()
        @winning_patterns = 
                        [[1, 2, 3],[4, 5, 6],[7, 8, 9],
                    [1, 4, 7],[2, 5, 8],[3, 6, 9], [1, 5, 9], [3, 5, 7]]
        @slots = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        @board_state = []
    end

    def display_board()
        # display the board between turns to show the current state of game
    end

    def check_for_winner()
        # if either player has one of the matching patterns
        # that player is announced the winner
    end


end