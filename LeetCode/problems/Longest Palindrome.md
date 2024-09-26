---
Completed on: 2024-09-16
URL: https://leetcode.com/problems/longest-palindrome
tags:
  - hash-table
  - string
  - greedy
"Revision #1": true
"Revision #2": 
"Revision #3": 
Pattern:
  - frequencyMap
---
> A **palindrome** is a word, phrase, number, or other sequences of characters that _reads the same forward and backward_ (ignoring spaces, punctuation, and capitalization). For example, the words "madam" and "racecar" are palindromes, as they read the same in both directions. Similarly, the phrase "A man, a plan, a canal, Panama!" is a palindrome when spaces, punctuation, and capitalization are ignored.

> In the _context of programming and algorithms_, checking for palindromes often involves verifying that _a string or sequence of characters is identical when reversed_. This concept is frequently used in problems related to string manipulation and data validation.

```js title:longest-palindrome.js
/**
 * @param {string} s
 * @return {number}
 */
const longestPalindrome = (s) => {
	const frequencyMap = {};
	for (const char of s) 
		frequencyMap[char] = (frequencyMap[char] || 0) + 1;

	let atLeastOneOdd = false;
	let longestPalindromeLength = 0;

	for (const count of Object.values(frequencyMap)) {
		if (count % 2 === 1) {
			atLeastOneOdd = true;
			// Add the maximum even of the odd counts if it's odd
			// For example, if we have 5 'a's, only use 4 of them
			longestPalindromeLength += count - 1;
		} else {
			// Add all counts if it's even
			longestPalindromeLength += count;
		}
	}

	// If there is at least one odd count,
	// place it in the middle of the palindrome
	if (atLeastOneOdd) longestPalindromeLength++;

	return longestPalindromeLength;
};
```








