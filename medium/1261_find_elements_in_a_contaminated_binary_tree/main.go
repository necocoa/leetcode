package main

import "fmt"

/*
 * @lc app=leetcode id=1261 lang=golang
 *
 * [1261] Find Elements in a Contaminated Binary Tree
 */

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

type FindElements struct {
	valHash map[int]bool
}

func Constructor(root *TreeNode) FindElements {
	root.Val = 0
	hash := make(map[int]bool)
	dfs(root, &hash)

	return FindElements{valHash: hash}
}

func (f *FindElements) Find(target int) bool {
	if f.valHash[target] == true {
		return true
	}
	return false
}

func dfs(node *TreeNode, hash *map[int]bool) {
	(*hash)[node.Val] = true

	if node.Left != nil {
		node.Left.Val = node.Val*2 + 1
		dfs(node.Left, hash)
	}

	if node.Right != nil {
		node.Right.Val = node.Val*2 + 2
		dfs(node.Right, hash)
	}
}

/**
 * Your FindElements object will be instantiated and called as such:
 * obj := Constructor(root);
 * param_1 := obj.Find(target);
 */
// @lc code=end

func main() {
	r1 := &TreeNode{Val: -1, Right: &TreeNode{Val: -1}}
	f1 := Constructor(r1)
	fmt.Println(f1.Find(1))
	fmt.Println(f1.Find(2))
	r2 := &TreeNode{
		Val: -1,
		Left: &TreeNode{
			Val:   -1,
			Left:  &TreeNode{Val: -1},
			Right: &TreeNode{Val: -1},
		},
		Right: &TreeNode{Val: -1},
	}
	Constructor(r2)
}
