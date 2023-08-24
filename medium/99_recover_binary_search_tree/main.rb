#
# @lc app=leetcode id=99 lang=ruby
#
# [99] Recover Binary Search Tree
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
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
  @first = nil
  @second = nil
  @prev = TreeNode.new(-Float::INFINITY)

  dfs(root)
  @first.val, @second.val = @second.val, @first.val
end

def dfs(root)
  return if root.nil?

  dfs(root.left)

  if @first.nil? && @prev.val >= root.val
    @first = @prev
  end
  if !@first.nil? && @prev.val >= root.val
    @second = root
  end

  @prev = root

  dfs(root.right)
end
# @lc code=end

root = TreeNode.new(1, TreeNode.new(3, nil, TreeNode.new(2)))
p recover_tree(root)

root = TreeNode.new(3, TreeNode.new(1), TreeNode.new(4, TreeNode.new(2)))
p recover_tree(root)
