#
# @lc app=leetcode id=2 lang=ruby
#
# [2] Add Two Numbers
#

# @lc code=start
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  list_1 = deep([], l1)
  list_2 = deep([], l2)
  ans = []
  (list_1.join.to_i + list_2.join.to_i).to_s.each_char { ans.unshift _1.to_i }
  new_node(ans, 0)
end

def deep(ary, node)
  if node.next.nil?
    return ary << node.val
  end

  deep(ary, node.next)
  ary << node.val
end

def new_node(ans, i)
  if i >= ans.length - 1
    return ListNode.new(ans[i], nil)
  end

  ListNode.new(ans[i], new_node(ans, i + 1))
end
# @lc code=end

l1 = ListNode.new(2, ListNode.new(4, ListNode.new(3)))
l2 = ListNode.new(5, ListNode.new(6, ListNode.new(4)))
p add_two_numbers(l1, l2)

# l1 = [0]
# l2 = [0]
# p add_two_numbers(l1, l2)

# l1 = [9, 9, 9, 9, 9, 9, 9]
# l2 = [9, 9, 9, 9]

# p add_two_numbers(l1, l2)
