---
Completed on: 2024-09-18
URL: https://leetcode.com/problems/counter
tags:
  - javascript
"Revision #1": 
"Revision #2": 
"Revision #3": 
Pattern:
---
```js title:counter.js
/**
 * @param {number} n
 * @return {Function} counter
 */
const createCounter = (n) => {
	let count = n;

	return () => {
		return count++;
	};
};

/**
 * const counter = createCounter(10)
 * counter() // 10
 * counter() // 11
 * counter() // 12
 */
```








