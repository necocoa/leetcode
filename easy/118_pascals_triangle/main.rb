#
# @lc app=leetcode id=118 lang=ruby
#
# [118] Pascal's Triangle
#

# @lc code=start
# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  num_rows.times.with_object([]) do |i, ans|
    a = ans.last
    ans << (i + 1).times.map do |j|
      if j == 0 || j >= a.length
        1
      else
        a[j - 1] + a[j]
      end
    end
  end
end
# @lc code=end

num_rows = 5
p generate(num_rows)
