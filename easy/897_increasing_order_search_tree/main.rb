#
# @lc app=leetcode id=897 lang=ruby
#
# [897] Increasing Order Search Tree
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
# @return {TreeNode}
def increasing_bst(root)
  dfs(root)
end

def dfs(node, tail = nil)
  return tail unless node

  result = dfs(node.left, node)
  node.left = nil
  node.right = dfs(node.right, tail)
  result
end
# @lc code=end

# [5,3,6,2,4,null,8,1,null,null,null,7,9]
root = TreeNode.new(5, TreeNode.new(3, TreeNode.new(2, TreeNode.new(1)), TreeNode.new(4)),
                    TreeNode.new(6, nil, TreeNode.new(8, TreeNode.new(7), TreeNode.new(9))))
increasing_bst(root)
