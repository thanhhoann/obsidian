---
Completed on: 2024-09-16
URL: https://leetcode.com/problems/best-time-to-buy-and-sell-stock
tags:
  - array
  - dynamic-programming
"Revision #1": true
"Revision #2": 
"Revision #3": 
Pattern:
---
```js title:best-time-to-buy-and-sell-stocks.js
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
