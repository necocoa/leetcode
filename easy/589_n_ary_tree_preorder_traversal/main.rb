#
# @lc app=leetcode id=589 lang=ruby
#
# [589] N-ary Tree Preorder Traversal
#

# @lc code=start
# Definition for a Node.
class Node
  attr_accessor :val, :children

  def initialize(val)
    @val = val
    @children = []
  end
end

# @param {Node} root
# @return {List[int]}
def preorder(root)
  dfs(root, [])
end

def dfs(node, ary)
  return ary if node.nil?

  ary << node.val
  node.children.each { dfs(_1, ary) }
  ary
end
# @lc code=end

# root = [1,null,3,2,4,null,5,6]
root = Node.new(1).tap do |n|
  n.children << Node.new(3).tap do |n3|
    n3.children << Node.new(5)
    n3.children << Node.new(6)
  end
  n.children << Node.new(2)
  n.children << Node.new(4)
end
p preorder(root)
