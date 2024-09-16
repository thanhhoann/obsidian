---
completed_at: 2024-09-16
problem_url: https://leetcode.com/problems/ransom-note
tags:
  - hash-table
  - string
  - counting
revision_1: 
revision_2: 
revision_3: 
pattern:
  - frequencyMap
---
```js
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








