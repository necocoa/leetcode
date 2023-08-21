#
# @lc app=leetcode id=437 lang=ruby
#
# [437] Path Sum III
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
# @return {Integer}
def path_sum(root, target_sum)
  return 0 if root.nil?

  dfs(root, target_sum, [], 0)
end

def dfs(node, target_sum, current_path, ans_count)
  current_path.unshift(node.val)

  if !node.left.nil?
    ans_count = dfs(node.left, target_sum, current_path, ans_count)
  end
  if !node.right.nil?
    ans_count = dfs(node.right, target_sum, current_path, ans_count)
  end

  sum = 0
  current_path.each do |i|
    sum += i
    if target_sum == sum
      ans_count += 1
    end
  end

  current_path.shift
  ans_count
end
# @lc code=end

root = TreeNode.new(10,
                    TreeNode.new(5, TreeNode.new(3, TreeNode.new(3), TreeNode.new(-2)),
                                 TreeNode.new(2, nil, TreeNode.new(1))),
                    TreeNode.new(-3, nil, TreeNode.new(11)))
target_sum = 8
p path_sum(root, target_sum)

root = nil
target_sum = 8
p path_sum(root, target_sum)
