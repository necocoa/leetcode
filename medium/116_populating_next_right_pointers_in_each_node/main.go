package main

import "fmt"

/*
 * @lc app=leetcode id=116 lang=golang
 *
 * [116] Populating Next Right Pointers in Each Node
 */

// @lc code=start

// Node Definition for a Node.
type Node struct {
	Val   int
	Left  *Node
	Right *Node
	Next  *Node
}

func connect(root *Node) *Node {
	queue := []*Node{root}
	for len(queue) > 0 {
		nextQueue := []*Node{}
		for i, node := range queue {
			if node == nil {
				continue
			}
			// 次のQueueのNodeをNextに設定
			if i+1 < len(queue) {
				node.Next = queue[i+1]
			}

			nextQueue = append(nextQueue, node.Left, node.Right)
		}
		queue = nextQueue
	}
	return root
}

// @lc code=end

func main() {
	r1 := &Node{
		Val: 1,
		Left: &Node{
			Val:   2,
			Left:  &Node{Val: 4},
			Right: &Node{Val: 5},
		},
		Right: &Node{
			Val:   3,
			Left:  &Node{Val: 6},
			Right: &Node{Val: 7},
		},
	}
	debug(connect(r1))
}

func debug(node *Node) {
	if node == nil {
		return
	}
	fmt.Println(node.Val, node.Next)
	debug(node.Left)
	debug(node.Right)
}
