---
Completed on: 2024-09-20
URL: https://leetcode.com/problems/length-of-last-word
tags:
  - string
"Revision #1": true
"Revision #2": 
"Revision #3": 
Pattern:
---
```js title:length-of-last-word-01.js
/**
 * @param {string} s
 * @return {number}
 */
const lengthOfLastWord = (s) => {
	const split = s.trim().split(" ");
	return split[split.length - 1].length;
};
```

```js title:length-of-last-word-02.js
/**
 * @param {string} s
 * @return {number}
 */
const lengthOfLastWord = (s) => {
	const split = s.split(" ").filter(word => word.length > 0);
	return split[split.length - 1].length;
};
```








