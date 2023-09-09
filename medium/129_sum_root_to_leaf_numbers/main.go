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
	sum := 0
	dfs(root, &sum, []int{})
	return sum
}

func dfs(root *TreeNode, sum *int, path []int) {
	if root == nil {
		return
	}

	path = append(path, root.Val)

	// leaf node
	if root.Left == nil && root.Right == nil {
		// path を int に変換して sum に加算
		pathToInt := 0
		for _, n := range path {
			pathToInt *= 10
			pathToInt += n
		}
		*sum += pathToInt
		return
	}

	dfs(root.Left, sum, path)
	dfs(root.Right, sum, path)
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
