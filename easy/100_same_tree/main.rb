#
# @lc app=leetcode id=100 lang=ruby
#
# [100] Same Tree
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

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  dfs(p, q)
end

def dfs(node_1, node_2)
  if node_1.nil? && node_2.nil?
    return true
  end

  if node_1.nil? || node_2.nil? || node_1&.val != node_2&.val
    return false
  end

  dfs(node_1.left, node_2.left) && dfs(node_1.right, node_2.right)
end
# @lc code=end

p = TreeNode.new(1, TreeNode.new(2), TreeNode.new(3))
q = TreeNode.new(1, TreeNode.new(2), TreeNode.new(3))
p is_same_tree(p, q)
p = TreeNode.new(1, TreeNode.new(1))
q = TreeNode.new(1, nil, TreeNode.new(1))
p is_same_tree(p, q)

# [5,4,1,null,1,null,4,2,null,2]
p = TreeNode.new(5,
                 TreeNode.new(4,
                              nil,
                              TreeNode.new(1, TreeNode.new(2))),
                 TreeNode.new(1,
                              nil,
                              TreeNode.new(4, nil, TreeNode.new(2))))
# [5,1,4,4,null,1,null,null,2,null,2]
q = TreeNode.new(5,
                 TreeNode.new(1, TreeNode.new(4, nil, TreeNode.new(2))),
                 TreeNode.new(4, TreeNode.new(1, nil, TreeNode.new(2))))
p is_same_tree(p, q)
