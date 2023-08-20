#
# @lc app=leetcode id=113 lang=ruby
#
# [113] Path Sum II
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
# @return {Integer[][]}
def path_sum(root, target_sum)
  return [] if root.nil?

  dfs(root, target_sum, 0, [], [])
end

def dfs(node, target_sum, current_sum, ans_path, path)
  current_sum += node.val
  path << node.val

  # 末端かつ条件に合致する場合は、pathをans_pathに追加する
  if node.left.nil? && node.right.nil? && target_sum == current_sum
    ans_path << path.dup
  end

  if !node.left.nil?
    dfs(node.left, target_sum, current_sum, ans_path, path)
  end
  if !node.right.nil?
    dfs(node.right, target_sum, current_sum, ans_path, path)
  end
  path.pop
  ans_path
end
# @lc code=end

root = TreeNode.new(5,
                    TreeNode.new(4, TreeNode.new(11, TreeNode.new(7), TreeNode.new(2))),
                    TreeNode.new(8, TreeNode.new(13), TreeNode.new(4, TreeNode.new(5), TreeNode.new(1))))
target_sum = 22
p path_sum(root, target_sum)
