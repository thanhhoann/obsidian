```javascript
for (const num of nums) {
    frequencyMap[num] = (frequencyMap[num] || 0) + 1;
}
```
- `(map[num] || 0)`: If `map[num]` is `undefined` (i.e., `num` has not been encountered before), it defaults to `0`.
- `+ 1`: Increments the count of the current `num` by 1.

## Problems
- [[Valid Anagram]]
- [[Contains Duplicate]]
- [[Ransom Note]]
- [[Longest Palindrome]]
- [[Majority Element]]