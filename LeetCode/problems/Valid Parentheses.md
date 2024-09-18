---
Completed on: 2024-09-15
URL: https://leetcode.com/problems/valid-parentheses
tags:
  - stack
  - string
"Revision #1": 
"Revision #2": 
"Revision #3": 
Pattern: ""
---
```js title:valid-parentheses.js
/**
 * @param {string} s
 * @return {boolean}
 */
const isValid = (s) => {
	const stack = [];
	const map = {
		"(": ")",
		"[": "]",
		"{": "}",
	};
	for (let i = 0; i < s.length; i++) {
		const el = s[i];
		if (el === "(" || el === "[" || el === "{") {
			stack.push(el);
		} else {
			// Doesn't have opening bracket
			if (stack.length === 0) return false;
			// Otherwise, check if the top in the stack is the opening bracket
			const pop = stack.pop();
			if (map[pop] !== el) return false;
		}
	}
	if (stack.length === 0) return true;
	return false;
};
```