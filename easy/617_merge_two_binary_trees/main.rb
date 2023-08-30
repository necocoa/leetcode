#
# @lc app=leetcode id=617 lang=ruby
#
# [617] Merge Two Binary Trees
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

# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {TreeNode}
def merge_trees(root1, root2)
  dfs(root1, root2)
end

def dfs(node1, node2)
  return if node1.nil? && node2.nil?

  TreeNode.new(
    (node1&.val || 0) + (node2&.val || 0),
    dfs(node1&.left, node2&.left),
    dfs(node1&.right, node2&.right)
  )
end
# @lc code=end

# [1,3,2,5]
root1 = TreeNode.new(1, TreeNode.new(3, TreeNode.new(5)), TreeNode.new(2))
# [2,1,3,null,4,null,7]
root2 = TreeNode.new(2, TreeNode.new(1, nil, TreeNode.new(4)), TreeNode.new(3, nil, TreeNode.new(7)))
p merge_trees(root1, root2)
# [3,4,5,5,4,null,7]
