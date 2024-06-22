---
id: array
aliases:
  - techniques
  - time complexity
tags:
  - dsa_learn
---

# time complexity

## common cases
- Access : O(1) [why array'string access method is O(1) ?](300 leetcode problems/learns/why/array_why.md)
- Search : O(n)
- Insert : O(n)
- Remove : O(n)

## special cases
- Search (sorted array) : O(log(n))
- Remove (at the end) : O(1)
- Insert (at the end) : O(1)

# corner cases
- Empty sequence
- Sequence with 1 or 2 elements
- Sequence with repeated elements
- Duplicated values in the sequence

# techniques

## sliding window
- Applies to many subarray/substring problems
- In a sliding window, the two pointers usually move in the same directioni will never overtake each other
- Ensures that each value is only visited at most twice
- Time complexity : 0(n)
- Examples:
  - [Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
  - [Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/)
  - [Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)

## two pointers
- A more general version of sliding window where the pointers can cross each other and can be on different arrays.
- Examples:
  - [Sort Colors](https://leetcode.com/problems/sort-colors/)
  - [Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings/)

- When you are given two arrays to process, it is common to have one index per array (pointer) to traverse/compare the both of them, incrementing one of the pointers when relevant. For example, we use this approach to merge two sorted arrays.
- Examples: [Merge Sorted Array](https://leetcode.com/problems/merge-sorted-array/)

## traversing from the right
- Sometimes you can traverse the array starting from the right instead of the conventional approach of from the left. 
- Examples: 
	- [Daily Temperatures](https://leetcode.com/problems/daily-temperatures/), 
	- [Number of Visible People in a Queue](https://leetcode.com/problems/number-of-visible-people-in-a-queue/)

## sorting the array
- Is the array sorted or partially sorted? If it is, some form of binary search should be possible. This also usually means that the interviewer is looking for a solution that is faster than O(n).

- Can you sort the array? Sometimes sorting the array first may significantly simplify the problem. Obviously this would not work if the order of array elements need to be preserved. 
- Examples: [Merge Intervals](https://leetcode.com/problems/merge-intervals/), [Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/)

## precomputation
- For questions where summation or multiplication of a subarray is involved, pre-computation using hashing or a prefix/suffix sum/product might be useful. 
- Examples: 
	- [Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self/), 
	- [Minimum Size Subarray Sum](https://leetcode.com/problems/minimum-size-subarray-sum/), 
	- [LeetCode questions tagged "prefix-sum"](https://leetcode.com/tag/prefix-sum/)

## index as a hash key
- If you are given a sequence and the interviewer asks for O(1) space, it might be possible to use the array itself as a hash table. For example, if the array only has values from 1 to N, where N is the length of the array, negate the value at that index (minus one) to indicate presence of that number. 
- Examples: 
	- [First Missing Positive](https://leetcode.com/problems/first-missing-positive/), 
	- [Daily Temperatures](https://leetcode.com/problems/daily-temperatures/)
	
## traversing the array more than once
- This might be obvious, but traversing the array twice/thrice (as long as fewer than n times) is still O(n). 
- Sometimes traversing the array more than once can help you solve the problem while keeping the time complexity to O(n).