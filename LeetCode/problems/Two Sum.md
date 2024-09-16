---
completed_at: 2024-09-14
problem_url: https://leetcode.com/problems/two-sum
tags:
  - array
  - hash-table
revision_1: false
revision_2: false
revision_3: false
pattern: ""
---
```js
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
const twoSum = (nums, target) => {
	for (let i = 0; i <= nums.length; i++) {
		const base = nums[i];
		for (let j = 1; j <= nums.length; j++) {
			const sum = base + nums[j];
			if (sum === target && i !== j) return [i, j];
		}
	}
};
```
