#
# @lc app=leetcode id=429 lang=ruby
#
# [429] N-ary Tree Level Order Traversal
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

class QueueNode
  attr_accessor :level, :children, :val

  def initialize(level, node)
    @level = level
    @children = node.children
    @val = node.val
  end
end

# @param {Node} root
# @return {List[List[int]]}
def level_order(root)
  ans = []
  return ans unless root

  queue = [root]
  until queue.empty?
    next_queue = []
    ans << queue.map do |node|
      next_queue += node.children
      node.val
    end
    queue = next_queue
  end
  ans
end

# @lc code=end

# root = [1,null,3,2,4,null,5,6]
# root = Node.new(1).tap do |n|
#   n.children << Node.new(3).tap do |n3|
#     n3.children << Node.new(5)
#     n3.children << Node.new(6)
#   end
#   n.children << Node.new(2)
#   n.children << Node.new(4)
# end
# p level_order(root)

root = Node.new(1).tap do |n|
  n.children << Node.new(2)
  n.children << Node.new(3).tap do |n3|
    n3.children << Node.new(6)
    n3.children << Node.new(7).tap do |n7|
      n7.children << Node.new(11).tap do |n11|
        n11.children << Node.new(14)
      end
    end
  end
  n.children << Node.new(4).tap do |n4|
    n4.children << Node.new(8).tap do |n8|
      n8.children << Node.new(12)
    end
  end
  n.children << Node.new(5).tap do |n5|
    n5.children << Node.new(9).tap do |n9|
      n9.children << Node.new(13)
    end
    n5.children << Node.new(10)
  end
end
p level_order(root)
