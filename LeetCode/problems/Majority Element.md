---
Completed on: 2024-09-16
URL: https://leetcode.com/problems/majority-element
tags:
  - array
  - hash-table
  - divide-and-conquer
  - sorting
  - counting
"Revision #1": true
"Revision #2": 
"Revision #3": 
Pattern:
  - frequencyMap
---
```js title:majority-element.js
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








