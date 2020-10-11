# stock picker for the Odin Project

def stock_picker(stocks)
    lowest_stock = stocks[0]
    lowest_index = nil
    highest_index = nil
    most_profit = 0
    current_profit = 0

    buy_stocks = []

    stocks.each do |stock|
        if stock < lowest_stock
            lowest_stock = stock
            curr_index = stocks.index(stock)
            days_left = stocks.drop(curr_index + 1)
            
            days_left.each do |day_stock|
                current_profit = day_stock - lowest_stock
                if current_profit > most_profit
                    most_profit = current_profit
                    highest_index = stocks.index(day_stock)
                    lowest_index = curr_index
                end
            end
        end
    end

    buy_stocks.push(lowest_index)
    buy_stocks.push(highest_index)

    return buy_stocks
end

stocks = [17,3,6,9,15,8,6,1,10]
p stock_picker(stocks)