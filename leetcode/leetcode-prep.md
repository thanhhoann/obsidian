---
id: leetcode-prep
aliases: []
tags: []
---

- Learn solution and its pattern => pratice and apply learned pattern
- Being solid = able to solve _common medium level_ questions in _30 mins_
- Study solutions
  - What does it does
  - How it's implemented
  - How it address edge cases
  - Do dry run(s)
  - If you cannot understand => keep studying until you find the gap

# Patterns

## Sliding window

- Goal : find a window within the array that satisfies a condition
- Steps :

  1. Expand the window
  2. Meet the condition
  3. Contract the window
  4. Redo the process until it's done

- example : find longest executives 1

```
[1,1,0,1,1,1]
```

- expand the window until finds 0 => max = 2
- window starts again at index 3, then continue expanding the window
