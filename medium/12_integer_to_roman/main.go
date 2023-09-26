package main

import (
	"fmt"
)

/*
 * @lc app=leetcode id=12 lang=golang
 *
 * [12] Integer to Roman
 */

// @lc code=start

func intToRoman(num int) string {
	roman := []string{"I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"}
	value := []int{1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000}

	var ans string

	for i := len(roman) - 1; i >= 0; i-- {
		for num >= value[i] {
			ans += roman[i]
			num -= value[i]
		}
	}

	return ans
}

// @lc code=end

func main() {
	fmt.Println(intToRoman(3))
	fmt.Println(intToRoman(58))
	fmt.Println(intToRoman(1994))
}
