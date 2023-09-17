package main

/*
 * @lc app=leetcode id=2415 lang=golang
 *
 * [2415] Reverse Odd Levels of Binary Tree
 */

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func reverseOddLevels(root *TreeNode) *TreeNode {
	queue := []*TreeNode{root}
	depth := 0

	for len(queue) > 0 {
		// 次の階層のノードを取得
		nextQueue := []*TreeNode{}
		ints := make([]int, 0, len(queue))

		for _, node := range queue {
			ints = append(ints, node.Val)

			if node.Left == nil && node.Right == nil {
				continue
			}

			nextQueue = append(nextQueue, node.Left, node.Right)
		}

		if depth%2 == 1 {
			for i := 0; i < len(queue); i++ {
				queue[i].Val = ints[len(queue)-i-1]
			}
		}

		depth++
		queue = nextQueue
	}

	return root
}

// @lc code=end

func main() {
	r1 := &TreeNode{
		Val: 2,
		Left: &TreeNode{
			Val: 3,
			Left: &TreeNode{
				Val: 8,
			},
			Right: &TreeNode{
				Val: 13,
			},
		},
		Right: &TreeNode{
			Val: 5,
			Left: &TreeNode{
				Val: 21,
			},
			Right: &TreeNode{
				Val: 34,
			},
		},
	}
	reverseOddLevels(r1)

}
