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
  dup_s = s.dup

  %w[M D C L X V I].each.sum do |roman|
    last_roman_i = dup_s.rindex(roman)
    next 0 if last_roman_i.nil?

    dup_s.slice!(0, last_roman_i + 1).each_char.sum do |roman_str|
      roman_hash[roman_str] * (roman_str == roman ? 1 : -1)
    end
  end
end
# @lc code=end
