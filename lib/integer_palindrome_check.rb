# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.
# The approach below compares one digit at a time.
# Time complexity: O(k) where k is the number of digits in the number,
#                  or O(lg (number*10)), where lg is log to the base 10
# Space complexity: O(1) since the auxiliary storage used does not change based on input
# An alternative approach, is to reverse the number and save it separately and
# compare it with the input. If they are equal, then the number is a palindrome.
# The alternative approach uses O(k) space.
def is_palindrome(number)
  return false if number == nil || number < 0

  # figure out the number of 0s in divisor
  div = 1
  while (number / div) >= 10
    div *= 10
  end

  while number > 0
    left = number / div # get the left most digit
    right = number % 10 # get the right most digit
    if left != right # compare the left most digit with the right most digit
      return false
    end

    number = (number % div) # remove one digit from the left
    number = number / 10 # remove one digit from the right
    div /= 100 # remove two digits from the divisor to compensate for left and right digits
  end
  return true
end
