/*
 * @lc app=leetcode id=623 lang=golang
 *
 * [623] Add One Row to Tree
 */

package main

import "fmt"

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func addOneRow(root *TreeNode, val int, depth int) *TreeNode {
	// 深さが1の場合はrootを置き換える
	if depth == 1 {
		return &TreeNode{
			Val:  val,
			Left: root,
		}
	}

	dfs(root, val, depth)
	return root
}

func dfs(root *TreeNode, val int, depth int) {
	if root == nil {
		return
	}

	// 対象の深さの手前で実施する
	if depth == 2 {
		root.Left = &TreeNode{
			Val:  val,
			Left: root.Left,
		}
		root.Right = &TreeNode{
			Val:   val,
			Right: root.Right,
		}
	}

	dfs(root.Left, val, depth-1)
	dfs(root.Right, val, depth-1)
}

// @lc code=end

func main() {
	root := &TreeNode{
		Val: 4,
		Left: &TreeNode{
			Val: 2,
			Left: &TreeNode{
				Val: 3,
			},
			Right: &TreeNode{
				Val: 1,
			},
		},
		Right: &TreeNode{
			Val: 6,
			Left: &TreeNode{
				Val: 5,
			},
		},
	}
	r := addOneRow(root, 1, 2)
	debug(r)
}

func debug(root *TreeNode) {
	if root == nil {
		return
	}
	fmt.Println(root.Val)
	debug(root.Left)
	debug(root.Right)
}
