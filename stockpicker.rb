# frozen_string_literal: true

# Implement a method #stock_picker that takes in an array of prices prices, one for each
# hypothetical day. It should return a pair of days representing the best day to buy and the
# best day to sell. Days start at 0.

# > stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12

# Quick Tips:
# You need to buy before you can sell

# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(prices)
  max_profit = 0
  i = 0
  n = i + 1
  while i < prices.length - 1
    while n < prices.length
      profit = prices[n] - prices[i]
      if profit > max_profit
        max_profit = profit
        buy_day = i
        sell_day = n
      end
      n += 1
    end
    i += 1
    n = i + 1
  end
  puts "Buy on day #{buy_day} and sell on day #{sell_day} for a profit of #{max_profit}" 

end

stock_picker(prices)

