package main

/*
 * @lc app=leetcode id=876 lang=golang
 *
 * [876] Middle of the Linked List
 */

// @lc code=start

// ListNode Definition for singly-linked list.
type ListNode struct {
	Val  int
	Next *ListNode
}

func middleNode(head *ListNode) *ListNode {
	middle := head
	fast := head

	for fast != nil && fast.Next != nil {
		middle = middle.Next
		fast = fast.Next.Next
	}

	return middle
}

// @lc code=end

func main() {
	// head = [1,2,3,4,5]
	middleNode(&ListNode{1, &ListNode{2, &ListNode{3, &ListNode{4, &ListNode{5, nil}}}}})
}
