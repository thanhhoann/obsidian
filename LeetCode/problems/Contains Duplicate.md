---
completed_at: 2024-09-16
problem_url: https://leetcode.com/problems/contains-duplicate
tags:
  - array
  - hash-table
  - sorting
revision_1: 
revision_2: 
revision_3: 
pattern:
  - frequencyMap
---
```js
/**
 * @param {number[]} nums
 * @return {boolean}
 */
const containsDuplicate = (nums) => {
	const frequencyMap = {};
	for (const num of nums) {
		frequencyMap[num] = (frequencyMap[num] || 0) + 1;
		if (frequencyMap[num] > 1) return true;
	}
	return false;
};
```








