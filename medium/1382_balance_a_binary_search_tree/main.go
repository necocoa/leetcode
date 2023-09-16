package main

/*
 * @lc app=leetcode id=1382 lang=golang
 *
 * [1382] Balance a Binary Search Tree
 */

// @lc code=start

// TreeNode Definition for a binary tree node.
type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

func balanceBST(root *TreeNode) *TreeNode {
	nums := nodeToArray(root)
	return sortedArrayToBST(nums)
}

func nodeToArray(root *TreeNode) []int {
	if root == nil {
		return []int{}
	}

	path := append(nodeToArray(root.Left), root.Val)
	return append(path, nodeToArray(root.Right)...)
}

func sortedArrayToBST(nums []int) *TreeNode {
	if len(nums) == 0 {
		return nil
	}
	return constructBST(nums, 0, len(nums)-1)
}

func constructBST(nums []int, left, right int) *TreeNode {
	if left > right {
		return nil
	}

	mid := left + (right-left)/2
	root := &TreeNode{Val: nums[mid]}
	root.Left = constructBST(nums, left, mid-1)
	root.Right = constructBST(nums, mid+1, right)

	return root
}

// @lc code=end

func main() {
	r1 := &TreeNode{
		Val: 1,
		Right: &TreeNode{
			Val: 2,
			Right: &TreeNode{
				Val: 3,
				Right: &TreeNode{
					Val: 4,
				},
			},
		},
	}
	balanceBST(r1)
	r2 := &TreeNode{
		Val: 2,
		Left: &TreeNode{
			Val: 1,
		},
		Right: &TreeNode{
			Val: 3,
		},
	}
	balanceBST(r2)
	r3 := &TreeNode{
		Val: 3,
		Left: &TreeNode{
			Val: 1,
			Right: &TreeNode{
				Val: 2,
			},
		},
		Right: &TreeNode{
			Val: 4,
		},
	}
	balanceBST(r3)
}
