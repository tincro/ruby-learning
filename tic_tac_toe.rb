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

    def claim(board)
        # available slot is chosen from the board
        puts "#@name, claim your space:"
        space = gets
        if board.slots(space.chomp.to_i).is_a? Integer
            @spaces.push(space.chomp.to_i)
        end
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



class Game 
    MAX_TURNS = 5
    @game_over = false
    
    def main(p1, p2, board)
        turns = 1
        while !@game_over do
            
            board.display_board
            validate_choice(p1, board)
            board.set_board
            
            check_for_winner(p1, board, @game_over)
            
            board.display_board
            validate_choice(p2, board)
            board.set_board
    
            check_for_winner(p2, board, @game_over)
            turns += 1
            if turns == Game::MAX_TURNS
                puts "Tie game. Thanks for playing!"
                puts "Play again? y/n"
                again = gets.chomp
                if again == "y"
                    reset(p1, p2)
                else
                    break
                end
            end
        end
    end

    def check_for_winner(player, board, winner)
        # if either player has one of the matching patterns
        # that player is announced the winner otherwise keep playing
        for pattern in board.winning_patterns do
            connected = 0
            for space in player.spaces do
                p pattern
                p space
                p player.spaces 
                if pattern.include?(space)
                    connected += 1
                end
            end
    
            if connected == 3
                puts "#{player.name} wins!"
                puts "Good game!"
                @game_over = true
                break
            end 
        end
    end

    def validate_choice(player, board)
        choice = player.claim(board)
        if board.slots(choice).is_a? Integer
            
            return board.set_slots(choice, player.piece)
        else
            puts "Try another available space:"
            validate_choice(player, board)
        end
    end

    def reset(player_1, player_2)
        p1 = Player.new(player_1.name, player_1.piece)
        p2 = Player.new(player_2.name, player_2.piece)
        board = GameBoard.new
        self.main(p1, p2, board)
    end

end

p1 = Player.new('PlayerOne', 'X')
p2 = Player.new('PlayerTwo', 'O')
board = GameBoard.new
game = Game.new

game.main(p1, p2, board)