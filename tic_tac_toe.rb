# Tic Tac Toe Project for The Odin Project

class Player
    attr_accessor :spaces
    attr_reader :name
    attr_reader :piece

    def initialize(name, piece)
        @name = name
        @piece = piece
        @spaces = []
    end

    def claim
        # available slot is chosen from the board
        puts "#@name, claim your space:"
        space = gets
        @spaces.push(space.chomp.to_i)
        return space.chomp.to_i
    end
end

class GameBoard
    def initialize()
        @winning_patterns = [
                        [0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],
                        [1, 4, 7],[2, 5, 8], [0, 4, 8], [2, 4, 6]
        ]
        @slots = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        @board_state = <<-STATE
                           |   |   
                         #{@slots[0]} | #{@slots[1]} | #{@slots[2]}
                        ___|___|___
                           |   |   
                         #{@slots[3]} | #{@slots[4]} | #{@slots[5]} 
                        ___|___|___
                           |   |   
                         #{@slots[6]} | #{@slots[7]} | #{@slots[8]}
                           |   |   
                        STATE
        
        def winning_patterns
            @winning_patterns
        end

        def slots(index)
            @slots[index]
        end
        
        def set_slots(index, value)
            @slots[index] = value
        end
    end

    def display_board
        # display the board between turns to show the current state of game
        puts @board_state
    end

    def set_board
        # Update the board state
        @board_state = <<-STATE
                           |   |   
                         #{@slots[0]} | #{@slots[1]} | #{@slots[2]}
                        ___|___|___
                           |   |   
                         #{@slots[3]} | #{@slots[4]} | #{@slots[5]} 
                        ___|___|___
                           |   |   
                         #{@slots[6]} | #{@slots[7]} | #{@slots[8]}
                           |   |   
                        STATE
    end
end

def check_for_winner(player, board, winner)
    # if either player has one of the matching patterns
    # that player is announced the winner otherwise keep playing
    for pattern in board.winning_patterns do
        connected = 0
        for space in player.spaces do
            if pattern.include?(space)
                connected += 1
            end
        end

        if connected == 3
            puts "#{player.name} wins!"
            winner = true
        end 
    end
end

def validate_choice(player, board)
    choice = player.claim
    if board.slots(choice).is_a? Integer
        mark = player.piece
        return board.set_slots(choice, mark)
    else
        puts "Try another available space:"
        validate_choice(player, board)
    end
end
    

MAX_TURNS = 5
def main(p1, p2, board)
    turns = 1
    winner = false
    while !winner do
        board.display_board

        validate_choice(p1, board)
        board.set_board
        board.display_board

        check_for_winner(p1, board, winner)

        validate_choice(p2, board)
        board.set_board
        board.display_board

        check_for_winner(p2, board, winner)
        turns += 1
        if turns == MAX_TURNS
            puts "Tie game. Thanks for playing!"
            puts "Play again? y/n"
            again = gets.chomp
            if again == "y"
                board = GameBoard.new
                main(p1, p2, board)
            else
                break
            end
        end
    end
end


p1 = Player.new('Austin', 'A')
p2 = Player.new('Zach', 'Z')
game = GameBoard.new

main(p1, p2, game)