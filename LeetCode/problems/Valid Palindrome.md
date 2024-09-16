---
completed_at: 2024-09-16
problem_url: https://leetcode.com/problems/valid-palindrome
tags:
  - two-pointers
  - string
revision_1: 
revision_2: 
revision_3: 
pattern: ""
---
```js
/**
 * @param {string} s
 * @return {boolean}
 */
const isPalindrome = (s) => {
	const transformedString = s.toLowerCase().replace(/[^a-z0-9]/g, "");
	const reversedString = transformedString.split("").reverse().join("");

	if (transformedString === reversedString) return true;
	return false;
};
```