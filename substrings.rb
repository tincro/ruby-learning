# Substrings for the Odin Project

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dict)
    counts = Hash.new
    arr = string.split(" ")
    p arr

    dict.each do |word|
        arr.each do |string|
            if string.include?(word)
                if counts.include?(word)
                    counts[word] += 1
                else
                    counts[word] = 1
                end
            end
        end
    end
    puts counts
end

substrings("Howdy partner, sit down! How's it going?", dictionary)