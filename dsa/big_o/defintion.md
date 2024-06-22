---
id: init
aliases: []
tags: []
---

# Notations
- *Big O*: It represents the upper bound of an algorithm’s time complexity. It denotes the worst-case scenario.
- *Big Omega*: It represents the lower bound of an algorithm’s time complexity. It denotes the best-case scenario.
- *Big Theta*: It represents both the upper and lower bounds of an algorithm’s time complexity, indicating a tight bound on the growth rate of the algorithm.

# Rules
1. Always care about worst-case scenario.
2. Remove constants.
    - Iterate through a half of array is still O(n)
3. Different inputs should have different variables
    - n+m if they are separate
    - n*m if they are nested
4. Only care about dominants 
    - O(n+n^2) => O(n^2)

# Space complexity
- JS .length is O(1)
