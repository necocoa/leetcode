package main

import (
	"fmt"
	"sort"
)

/*
 * @lc app=leetcode id=1305 lang=golang
 *
 * [1305] All Elements in Two Binary Search Trees
 */

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func getAllElements(root1 *TreeNode, root2 *TreeNode) []int {
	ints := append(getNodeInts(root1), getNodeInts(root2)...)
	sort.Ints(ints)
	return ints
}

func getNodeInts(root *TreeNode) []int {
	if root == nil {
		return []int{}
	}

	ints := append(getNodeInts(root.Left), root.Val)
	return append(ints, getNodeInts(root.Right)...)
}

// @lc code=end

func main() {
	r1 := &TreeNode{
		Val:   2,
		Left:  &TreeNode{Val: 1},
		Right: &TreeNode{Val: 4},
	}
	r2 := &TreeNode{
		Val:   1,
		Left:  &TreeNode{Val: 0},
		Right: &TreeNode{Val: 3},
	}
	fmt.Println(getAllElements(r1, r2))
}
