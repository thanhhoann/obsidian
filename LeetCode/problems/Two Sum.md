---
Completed on: 2024-09-14
URL: https://leetcode.com/problems/two-sum
tags:
  - array
  - hash-table
"Revision #1": false
"Revision #2": false
"Revision #3": false
Pattern: ""
---
```js title:two-sum.js
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
