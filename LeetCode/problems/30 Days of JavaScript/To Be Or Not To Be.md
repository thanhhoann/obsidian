---
Completed on: 2024-09-18
URL: https://leetcode.com/problems/to-be-or-not-to-be
tags:
  - javascript
"Revision #1": 
"Revision #2": 
"Revision #3": 
Pattern:
---
```js title:to-be-or-not-to-be.js
/**
 * @param {string} val
 * @return {Object}
 */
const expect = (val) => {
	return {
		toBe: (expectVal) => {
			if (val === expectVal) {
				return true;
			}
			throw new Error("Not Equal");
		},

		notToBe: (expectVal) => {
			if (val !== expectVal) {
				return true;
			}
			throw new Error("Equal");
		},
	};
};

/**
 * expect(5).toBe(5); // true
 * expect(5).notToBe(5); // throws "Equal"
 */
```








