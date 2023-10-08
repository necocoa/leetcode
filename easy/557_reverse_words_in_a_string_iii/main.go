package main

import "fmt"

/*
 * @lc app=leetcode id=557 lang=golang
 *
 * [557] Reverse Words in a String III
 */

// @lc code=start
func reverseWords(s string) string {
	l := 0
	ans := ""
	for i := 0; i < len(s); i++ {
		if s[i] == ' ' {
			ans += reverse(s[l:i]) + " "
			l = i + 1
		}
		if i == len(s)-1 {
			ans += reverse(s[l : i+1])
		}
	}
	return ans
}

func reverse(s string) string {
	ans := ""
	for i := len(s) - 1; i >= 0; i-- {
		ans += string(s[i])
	}
	return ans
}

// @lc code=end

func main() {
	fmt.Println(reverseWords("Let's take LeetCode contest"))
	fmt.Println(reverseWords("God Ding"))
}
