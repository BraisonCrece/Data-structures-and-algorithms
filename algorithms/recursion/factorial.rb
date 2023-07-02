def factorial(number)
  raise Error.new if number < 1
  # This is the BASE CASE, it is very important in recursion
  # Is the point of exit of the recursion
  return 1 if number == 1
  # Here we are calling the factorial function recursively
  return number * factorial(number - 1)
end
