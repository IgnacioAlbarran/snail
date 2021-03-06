def snail(array)
  snail = []
  array_to_reverse = []

  snail.push(array.shift)

  while !array.empty? do
    array.each{ |row| snail << row.pop }
    snail << array.pop.reverse
    array.empty? ? break : array.each{ |row| array_to_reverse.push(row.shift) }

    snail << array_to_reverse.reverse
    array_to_reverse.clear
    snail << array.shift
  end

  snail.flatten
end
