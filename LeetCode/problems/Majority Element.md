---
completed_at: 2024-09-16
problem_url: https://leetcode.com/problems/majority-element
tags:
  - array
  - hash-table
  - divide-and-conquer
  - sorting
  - counting
revision_1: 
revision_2: 
revision_3: 
pattern:
  - frequencyMap
---
```js
/**
 * @param {number[]} nums
 * @return {number}
 */
const majorityElement = (nums) => {
	const frequencyMap = {};
	for (const num of nums) {
		frequencyMap[num] = (frequencyMap[num] || 0) + 1;
		if (frequencyMap[num] > nums.length / 2) return num;
	}
};
```








