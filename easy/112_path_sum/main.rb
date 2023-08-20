#
# @lc app=leetcode id=112 lang=ruby
#
# [112] Path Sum
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
# @return {Boolean}
def has_path_sum(root, target_sum)
  return false if root.nil?

  dfs(root, target_sum, 0)
end

def dfs(node, target_sum, current_sum)
  current_sum += node.val

  # 末端到達
  if node.left.nil? && node.right.nil?
    return current_sum == target_sum
  end

  if !node.left.nil? && dfs(node.left, target_sum, current_sum)
    return true
  end

  if !node.right.nil? && dfs(node.right, target_sum, current_sum)
    return true
  end

  false
end
# @lc code=end

root = TreeNode.new(5, TreeNode.new(4, TreeNode.new(11, TreeNode.new(7), TreeNode.new(2))),
                    TreeNode.new(8, TreeNode.new(13), TreeNode.new(4, nil, TreeNode.new(1))))
target_sum = 22
p has_path_sum(root, target_sum)
