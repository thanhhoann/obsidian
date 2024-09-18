---
Completed on: 2024-09-16
URL: https://leetcode.com/problems/valid-palindrome
tags:
  - two-pointers
  - string
"Revision #1": 
"Revision #2": 
"Revision #3": 
Pattern: ""
---
```js title:valid-palindrome.js
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