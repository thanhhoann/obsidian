---
completed_at: 2024-09-17
problem_url: https://leetcode.com/problems/roman-to-integer
tags:
  - hash-table
  - map
  - string
revision_1: 
revision_2: 
revision_3: 
pattern:
---
```js
/**
 * @param {string} s
 * @return {number}
 */
const romanToInt = (s) => {
	const valueMap = {
		I: 1,
		V: 5,
		X: 10,
		L: 50,
		C: 100,
		D: 500,
		M: 1000,
	};

	let sum = 0;

	for (let i = 0; i < s.length; i++) {
		const current = valueMap[s[i]];
		const next = valueMap[s[i + 1]];

		if (current < next) {
			// If it's smaller
			sum -= current;
		} else {
			// Or if it's bigger or equals
			sum += current;
		}
	}

	return sum;
};
```








