package main

import "fmt"

/*
 * @lc app=leetcode id=942 lang=golang
 *
 * [942] DI String Match
 */

// @lc code=start
func diStringMatch(s string) []int {
	a := -1
	b := len(s) + 1
	res := make([]int, len(s)+1)

	for i := 0; i < len(s); i++ {
		if s[i] == 'I' {
			a++
			res[i] = a
		} else {
			b--
			res[i] = b
		}
	}
	res[len(s)] = a + 1
	return res
}

// @lc code=end

func main() {
	fmt.Println(diStringMatch("IDID"))
	fmt.Println(diStringMatch("III"))
	fmt.Println(diStringMatch("DDI"))
}
