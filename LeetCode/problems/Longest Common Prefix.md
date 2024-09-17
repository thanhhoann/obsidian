---
completed_at: 2024-09-17
problem_url: https://leetcode.com/problems/longest-common-prefix
tags:
  - string
  - trie
revision_1: 
revision_2: 
revision_3: 
pattern:
---
```js
/**
 * @param {string[]} strs
 * @return {string}
 */
const longestCommonPrefix = (strs) => {
	// The array of strings `strs` is sorted lexicographically (alphabetically).
	// The first and last strings in the sorted list will have the least amount of similarity compared to the rest of the strings.
	const sortedStrs = strs.sort();
	let ans = "";

	const firstStr = sortedStrs[0];
	const lastStr = sortedStrs[sortedStrs.length - 1];

	// The length of the shorter string between `firstStr` and `lastStr`
	// is determined. This is because the common prefix cannot be longer
	// than the shortest string.
	const len = Math.min(firstStr.length, lastStr.length);

	for (let i = 0; i < len; i++) {
		if (firstStr[i] !== lastStr[i]) return ans;
		ans += firstStr[i];
	}

	return ans;
};
```








