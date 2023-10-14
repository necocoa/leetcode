// https://compro.tsutaj.com//archive/180220_probability_dp.pdf

// 問題 (コイントス)

// コイントスを N 回行うとき，表または裏が K 回以上連続で出る確率を求
// めよ．
// 1 ≤ N ≤ 2 × 103
// 1 ≤ K ≤ N

package main

import "fmt"

const MAX_N = 2010

// N回サイコロを振って、K以上になる確率を求める
func probability(N, K int) {
	// 2次元配列を初期化
	dp := make([][]float64, MAX_N)
	for i := range dp {
		dp[i] = make([]float64, 6*MAX_N)
	}

	dp[1][1] = 1

	// コイントスの回数
	for i := 1; i < N; i++ {
		// 表または裏が連続で出る回数
		for j := 0; j < K; j++ {
			if j+1 < K {
				fmt.Println(i, j, dp[i][j])
				dp[i+1][j+1] += dp[i][j] / 2.0
			}
			dp[i+1][1] += dp[i][j] / 2.0
		}
	}

	sum := 0.0
	for i := 0; i < K; i++ {
		sum += dp[N][i]
	}
	fmt.Println(1 - sum)
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func main() {
	probability(3, 3)
	probability(100, 10)
}
