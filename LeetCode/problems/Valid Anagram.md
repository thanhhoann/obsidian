---
Completed on: 2024-09-16
URL: https://leetcode.com/problems/valid-anagram
tags:
  - hash-table
  - string
  - sorting
"Revision #1": 
"Revision #2": 
"Revision #3": 
Pattern: frequencyMap
---
```js title:valid-anagram.js
/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
const isAnagram = (s, t) => {
	if (s.length !== t.length) return false;

	const frequencyMap = {};

	for (const char of s) {
		frequencyMap[char] = (frequencymap[char] || 0) + 1;
	}

	for (const char of t) {
		if (!frequencyMap[char]) return false;
		frequencyMap[char]--;
	}

	return true;
};
```