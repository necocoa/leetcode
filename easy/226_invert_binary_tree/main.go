/*
 * @lc app=leetcode id=226 lang=golang
 *
 * [226] Invert Binary Tree
 */

// @lc code=start

package main

import "fmt"

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func invertTree(root *TreeNode) *TreeNode {
	dfs(root)
	return root
}

func dfs(root *TreeNode) {
	if root == nil {
		return
	}

	root.Left, root.Right = root.Right, root.Left
	dfs(root.Left)
	dfs(root.Right)
}

// @lc code=end

func main() {
	// root = [4,2,7,1,3,6,9]
	root := &TreeNode{
		Val: 4,
		Left: &TreeNode{
			Val: 2,
			Left: &TreeNode{
				Val: 1,
			},
			Right: &TreeNode{
				Val: 3,
			},
		},
		Right: &TreeNode{
			Val: 7,
			Left: &TreeNode{
				Val: 6,
			},
			Right: &TreeNode{
				Val: 9,
			},
		},
	}
	fmt.Println(debug(invertTree(root), &[]int{}))
}

func debug(root *TreeNode, path *[]int) []int {
	if root == nil {
		return []int{}
	}

	debug(root.Left, path)
	*path = append(*path, root.Val)
	debug(root.Right, path)
	return *path
}
