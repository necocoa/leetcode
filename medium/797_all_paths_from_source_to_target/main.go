package main

import "fmt"

/*
 * @lc app=leetcode id=797 lang=golang
 *
 * [797] All Paths From Source to Target
 */

// @lc code=start
func allPathsSourceTarget(graph [][]int) [][]int {
	res := [][]int{}
	dfs(graph, &res, []int{0})
	return res
}

func dfs(graph [][]int, res *[][]int, path []int) {
	lv := path[len(path)-1]

	// 末端のNodeを指していたら、pathをresに追加して終了
	if lv == len(graph)-1 {
		p := make([]int, len(path))
		copy(p, path)
		*res = append(*res, p)
		return
	}

	for _, v := range graph[lv] {
		dfs(graph, res, append(path, v))
	}
}

// @lc code=end

func main() {
	// allPathsSourceTarget([][]int{{1, 2}, {3}, {3}, {}})
	// allPathsSourceTarget([][]int{{4, 3, 1}, {3, 2, 4}, {3}, {4}, {}})
	// [[3,1],[4,6,7,2,5],[4,6,3],[6,4],[7,6,5],[6],[7],[]]
	fmt.Println(allPathsSourceTarget([][]int{{3, 1}, {4, 6, 7, 2, 5}, {4, 6, 3}, {6, 4}, {7, 6, 5}, {6}, {7}, {}}))
}
