#
# @lc app=leetcode id=437 lang=ruby
#
# [437] Path Sum III
#

# @lc code=start
# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {TreeNode} root
# @param {Integer} target_sum
# @return {Integer}
def path_sum(root, target_sum)
  dfs(root, target_sum)
end

def dfs(node, target_sum, ans_count = 0, current_sum = 0, cache = {})
  return ans_count if node.nil?

  current_sum += node.val

  if current_sum == target_sum
    ans_count += 1
  end

  if cache[current_sum - target_sum]
    ans_count += cache[current_sum - target_sum]
  end

  cache[current_sum] ? cache[current_sum] += 1 : cache[current_sum] = 1

  ans_count = dfs(node.left, target_sum, ans_count, current_sum, cache)
  ans_count = dfs(node.right, target_sum, ans_count, current_sum, cache)

  cache[current_sum] -= 1
  ans_count
end
# @lc code=end

root = TreeNode.new(10,
                    TreeNode.new(5, TreeNode.new(3, TreeNode.new(3), TreeNode.new(-2)),
                                 TreeNode.new(2, nil, TreeNode.new(1))),
                    TreeNode.new(-3, nil, TreeNode.new(11)))
target_sum = 8
p path_sum(root, target_sum)

root = nil
target_sum = 8
p path_sum(root, target_sum)
