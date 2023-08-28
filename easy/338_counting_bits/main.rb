#
# @lc app=leetcode id=338 lang=ruby
#
# [338] Counting Bits
#

# @lc code=start
# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
  1.upto(n).with_object([0]) do |i, ans|
    ans[i] = ans[i / 2] + (i % 2)
  end
end

# @lc code=end
