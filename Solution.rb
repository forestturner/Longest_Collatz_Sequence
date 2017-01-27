# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains
# 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
# that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.


def solution()
  # adding a hashmap to keep track of numbers that have been already computed for.
  past_number_lookup_hash = Hash.new()

  current_largest_sequence_starting_number = -1;
  largest_sequence_size = 0;
  (1..1_000_000).each do |test_number|
    temp_test_length = return_sequence_length(test_number,past_number_lookup_hash)
    # adding all numbers with lengths for constant lookup later
    past_number_lookup_hash[test_number] = temp_test_length

    if temp_test_length > largest_sequence_size
      largest_sequence_size = temp_test_length
      current_largest_sequence_starting_number = test_number
    end
  end
  return current_largest_sequence_starting_number
end

def return_sequence_length(number,past_number_lookup_hash)
  current_result_length = 1;
  temp = number
  while (temp != 1)
    temp % 2 == 0 ? temp = even_number(temp) : temp = odd_number(temp)
    # it will return the length of temp + the current length if it has seen temp before.
    if past_number_lookup_hash[temp] != nil
       return (past_number_lookup_hash[temp] + current_result_length)
     end
     current_result_length += 1
  end
  return current_result_length
end

def even_number(number)
  return number/2
end

def odd_number(number)
  return ((number*3) + 1 )
end

p solution()
