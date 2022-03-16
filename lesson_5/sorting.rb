## .sort_by
# Array
['cot', 'bed', 'mat'].sort_by do |word|
  word[1] #sorts by 2nd letter in each word
end
# => ["mat", "bed", "cot"]

# Hash
people = { Kate: 27, john: 25, Mike:  18 }
people.sort_by do |_, age|
  age
end
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]
people.sort_by do |name, _|
  name.capitalize
end
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]

# ** sort_by always returns a new array, even when called on a hash **
# Note: Array#sort and Array#sort_by have a equivalent destructive methods
# Array#sort! and Array#sort_by!. With these methods, rather then returning a new collection,
# the same collection is returned but sorted. These methods are specific to arrays
# and are not available to hashes.
