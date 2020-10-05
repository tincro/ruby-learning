# stock picker for the Odin Project

def stock_picker(stocks)
    lowest = stocks[0]
    lowest_index = nil
    highest = 0
    highest_index = nil
    buy = 0
    sell = 0
    days = []
    has_lowest = false

    stocks.each do |stock|
        if stock < lowest
            has_lowest = true
            lowest = stock
            buy = stocks.index(stock)
            lowest_index = stocks.index(stock)        
        end
    end

    stocks.each do |stock|
        if stock > highest
            highest_index = stocks.index(stock)
            if highest_index > lowest_index    
                highest = stock
                sell = stocks.index(stock)
            end
        end
    end

    days.push(buy)
    days.push(sell)
    puts days
end

stocks = [17,3,6,9,15,8,6,1,10]
stock_picker(stocks)