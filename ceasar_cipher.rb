# Caesar Cipher for The Odin Project

def caesar_cipher(string, num)
    codex = "abcdefghijklmnopqrstuvwxyz"
    words = []
    new_words = []
    arr = string.split

    for word in arr do
        temp = word.split("")
        words.push(temp)
    end

    for i in 0..words.length - 1 do
        temp_arr = []
        words[i].each do |char|
            is_upper = false
            
            if char == char.upcase
                is_upper = true
                char.downcase!
            end

            new_index = codex.index(char) + num
            new_char = codex[new_index]
            char = new_char
            
            if is_upper
                char.upcase!
            end

            temp_arr.push(char)
        end
        new_words.push(temp_arr.join)
    end
    puts new_words.join(" ")
end

caesar_cipher("Austin Cronin", 3)