---
Completed on: 2024-09-18
URL: https://leetcode.com/problems/counter-ii
tags:
  - javascript
"Revision #1": 
"Revision #2": 
"Revision #3": 
Pattern:
---
```js title:counter-ii.js
/**
 * @param {integer} init
 * @return { increment: Function, decrement: Function, reset: Function }
 */
const createCounter = (init) => {
	let base = init;
	return {
		increment: () => ++base,
		decrement: () => --base,
		reset: () => (base = init),
	};
};

/**
 * const counter = createCounter(5)
 * counter.increment(); // 6
 * counter.reset(); // 5
 * counter.decrement(); // 4
 */
```








