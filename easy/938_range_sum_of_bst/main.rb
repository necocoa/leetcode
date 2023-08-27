#
# @lc app=leetcode id=938 lang=ruby
#
# [938] Range Sum of BST
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
# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def range_sum_bst(root, low, high)
  @low = low
  @high = high
  @sum = 0
  dfs(root)
  @sum
end

def dfs(node)
  return if node.nil?

  dfs(node.left)
  if node.val >= @low && node.val <= @high
    @sum += node.val
  end
  dfs(node.right)
end
# @lc code=end

root = TreeNode.new(10,
                    TreeNode.new(5, TreeNode.new(3), TreeNode.new(7)),
                    TreeNode.new(15, nil, TreeNode.new(18)))
low = 7
high = 15
p range_sum_bst(root, low, high)
