package main

import "fmt"

/*
 * @lc app=leetcode id=1315 lang=golang
 *
 * [1315] Sum of Nodes with Even-Valued Grandparent
 */

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func sumEvenGrandparent(root *TreeNode) int {
	return dfs(root, false, false)
}

func dfs(root *TreeNode, parent, grandparent bool) int {
	if root == nil {
		return 0
	}

	even := root.Val%2 == 0
	sum := dfs(root.Left, even, parent) + dfs(root.Right, even, parent)

	if grandparent {
		sum += root.Val
	}

	return sum
}

// @lc code=end

func main() {
	// root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
	root := &TreeNode{
		Val: 6,
		Left: &TreeNode{
			Val: 7,
			Left: &TreeNode{
				Val: 2,
				Left: &TreeNode{
					Val: 9,
				},
			},
			Right: &TreeNode{
				Val: 7,
				Left: &TreeNode{
					Val: 1,
				},
				Right: &TreeNode{
					Val: 4,
				},
			},
		},
		Right: &TreeNode{
			Val: 8,
			Left: &TreeNode{
				Val: 1,
			},
			Right: &TreeNode{
				Val: 3,
				Right: &TreeNode{
					Val: 5,
				},
			},
		},
	}
	fmt.Println(sumEvenGrandparent(root))
}
