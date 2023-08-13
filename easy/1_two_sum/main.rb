#
# @lc app=leetcode id=1 lang=ruby
#
# [1] Two Sum
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, i|
    c = target - num
    if hash[c]
      return [hash[c], i]
    else
      hash[num] = i
    end
  end
end

# @lc code=end

# nums = [2, 7, 11, 15, 18, 22, 25, 30]
# target = 9

# nums = [3, 2, 4]
# target = 6

# nums = [5, 3, 3]
# target = 6

# nums = [3, 3]
# target = 6

# p two_sum(nums, target)
