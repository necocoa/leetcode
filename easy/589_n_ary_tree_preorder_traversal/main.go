package main

import "fmt"

type Node struct {
	Val      int
	Children []*Node
}

func postorder(root *Node) []int {
	result := []int{}
	dfs(root, &result)
	return result
}

func dfs(node *Node, result *[]int) {
	if node == nil {
		return
	}

	for _, n := range node.Children {
		dfs(n, result)
	}
	*result = append(*result, node.Val)
}

func main() {
	// root = [1,null,3,2,4,null,5,6]
	root := &Node{
		Val: 1,
		Children: []*Node{
			{
				Val: 3,
				Children: []*Node{
					{
						Val: 5,
					},
					{
						Val: 6,
					},
				},
			},
			{
				Val: 2,
			},
			{
				Val: 4,
			},
		},
	}

	fmt.Println(postorder(root))
}
