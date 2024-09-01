> The speed at which an algorithm runs.

```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
includeLinks: true # Make headings clickable
debugInConsole: false # Print debug info in Obsidian console
```
## Definition
Time complexity analysis does not count the algorithm's run time, **but rather the growth trend of the run time as the data volume increases**.

Time complexities are divided into _worst, best, and average cases_. **The best case is rarely used** because input data generally needs to meet strict conditions to achieve the best case.

T(n) is a linear function, its growth trend is linear, and therefore, its time complexity is of linear order, denoted as O(n). 
This mathematical notation, known as big-O notation, represents the **asymptotic upper bound of the function T(n)**. In essence, time complexity analysis is about _finding the asymptotic upper bound of the "number of operations T(n)"_. It has a precise mathematical definition.

## Calculation Method
### Counting the number of operations
1. **Ignore constant terms in T(n)**, as they do not affect the time complexity being independent of n.
2. **Omit all coefficients**. For example, looping 2n, 5n+1 times, etc., can be simplified to n times since the coefficient before n does not impact the time complexity.
3. **Use multiplication for nested loops**. The total number of operations equals the product of the number of operations in each loop, applying the simplification techniques from points 1 and 2 for each loop level.

```python
def algorithm(n: int):
    a = 1      # +0 (trick 1)
    a = a + n  # +0 (trick 1)
    # +n (technique 2)
    for i in range(5 * n + 1):
        print(0)
    # +n*n (technique 3)
    for i in range(2 * n):
        for j in range(n + 1):
            print(0)
# Complete Count: T(n) = 2n(n+1) + (5n+1) + 2 = 2n^2 + 7n + 3 
# Simplified Count: T(n) = n^2 + 2 => O(n^2)
```

### Determining the asymptotic upper bound
**The time complexity is determined by the highest order term in T(n)**. This is because, as n approaches infinity, the highest order term dominates, rendering the influence of other terms negligible.

## Common Types
> O(1) < O(log n) < O(n log n) < O(n^2) < O(2^n) < O(n!)
> Constant < Log < Linear < Linear-Log < Quadratic < Exp < Factorial

_Constant order_ means the number of operations is independent of the input data size n. For example, if iterate through an array of size 100000, it's O(1) because the size is unrelated to n.
```python
def constant(n: int) -> int:
    """Constant complexity"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count
```

_Linear order_ indicates the number of operations grows linearly with the input data size n.
```python
def linear(n: int) -> int:
    """Linear complexity"""
    count = 0
    for _ in range(n):
        count += 1
    return count

def array_traversal(nums: list[int]) -> int:
    """Linear complexity (traversing an array)"""
    count = 0
    # Loop count is proportional to the length of the array
    for num in nums:
        count += 1
    return count
```

_Quadratic order_ means the number of operations grows quadratically with the input data size n. Quadratic order typically appears in nested loops, where both the outer and inner loops have a time complexity of O(n), resulting in an overall complexity of O(n^2).
```python
def quadratic(n: int) -> int:
    """Quadratic complexity"""
    count = 0
    # Loop count is squared in relation to the data size n
    for i in range(n):
        for j in range(n):
            count += 1
    return count

def bubble_sort(nums: list[int]) -> int:
    """Quadratic complexity (bubble sort)"""
    count = 0  # Counter
    # Outer loop: unsorted range is [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Swap nums[j] and nums[j + 1]
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # Element swap includes 3 individual operations
    return count
```

_Exponential order_: Biological "cell division" is a classic example of exponential order growth: starting with one cell, it becomes two after one division, four after two divisions, and so on, resulting in 2n cells after n divisions. In practice, exponential order often appears in recursive functions, commonly seen in exhaustive search methods (brute force, backtracking, etc.). For large-scale problems, exponential order is unacceptable, often requiring dynamic programming or greedy algorithms as solutions.
```python
def exp_recur(n: int) -> int:
    """Exponential complexity (recursive implementation)"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1
```

_Logarithmic order - O(log n)_ In contrast to exponential order, logarithmic order reflects situations where "the size is halved each round". Note that _changing the base of log doesn't affect the overall complexity, because difference between logarithms with different bases is just a constant factor, and constants are ignored in Big O analysis_.
```python
def logarithmic(n: int) -> int:
    """Logarithmic complexity (loop implementation)"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count
```

_Linear-logarithmic order - O(n log n)_ often appears in nested loops, with the complexities of the two loops being O(log⁡n) and O(n) respectively. Mainstream sorting algorithms typically have a time complexity of O(nlog⁡n), such as quicksort, mergesort, and heapsort.
```python
def log_recur(n: int) -> int:
    """Logarithmic complexity (recursive implementation)"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1
```

_Factorial order - O(n!)_ corresponds to the mathematical problem of "full permutation". Given n distinct elements, the total number of possible permutations is: n! = n x (n-1) x (n-2) x ... x 2 x 1. Note that factorial order grows even faster than exponential order; it's unacceptable for larger n values.
```python
def factorial_recur(n: int) -> int:
    """Factorial complexity (recursive implementation)"""
    if n == 0:
        return 1
    count = 0
    # From 1 split into n
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count
```

## Average Time Complexity Θ
> Average time complexity reflects the efficiency of an algorithm under random data inputs, closely resembling the algorithm's performance in actual applications.

> The time efficiency of an algorithm is often not fixed but depends on the distribution of the input data.

> Calculating average time complexity requires accounting for the distribution of input data and the subsequent mathematical expectation.

```python
def random_numbers(n: int) -> list[int]:
    """Generate an array with elements: 1, 2, ..., n, order shuffled"""
    # Generate array nums =: 1, 2, 3, ..., n
    nums = [i for i in range(1, n + 1)]
    # Randomly shuffle array elements
    random.shuffle(nums)
    return nums

def find_one(nums: list[int]) -> int:
    """Find the index of number 1 in array nums"""
    for i in range(len(nums)):
        # When element 1 is at the start of the array, achieve best time complexity O(1)
        # When element 1 is at the end of the array, achieve worst time complexity O(n)
        if nums[i] == 1:
            return i
    return -1
```

It's important to note that the best-case time complexity is rarely used in practice, as it is usually only achievable under very low probabilities and might be misleading. **The worst-case time complexity is more practical as it provides a safety value for efficiency**, allowing us to confidently use the algorithm.

From _searching for "1" in random numbers_, it's clear that both the worst-case and best-case time complexities only occur under "special data distributions," which may have a small probability of occurrence and may not accurately reflect the algorithm's run efficiency. In contrast, **the average time complexity can reflect the algorithm's efficiency under random input data**, denoted by the Θ notation.

For some algorithms, we can simply estimate the average case under a random data distribution. For example, in the aforementioned example, since the input array is shuffled, the probability of element 1 appearing at any index is equal. Therefore, the average number of loops for the algorithm is half the length of the array n/2, giving an average time complexity of Θ(n/2)=Θ(n).

However, calculating the average time complexity for more complex algorithms can be quite difficult, as it's challenging to analyze the overall mathematical expectation under the data distribution. In such cases, _we usually use the worst-case time complexity as the standard_ for judging the efficiency of the algorithm.

## Amortized Time
> Average time per operation over a sequence of operations, ensuring that even if some operations are expensive, the overall cost spread across all operations is efficient.

Consider a dynamic array (like an `ArrayList` in Java or a `vector` in C++) that doubles its size whenever it runs out of space:
- **Single Insertion**: Inserting an element into the dynamic array typically takes O(1), except when the array is full.
- **Resizing**: When the array is full, inserting an element causes the array to resize, which involves copying all elements to the new, larger array. This copying operation takes O(n), where n is the number of elements being copied.
If you look at a single insertion operation when resizing occurs, it could be O(n), but this doesn’t happen every time. Most insertions are O(1). _The amortized time for each insertion turns out to be O(1), meaning that, on average, each insertion operation takes constant time_.

## Examples

### Example 1
```java
/* O(ab) */
void funcion(int[] arrayA, int[] arrayB) {
	for (int i = 0; i < arrayA.length; i++) {
		for (int j = 0; j < arrayB.length; j++) {
			if (arrayA[i] < arrayB[j]) {
				/* Print something */
			}	
		}
	}
}

/* O(ab), 10000000 is constant  */
void funcion(int[] arrayA, int[] arrayB) {
	for (int i = 0; i < arrayA.length; i++) {
		for (int j = 0; j < arrayB.length; j++) {
			for (int k = 0; k < 10000000; k++) {
				/* Print something */
			}
		}
	}
}
```

### Example 2
```java
/* O(n), arr.length/2 does not affect the runtime */
void reverse(int[] arr) {
	for (int i = 0; i < arr.length / 2; i++) {
		int other = arr.length - i - 1;
		int temp = arr[i];
		arr[i] = arr[other];
		arr[other] = temp;
	}
}
```

### Example 3
Suppose we had an algorithm took in an array of strings, _sorted each string_, then _sorted the full array_.
- First, let's assume that N is used in 2 different cases: **s: length of string** & **a: length of array**.
- Sort each string: O(s log s)
- Do for each string: O(a x s log s)
- Sort the array: 
	- Compare the strings: O(s) => There are O(a log a) comparisons.
	- Combine together: O(a x s(log a + log s))

### Example 4
This code _sums all node values in a balanced binary search tree._
```java
/* O(n) */
int sum(Node node) {
	if (node == null) {
	return 0
	}
	return sum(node.left) + node.value + sum(node.right);
}
```

> _A recursive function with multiple branches_ is usually O(branches^depth).

There are 2 branches at each call, so O(2^depth).
What is depth? The tree is _balanced binary search tree_, if _there are N total nodes_, depth is _roughly log N_.
Combine together, we get O(2^(log N)).
But 2^(log N) = N. 
Therefore, the runtime is O(N), N is number of nodes.