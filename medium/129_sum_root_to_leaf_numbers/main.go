package main

import (
	"fmt"
)

/*
 * @lc app=leetcode id=129 lang=golang
 *
 * [129] Sum Root to Leaf Numbers
 */

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func sumNumbers(root *TreeNode) int {
	return dfs(root, 0)
}

func dfs(node *TreeNode, num int) int {
	if node == nil {
		return 0
	}

	num = num*10 + node.Val

	if node.Left == nil && node.Right == nil {
		return num
	}

	return dfs(node.Left, num) + dfs(node.Right, num)
}

// @lc code=end

func main() {
	r1 := &TreeNode{
		Val: 1,
		Left: &TreeNode{
			Val: 2,
		},
		Right: &TreeNode{
			Val: 3,
		},
	}
	fmt.Println(sumNumbers(r1))
	r2 := &TreeNode{
		Val: 4,
		Left: &TreeNode{
			Val:   9,
			Left:  &TreeNode{Val: 5},
			Right: &TreeNode{Val: 1},
		},
		Right: &TreeNode{
			Val: 0,
		},
	}
	fmt.Println(sumNumbers(r2))
}
