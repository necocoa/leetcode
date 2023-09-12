package main

import "fmt"

/*
 * @lc app=leetcode id=2265 lang=golang
 *
 * [2265] Count Nodes Equal to Average of Subtree
 */

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func averageOfSubtree(root *TreeNode) int {
	count := 0
	dfs(root, &count)
	return count
}

func dfs(node *TreeNode, count *int) []int {
	path := []int{node.Val}

	if node.Left != nil {
		path = append(dfs(node.Left, count), path...)
	}
	if node.Right != nil {
		path = append(dfs(node.Right, count), path...)
	}

	sum := 0
	for _, i := range path {
		sum += i
	}
	avg := sum / len(path)

	// value of the node is equal to the average of the values in its subtree.
	if avg == node.Val {
		*count++
	}

	return path
}

// @lc code=end

func main() {
	// root = [4,8,5,0,1,null,6]
	r1 := TreeNode{
		Val: 4,
		Left: &TreeNode{
			Val: 8,
			Left: &TreeNode{
				Val: 0,
			},
			Right: &TreeNode{
				Val: 1,
			},
		},
		Right: &TreeNode{
			Val: 5,
			Right: &TreeNode{
				Val: 6,
			},
		},
	}
	fmt.Println(averageOfSubtree(&r1))
}
