> https://leetcode.com/problems/two-sum/

```js
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
const twoSum = (nums, target) => {
	for (let i = 0; i <= nums.length; i++) {
		const base = nums[i];
		for (let j = 1; j <= nums.length; j++) {
			const sum = base + nums[j];
			if (sum === target && i !== j) return [i, j];
		}
	}
};
```
