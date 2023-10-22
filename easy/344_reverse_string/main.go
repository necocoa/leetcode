package main

import "fmt"

/*
 * @lc app=leetcode id=344 lang=golang
 *
 * [344] Reverse String
 */

// @lc code=start
func reverseString(s []byte) {
	for i := 0; i < len(s)/2; i++ {
		s[i], s[len(s)-i-1] = s[len(s)-i-1], s[i]
	}
	fmt.Println(s)
	return
}

// @lc code=end

func main() {
	reverseString([]byte("hello"))
}
