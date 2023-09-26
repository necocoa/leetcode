package main

import (
	"fmt"
	"strings"
)

/*
 * @lc app=leetcode id=12 lang=golang
 *
 * [12] Integer to Roman
 */

// @lc code=start

func intToRoman(num int) string {
	romanMap := map[string]int{
		"I": 1,
		"V": 5,
		"X": 10,
		"L": 50,
		"C": 100,
		"D": 500,
		"M": 1000,
	}
	romanNextMap := map[string]string{
		"V": "I",
		"X": "I",
		"L": "X",
		"C": "X",
		"D": "C",
		"M": "C",
	}
	romanMax := []string{"M", "D", "C", "L", "X", "V", "I"}
	var ans string

	for i, roman := range romanMax {
		romanInt, _ := romanMap[roman]

		// 1, 5, 10の単位を処理
		if count := num / romanInt; count > 0 {
			num -= count * romanInt
			ans += strings.Repeat(roman, count)
		}

		// 最後の文字はスキップ
		if i >= len(romanMax)-1 {
			continue
		}

		// 4, 9の単位を処理
		romanNext := romanNextMap[roman]
		romanNextInt, _ := romanMap[romanNext]
		if count := num / (romanInt - romanNextInt); count > 0 {
			num -= count * (romanInt - romanNextInt)
			ans += romanNext + roman
		}

	}

	return ans
}

// @lc code=end

func main() {
	fmt.Println(intToRoman(1994))
}
