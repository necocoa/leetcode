package main

/*
 * @lc app=leetcode id=133 lang=golang
 *
 * [133] Clone Graph
 */

// @lc code=start

// Node Definition for a Node.
type Node struct {
	Val       int
	Neighbors []*Node
}

func cloneGraph(node *Node) *Node {
	visited := make(map[*Node]*Node)
	return clone(node, visited)
}

func clone(node *Node, visited map[*Node]*Node) *Node {
	if node == nil {
		return node
	}

	// 計算済みの場合はそのまま返す
	if n, ok := visited[node]; ok {
		return n
	}

	visited[node] = &Node{Val: node.Val}
	for _, n := range node.Neighbors {
		visited[node].Neighbors = append(visited[node].Neighbors, clone(n, visited))
	}

	return visited[node]
}

// @lc code=end

func main() {

}
