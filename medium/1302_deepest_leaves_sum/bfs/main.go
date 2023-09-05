package main

import "fmt"

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func deepestLeavesSum(root *TreeNode) int {
	queue := []*TreeNode{root}
	var sum int

	for len(queue) > 0 {
		sum = 0
		nextQueue := []*TreeNode{}

		for _, n := range queue {
			sum += n.Val
			if n.Left != nil {
				nextQueue = append(nextQueue, n.Left)
			}
			if n.Right != nil {
				nextQueue = append(nextQueue, n.Right)
			}
		}

		queue = nextQueue
	}

	return sum
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
	// [1,2,3,4,5,null,6,7,null,null,null,null,8]
	// [4,5, null,6, 7,null, null,null, null,8]
	r5 := &TreeNode{
		Val: 1,
		Left: &TreeNode{
			Val: 2,
			Left: &TreeNode{
				Val:  4,
				Left: &TreeNode{Val: 7},
			},
			Right: &TreeNode{Val: 5},
		},
		Right: &TreeNode{
			Val: 3,
			Right: &TreeNode{
				Val:   6,
				Right: &TreeNode{Val: 8}},
		},
	}
	fmt.Println(deepestLeavesSum(r5))
}
