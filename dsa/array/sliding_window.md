---
id: sliding_window
aliases: []
tags: []
---

<!--
 !      ──────── Longest Substring Without Repeating Characters (**) ────────
-->
https://leetcode.com/problems/longest-substring-without-repeating-characters/
**brute force**
- let max is 0
- iterate the string from the start (i)
    - let temp[] contains the substring
    - iterate the string from i (j)
        - if temp contains it, then break the loop
        - if not, then push it to temp
        - if len of temp > max, then max = temp len
- return max

<!--
 !      ───────────────────── Minimum Window Substring ────────────────────
-->
https://leetcode.com/problems/minimum-window-substring/


<!--
 !      ───────────────────── Minimum Size Subarray Sum ─────────────────────
-->
https://leetcode.com/problems/minimum-size-subarray-sum/

