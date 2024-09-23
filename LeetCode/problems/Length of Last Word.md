---
Completed on: 2024-09-20
URL: https://leetcode.com/problems/length-of-last-word
tags:
  - string
"Revision #1": 
"Revision #2": 
"Revision #3": 
Pattern:
---
```js title:length-of-last-word.js
/**
 * @param {string} s
 * @return {number}
 */
const lengthOfLastWord = (s) => {
	const split = s.trim().split(" ");
	return split[split.length - 1].length;
};
```








