package main

/*
 * @lc app=leetcode id=117 lang=golang
 *
 * [117] Populating Next Right Pointers in Each Node II
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
		for i := 0; i < len(queue); i++ {
			node := queue[i]
			if node == nil {
				continue
			}
			if i+1 < len(queue) {
				node.Next = queue[i+1]
			}
			if node.Left != nil {
				nextQueue = append(nextQueue, node.Left)
			}
			if node.Right != nil {
				nextQueue = append(nextQueue, node.Right)
			}
		}
		queue = nextQueue
	}
	return root
}

// @lc code=end

func main() {

}
