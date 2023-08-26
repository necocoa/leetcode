#
# @lc app=leetcode id=101 lang=ruby
#
# [101] Symmetric Tree
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
def is_symmetric(root)
  dfs(root.left, root.right)
end

def dfs(node_1, node_2)
  if node_1.nil? && node_2.nil?
    return true
  end

  if node_1.nil? || node_2.nil? || node_1&.val != node_2&.val
    return false
  end

  dfs(node_1.left, node_2.right) && dfs(node_1.right, node_2.left)
end
# @lc code=end

root = TreeNode.new(1, TreeNode.new(2, TreeNode.new(3), TreeNode.new(4)),
                    TreeNode.new(2, TreeNode.new(4), TreeNode.new(3)))
p is_symmetric(root)
root = TreeNode.new(1, TreeNode.new(2, nil, TreeNode.new(3)),
                    TreeNode.new(2, nil, TreeNode.new(3)))
p is_symmetric(root)

# [1,2,2,2,null,2]
root = TreeNode.new(1,
                    TreeNode.new(2, TreeNode.new(2)),
                    TreeNode.new(2, TreeNode.new(2)))
p is_symmetric(root)
