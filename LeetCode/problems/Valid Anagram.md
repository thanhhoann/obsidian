---
completed_at: 2024-09-16
problem_url: https://leetcode.com/problems/valid-anagram
tags:
  - hash-table
  - string
  - sorting
revision_1: 
revision_2: 
revision_3: 
pattern: frequencyMap
---
```js
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