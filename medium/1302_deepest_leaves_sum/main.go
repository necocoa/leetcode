package main

import "fmt"

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

type MaxDepth struct {
	Val   int
	Depth int
}

func deepestLeavesSum(root *TreeNode) int {
	maxDepth := dfs(root, 1, &MaxDepth{Val: 0, Depth: 0})
	return maxDepth.Val
}

func dfs(root *TreeNode, depth int, maxDepth *MaxDepth) *MaxDepth {
	if root == nil {
		return maxDepth
	}

	// 同じ深さの最大値を足していく
	if depth == maxDepth.Depth {
		maxDepth.Val = maxDepth.Val + root.Val
	}

	// より深い深さがあれば、最大値を更新
	if depth > maxDepth.Depth {
		maxDepth.Val = root.Val
		maxDepth.Depth = depth
	}

	dfs(root.Left, depth+1, maxDepth)
	dfs(root.Right, depth+1, maxDepth)
	return maxDepth
}

func main() {
	r1 := &TreeNode{
		Val: 1,
		Left: &TreeNode{
			Val: 2,
			Left: &TreeNode{
				Val:  4,
				Left: &TreeNode{Val: 7}},
			Right: &TreeNode{Val: 5}},
		Right: &TreeNode{
			Val: 3,
			Right: &TreeNode{
				Val:   6,
				Right: &TreeNode{Val: 8},
			},
		}}
	fmt.Println(deepestLeavesSum(r1))
	r2 := &TreeNode{
		Val: 6,
		Left: &TreeNode{
			Val: 7,
			Left: &TreeNode{
				Val:   2,
				Left:  &TreeNode{Val: 9},
				Right: &TreeNode{Val: 1}},
			Right: &TreeNode{Val: 7}},
		Right: &TreeNode{
			Val: 8,
			Left: &TreeNode{
				Val:   1,
				Left:  &TreeNode{Val: 4},
				Right: &TreeNode{Val: 5}},
			Right: &TreeNode{Val: 3},
		},
	}
	fmt.Println(deepestLeavesSum(r2))
	// [50,null,54,98,6,null,null,null,34]
	r3 := &TreeNode{
		Val: 50,
		Right: &TreeNode{
			Val: 54,
			Left: &TreeNode{
				Val: 98,
			},
			Right: &TreeNode{
				Val:   6,
				Right: &TreeNode{Val: 34},
			},
		},
	}
	fmt.Println(deepestLeavesSum(r3))
	r4 := &TreeNode{
		Val: 2,
	}
	fmt.Println(deepestLeavesSum(r4))
}
