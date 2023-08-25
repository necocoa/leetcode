#
# @lc app=leetcode id=94 lang=ruby
#
# [94] Binary Tree Inorder Traversal
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
# @return {Integer[]}
def inorder_traversal(root)
  @path = []
  dfs(root)
  @path
end

def dfs(node)
  return if node.nil?

  dfs(node.left)
  @path << node.val
  dfs(node.right)
end
# @lc code=end

root = TreeNode.new(1, nil, TreeNode.new(2, TreeNode.new(3)))
p inorder_traversal(root)
