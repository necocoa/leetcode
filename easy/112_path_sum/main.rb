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
  hash = { ans: false }
  current_sum = 0
  return false if root.nil?

  dfs(root, target_sum, current_sum, hash)
  hash[:ans]
end

def dfs(node, target_sum, current_sum, hash)
  # 答えが出てたら終了
  return if hash[:ans] == true

  # 末端到達
  if node.left.nil? && node.right.nil?
    if current_sum + node.val == target_sum
      hash[:ans] = true
    end
    return
  end

  dfs(node.left, target_sum, current_sum + node.val, hash) if !node.left.nil?
  dfs(node.right, target_sum, current_sum + node.val, hash) if !node.right.nil?
end
# @lc code=end

root = TreeNode.new(5,
                    TreeNode.new(4,
                                 TreeNode.new(11,
                                              TreeNode.new(7),
                                              TreeNode.new(2))),
                    TreeNode.new(8,
                                 TreeNode.new(13),
                                 TreeNode.new(4,
                                              nil,
                                              TreeNode.new(1))))
target_sum = 22
p has_path_sum(root, target_sum)
