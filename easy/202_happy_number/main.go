package main

/*
 * @lc app=leetcode id=202 lang=golang
 *
 * [202] Happy Number
 */

// @lc code=start
func isHappy(n int) bool {
	hash := make(map[int]bool)

	for n != 1 {
		n = calc(n)
		if _, ok := hash[n]; ok {
			return false
		}
		hash[n] = true
	}

	return true
}

func calc(n int) int {
	res := 0
	for n > 0 {
		a := n % 10
		n = n / 10
		res += a * a
	}
	return res
}

// @lc code=end

func main() {
	isHappy(19)
	isHappy(4)
}
