#** .dup & .clone create a copy of the array that mimic each others' changes
# dup
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!
arr2 # => ["a", "B", "c"]
arr1 # => ["a", "B", "c"]

# clone
arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!
arr2 # => ["cba", "def"]
arr1 # => ["cba", "def"]

#!! Interesting edge cases...
# Example 1 modifies the array, not the elements
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end
arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]

# Example 2 modifies the elements which reference the objects referenced by arr1
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end
arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]

#** .freeze : clone preserves the frozen state while dup does not
# .freeze / .clone
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array

#.freeze / .dup
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"
arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]

#.freeze / string
str = "abc".freeze
str << "d"
# => RuntimeError: can't modify frozen String
