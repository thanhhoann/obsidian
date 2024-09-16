---
completed_at: 2024-09-16
problem_url: https://leetcode.com/problems/best-time-to-buy-and-sell-stock
tags:
  - array
  - dynamic-programming
revision_1: 
revision_2: 
revision_3: 
pattern: ""
---
```js
/**
 * @param {number[]} prices
 * @return {number}
 */
const maxProfit = (prices) => {
	let minPrice = prices[0];
	let maxProfit = 0;

	for (let i = 0; i <= prices.length - 1; i++) {
		const currentPrice = prices[i];
		if (currentPrice < minPrice) {
			minPrice = currentPrice;
		} else {
			maxProfit = Math.max(maxProfit, currentPrice - minPrice);
		}
	}

	return maxProfit;
};
```