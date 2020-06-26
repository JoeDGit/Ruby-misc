def fibs(n)
  return 0 if n.zero?
  return 1 if n == 1

  fibs(n - 1) + fibs(n - 2)
end

puts fibs(10)