package main

import "fmt"

/*
 * @lc app=leetcode id=832 lang=golang
 *
 * [832] Flipping an Image
 */

// @lc code=start
func flipAndInvertImage(image [][]int) [][]int {
	for _, rows := range image {
		// 左右と値を反転する
		for j := 0; j < len(rows)/2; j++ {
			rows[j], rows[len(rows)-1-j] = rows[len(rows)-1-j]^1, rows[j]^1
		}
		// 奇数の場合は真ん中の値を反転する
		if len(rows)%2 == 1 {
			j := len(rows) / 2
			rows[j] = rows[j] ^ 1
		}
	}
	return image
}

// @lc code=end

func main() {
	fmt.Println(flipAndInvertImage([][]int{{1, 1, 0}, {1, 0, 1}, {0, 0, 0}}))
	fmt.Println(flipAndInvertImage([][]int{{1, 1, 0, 0}, {1, 0, 0, 1}, {0, 1, 1, 1}, {1, 0, 0, 1}}))
}
