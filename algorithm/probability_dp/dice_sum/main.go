// https://compro.tsutaj.com//archive/180220_probability_dp.pdf

// 出た目の和 (確率編)

// 1 から 6 までの整数が等確率に出るサイコロが 1 つある．このサイコロを
// N 回振るとき，出た目の数の和が K 以上になる確率を求めよ．
// 1 ≤ N ≤ 2 × 103
// 1 ≤ K ≤ 6 × N

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

	dp[0][0] = 1.0
	// サイコロを振る回数
	for i := 0; i < N; i++ {
		// 合計
		for j := 0; j <= K; j++ {
			// サイコロの目
			for k := 1; k <= 6; k++ {
				fmt.Println(i, j, k, dp[i][j])
				dp[i+1][min(K, j+k)] += dp[i][j] / 6.0
			}
		}
	}
	fmt.Println(dp[N][K])
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func main() {
	probability(1, 4)
	probability(3, 5)
}
