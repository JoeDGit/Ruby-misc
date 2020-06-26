print "Please enter the number you would like to FizzBuzz up to: "
maximum_number = gets.chomp.to_i

1.upto(maximum_number) do |current_number|
  if (current_number % 5 == 0) && (current_number % 3 == 0)
        puts "FizzBuzz"
    elsif current_number % 3 == 0
        puts "Fizz"
    elsif current_number % 5 == 0
        puts "Buzz"
    else 
        puts current_number
    end
end