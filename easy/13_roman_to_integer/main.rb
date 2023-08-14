#
# @lc app=leetcode id=13 lang=ruby
#
# [13] Roman to Integer
#

# @lc code=start
# @param {String} s
# @return {Integer}
def roman_to_int(s)
  roman_hash = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  s.each_char.with_index.sum do |roman, i|
    if i < s.length - 1 && roman_hash[roman] < roman_hash[s[i + 1]]
      roman_hash[roman] * -1
    else
      roman_hash[roman]
    end
  end
end
# @lc code=end
