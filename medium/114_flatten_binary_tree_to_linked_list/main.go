package main

import "fmt"

/*
 * @lc app=leetcode id=114 lang=golang
 *
 * [114] Flatten Binary Tree to Linked List
 */

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func flatten(root *TreeNode) {
	var prev *TreeNode
	var dfs func(node *TreeNode)
	dfs = func(node *TreeNode) {
		if node == nil {
			return
		}

		dfs(node.Right)
		dfs(node.Left)
		node.Left = nil
		node.Right = prev
		prev = node
	}
	dfs(root)
}

// @lc code=end

func main() {
	r1 := &TreeNode{
		Val: 1,
		Left: &TreeNode{
			Val:   2,
			Left:  &TreeNode{Val: 3},
			Right: &TreeNode{Val: 4},
		},
		Right: &TreeNode{
			Val:   5,
			Right: &TreeNode{Val: 6},
		},
	}
	flatten(r1)
}

func debug(node *TreeNode) {
	if node != nil {
		fmt.Println(node.Val)
		debug(node.Left)
		debug(node.Right)
	}
}
