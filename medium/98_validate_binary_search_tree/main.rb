#
# @lc app=leetcode id=98 lang=ruby
#
# [98] Validate Binary Search Tree
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
# @return {Boolean}
def is_valid_bst(root)
  @min = (2**32) * -1
  dfs(root)
end

def dfs(root)
  return true if root.nil?

  if !dfs(root.left)
    return false
  end

  if root.val <= @min
    return false
  end

  @min = root.val

  if !dfs(root.right)
    return false
  end

  true
end
# @lc code=end

root = TreeNode.new(2, TreeNode.new(1), TreeNode.new(3))
p is_valid_bst(root) == true

root = TreeNode.new(5, TreeNode.new(1), TreeNode.new(4, TreeNode.new(3), TreeNode.new(6)))
p is_valid_bst(root) == false

root = TreeNode.new(2, TreeNode.new(2), TreeNode.new(2))
p is_valid_bst(root) == false

# [5,4,6,null,null,3,7]
root = TreeNode.new(5, TreeNode.new(4), TreeNode.new(6, TreeNode.new(3), TreeNode.new(7)))
p is_valid_bst(root) == false
