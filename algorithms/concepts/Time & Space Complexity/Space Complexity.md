> The size of the memory space occupied by an algorithm.

```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
includeLinks: true # Make headings clickable
debugInConsole: false # Print debug info in Obsidian console
```
## Definition
Space complexity is used to measure the growth trend of the memory space occupied by an algorithm as the amount of data increases. This concept is very similar to time complexity, except that "running time" is replaced with "occupied memory space".

The memory space used by an algorithm during its execution mainly includes the following types:
- **Input space**: Used to store the input data of the algorithm.
- **Temporary space**: Used to store variables, objects, function contexts, and other data during the algorithm's execution.
	- **Temporary data**: Used to save various constants, variables, objects, etc., during the algorithm's execution.
	- **Stack frame space**: Used to save the context data of the called function. The system creates a stack frame at the top of the stack each time a function is called, and the stack frame space is released after the function returns. _Stack frame space usually affects space complexity only in recursive functions._
	- **Instruction space**: Used to store compiled program instructions, which are usually negligible in actual statistics.
- **Output space**: Used to store the output data of the algorithm.
> When analyzing the space complexity of a program, **we typically count the Temporary Data, Stack Frame Space, and Output Data**

```python
class Node:
    """Classes"""
    def __init__(self, x: int):
        self.val: int = x               # node value
        self.next: Node | None = None   # reference to the next node

def function() -> int:
    """Functions"""
    # Perform certain operations...
    return 0

def algorithm(n) -> int:    # input data
    A = 0                   # temporary data (constant, usually in uppercase)
    b = 0                   # temporary data (variable)
    node = Node(0)          # temporary data (object)
    c = function()          # Stack frame space (call function)
    return A + b + c        # output data
```

## Calculation Method
> The method for calculating space complexity is roughly similar to that of time complexity, with the only change being the shift of the statistical object from "number of operations" to "size of used space".

Only focus on _worst-case_. This is because memory space is a _hard requirement_, ensures that there's enough space for all input data.
The _worst-case_ space complexity has 2 meanings:
1. **Based on worst input data**: When n < 10, the space complexity is O(1); but when n > 10, the initialized array `nums` occupies O(n) space, thus the worst-case space complexity is O(n).
```python
def algorithm(n: int):
    a = 0               # O(1)
    b = [0] * 10000     # O(1)
    if n > 10:
        nums = [0] * n  # O(n)
```

2. **Based on the peak memory used during the algorithm's execution**: For example, before executing the last line, the program occupies O(1) space; when initializing the array `nums`, the program occupies O(n) space, hence the worst-case space complexity is O(n).

**In recursive functions, stack frame space must be taken into count**.
```python
def function() -> int:
    # Perform certain operations
    return 0

# The time complexity of both `loop()` and `recur()` functions is O(n), but their space complexities differ. 
def loop(n: int):
    # Loop O(1)
	# The `loop()` function calls `function()` n times in a loop, where each iteration's `function()` returns and releases its stack frame space, so the space complexity remains O(1).
    for _ in range(n):
        function()

def recur(n: int):
    # Recursion O(n)
	# The recursive function `recur()` will have n instances of unreturned `recur()` existing simultaneously during its execution, thus occupying O(n) stack frame space.
    if n == 1:
        return
    return recur(n - 1)
```

## Common Types
> O(1) < O(log n) < O(n) < O(n^2) < O(2^n)
> Constant < Logarithm < Linear < Quadratic < Exponential

_Constant order_ is common in constants, variables, objects that are independent of the size of input data n.
> Memory occupied by initializing variables or calling functions in a loop, which is released upon entering the next cycle, does not accumulate over space, thus the space complexity remains O(1)
```python
def function() -> int:
    """Function"""
    # Perform some operations
    return 0

def constant(n: int):
    """Constant complexity"""
    # Constants, variables, objects occupy O(1) space
    a = 0
    nums = [0] * 10000
    node = ListNode(0)
    # Variables in a loop occupy O(1) space
    for _ in range(n):
        c = 0
    # Functions in a loop occupy O(1) space
    for _ in range(n):
        function()
```

_Linear order_ is common in arrays, linked lists, stacks, queues, etc., where the number of elements is proportional to n.
```python
def linear(n: int):
    """Linear complexity"""
    # A list of length n occupies O(n) space
    nums = [0] * n
    # A hash table of length n occupies O(n) space
    hmap = dict[int, str]()
    for i in range(n):
        hmap[i] = str(i)

def linear_recur(n: int):
    """Linear complexity (recursive implementation)"""
    print("Recursive n =", n)
    if n == 1:
        return
    linear_recur(n - 1)
```

_Quadratic order - O(n^2)_ is common in matrices and graphs, where the number of elements is quadratic to n.
```python
def quadratic(n: int):
    """Quadratic complexity"""
    # A two-dimensional list occupies O(n^2) space
    num_matrix = [[0] * n for _ in range(n)]

def quadratic_recur(n: int) -> int:
    """Quadratic complexity (recursive implementation)"""
    if n <= 0:
        return 0
    # Array nums length = n, n-1, ..., 2, 1
    nums = [0] * n
    return quadratic_recur(n - 1)
```

_Exponential order_ is common in binary trees. [Observe Figure 2-19](https://www.hello-algo.com/en/chapter_computational_complexity/space_complexity.assets/space_complexity_exponential.png), a "full binary tree" with n levels has 2n−1 nodes, occupying O(2n) space
```python
def build_tree(n: int) -> TreeNode | None:
    """Exponential complexity (building a full binary tree)"""
    if n == 0:
        return None
    root = TreeNode(0)
    root.left = build_tree(n - 1)
    root.right = build_tree(n - 1)
    return root
```

_Logarithmic order - O(log n)_ is common in divide-and-conquer algorithms. For example, in merge sort, an array of length n is recursively divided in half each round, forming a recursion tree of height log⁡ n, using O(log⁡n) stack frame space. Another example is converting a number to a string. Given a positive integer n, its number of digits is log10⁡n+1, corresponding to the length of the string, thus the space complexity is O(log10⁡n+1)=O(log⁡n).
