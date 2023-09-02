package main

import "fmt"

func twoSum(nums []int, target int) []int {
	m := make(map[int]int)

	for i, n := range nums {
		if mI, ok := m[target-n]; ok {
			return []int{mI, i}
		}
		m[n] = i
	}

	return []int{}
}

func main() {
	fmt.Println(twoSum([]int{2, 7, 11, 15}, 9))
}
