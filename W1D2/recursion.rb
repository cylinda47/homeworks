def sum_to(n)
  return 1 if n == 1
  n + sum_to(n - 1)
end

def add_numbers(arr)
  return arr[-1] if arr.length == 1
  return nil if arr.empty?
  arr.pop + add_numbers(arr)
end

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1
  (num - 1) * gamma_fnc(num - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.last == favorite
  ice_cream_shop(flavors[0...-1], favorite)
end

def reverse(string)
  #return string
  return string if string == ""
  #string = initial value + next value + next value.....
  string[-1] + reverse(string[0...-1])
end
