---
Completed on: 2024-09-16
URL: https://leetcode.com/problems/contains-duplicate
tags:
  - array
  - hash-table
  - sorting
"Revision #1": 
"Revision #2": 
"Revision #3": 
Pattern:
  - frequencyMap
---
```js title:contains-duplicate.js
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








