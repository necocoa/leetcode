package main

/*
 * @lc app=leetcode id=653 lang=golang
 *
 * [653] Two Sum IV - Input is a BST
 */

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func findTarget(root *TreeNode, k int) bool {
	path := []int{}
	dfs(root, &path)

	res := false
	dp := make(map[int]bool)
	for _, v := range path {
		if _, ok := dp[v]; ok {
			res = true
			break
		}
		dp[k-v] = true
	}
	return res
}

func dfs(node *TreeNode, path *[]int) {
	if node == nil {
		return
	}
	*path = append(*path, node.Val)
	dfs(node.Left, path)
	dfs(node.Right, path)
}

// @lc code=end

func main() {
	findTarget(&TreeNode{
		Val: 5,
		Left: &TreeNode{
			Val:   3,
			Left:  &TreeNode{Val: 2},
			Right: &TreeNode{Val: 4},
		},
		Right: &TreeNode{
			Val:   6,
			Right: &TreeNode{Val: 4},
		},
	}, 9)
}
