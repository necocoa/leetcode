package main

import "fmt"

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func inorderTraversal(root *TreeNode) []int {
	path := []int{}
	dfs(root, &path)
	return path
}

func dfs(node *TreeNode, path *[]int) {
	if node == nil {
		return
	}

	dfs(node.Left, path)
	*path = append(*path, node.Val)
	dfs(node.Right, path)
}

func main() {
	// root = [1,null,2,3]
	root := &TreeNode{
		Val: 1,
		Right: &TreeNode{
			Val:  2,
			Left: &TreeNode{Val: 3}}}
	fmt.Println(inorderTraversal(root))
}
