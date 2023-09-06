package main

import "fmt"

/*
 * @lc app=leetcode id=1038 lang=golang
 *
 * [1038] Binary Search Tree to Greater Sum Tree
 */

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func bstToGst(root *TreeNode) *TreeNode {
	sum := 0
	dfs(root, &sum)
	return root
}

func dfs(root *TreeNode, sum *int) {
	if root == nil {
		return
	}

	dfs(root.Right, sum)
	*sum += root.Val
	root.Val = *sum
	dfs(root.Left, sum)
}

// @lc code=end

func main() {
	// root = [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
	r1 := &TreeNode{
		Val: 4,
		Left: &TreeNode{
			Val:  1,
			Left: &TreeNode{Val: 0},
			Right: &TreeNode{
				Val:   2,
				Right: &TreeNode{Val: 3},
			},
		},
		Right: &TreeNode{
			Val:  6,
			Left: &TreeNode{Val: 5},
			Right: &TreeNode{
				Val:   7,
				Right: &TreeNode{Val: 8},
			},
		},
	}
	debug(bstToGst(r1))
}

func debug(root *TreeNode) {
	if root == nil {
		return
	}
	fmt.Println(root.Val)
	debug(root.Left)
	debug(root.Right)
}
