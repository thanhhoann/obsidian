---
Completed on: 2024-09-16
URL: https://leetcode.com/problems/ransom-note
tags:
  - hash-table
  - string
  - counting
"Revision #1": 
"Revision #2": 
"Revision #3": 
Pattern:
  - frequencyMap
---
```js title:ransom-note.js
/**
 * @param {string} ransomNote
 * @param {string} magazine
 * @return {boolean}
 */
const canConstruct = (ransomNote, magazine) => {
	// includes() compare strings in exact order,
	// so we cannot use here

	const freqMapRansomNote = {};
	for (const char of ransomNote)
		freqMapRansomNote[char] = (freqMapRansomNote[char] || 0) + 1;

	const freqMapMagazine = {};
	for (const char of magazine)
		freqMapMagazine[char] = (freqMapMagazine[char] || 0) + 1;

	for (const char of ransomNote) {
		if (
			// if char in ransomNote appears more
			freqMapRansomNote[char] > freqMapMagazine[char] ||
			// or if char does not exist in magazine
			!freqMapMagazine[char]
		)
			return false;
	}
	return true;
};
```








