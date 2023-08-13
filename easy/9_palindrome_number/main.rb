#
# @lc app=leetcode id=9 lang=ruby
#
# [9] Palindrome Number
#

# @lc code=start
# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  x_s = x.to_s
  length = x_s.length
  h_length = length / 2

  a_x = x_s[...h_length]
  b_x = x_s[(h_length + (length.odd? ? 1 : 0))..].reverse
  a_x == b_x
end
# @lc code=end

# x = 1221
# x = (2**31) - 1
# is_palindrome(x)
