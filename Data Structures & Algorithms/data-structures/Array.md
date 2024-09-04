> An array is a linear data structure that operates as a lineup of _similiar_ items, stored together in a computer's memory incontiguous spaces. It's like a sequence maintains organized storage. Each item has its unique "spot" known as _index_.

```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
includeLinks: true # Make headings clickable
debugInConsole: false # Print debug info in Obsidian console
```

## Common operations
### Initialize O(1)
- Array can be initialized in 2 ways: either _without initial values_ or _with specified values_. If the array isn't specified, _most programming languages_ will set array elements to 0.

### Access O(1)
![[screen_shot 2024-09-03 at 18.07.42.png]]
> Element's memory location = Array's memory location + Element length x Element Index

For example: 012 = 000 + 4 x 3

```python
def random_access(nums: list[int]) -> int:
    """Random access to elements"""
    # Randomly select a number from the interval [0, len(nums)-1]
    random_index = random.randint(0, len(nums) - 1)
    # Retrieve and return a random element
    random_num = nums[random_index]
    return random_num
```

### Insert O(n)
> Due to fixed length of an array, inserting an element wil result in the _loss of the last element_ in the array. **Array List** comes to the rescue.

Array elements are _tightly packed_ in memory, with no space available between them.
_Inserting an element in the middle of array_ requires **shifting all subsequent elements back by one position** to create room for the new element.
```python
def insert(nums: list[int], num: int, index: int):
    """Insert element num at `index`"""
    # Move all elements after `index` one position backward
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # Assign num to the element at index
    nums[index] = num
```

### Delete O(n)
> After deletion, the _former last element_ become _meaningless_. 

To delete an element at index `i`, all elements following index `i` must be **moved forward by one position**.
```python
def remove(nums: list[int], index: int):
    """Remove the element at `index`"""
    # Move all elements after `index` one position forward
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]
```

### Cons of Insertion & Deletion
- High time complexity: Both average time is O(n).
- Loss of elements: Data loss on inserting fixed length array.
- Waste of memory: Initializing a longer array and utilizing only the front part results in "meaningless" end elements during insertion, leading to some wasted memory space. 

### Find
> Because array is linear data structure, this commonly referred as **linear search**. 

Locate an element within an array involves **iterating through the array**, **checking each element** if it matches the provided condition.
```python
def find(nums: list[int], target: int) -> int:
    """Search for a specified element in the array"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1
```

### Expand O(n)
> To know the availability of memory space after an array for _safe capacity extension_ becomes challenging. **The length of an array is immutable** in most programming languages.

To expand an array, we _create a larger array_ (commonly x2 length of former array, takes `O(n)`) then _copy all elements_ from the original array.
```python
def extend(nums: list[int], enlarge: int) -> list[int]:
    """Extend array length"""
    # Initialize an extended length array
    res = [0] * (len(nums) + enlarge)
    # Copy all elements from the original array to the new array
    for i in range(len(nums)):
        res[i] = nums[i]
    # Return the new array after expansion
    return res
```

## Advantages
- **High space complexity**: Array allocates a _contiguous block_ of data in memory, avoiding additional space.
- **Support for random access**: Array allows O(1) accessing any element.
- **Cache locality**: When accessing elements, computer not only _loads_ them but also _caches the surrounding data_, providing high-speed cache for subsequent operation speeds.

## Disadvantages
- **Low efficiency in insertion & deletion**: Both operations require _shifting a large_ number of elements.
- **Fixed length**: The length is fixed after initialized. Expanding requires _copying all elements_, which is expensive.
- **Space wastage**: If the allocated array size exceeds, the extra space is wasted.

## Common Applications
- **Random access**: Ideal for storing data when _random sampling_ is required. We can achieve random sampling efficiently by generate a random sequence based on _indices_.
- **Sorting & Searching**: Arrays are most commonly used for these.
- **Lookup tables**: Quick access or _relationship retrieval_. For example, mapping characters to ASCII codes by using ASCII code values as indices.
- **Machine learning**: Plays a vital role in (neural networking) executing crucial _linear algebra operations_ like vectors, matrices, tensors.
- **Data structure implementation**: Serves as building block for implementing _stacks, queues, hash tables, heaps, graphs, etc_. For example, adjacency matrix is a 2-d array.

## Implmentations
### Hash Table
> A hash table is a data structure _maps keys to values_ for highly efficient lookup.

To **create**, we can use an _array of linked lists_ and a _hash code function_.
To **insert a key and value**, 
1. **Compute the _key's hash code_**, usually results in `int` or `long`. Note that 2 different keys could have the _same hash code_, as there may be an _infinite_ number of keys and a _finite_ number of integers.
2. **Map the hash code to an index** in the array, could be done with `hash(key) % array_length`. Note that 2 different hash codes could map to the _same index_.
3. At this index, there is a linked list of keys & values. **Store** the key & value in this index. _A linked list must be used here_, because of _collisions_: 2 different keys could have the same hash code, or 2 different hash codes could be mapped to the same index.

```python
class HashTable:
    def __init__(self, size=10):
        # Initialize the hash table with a given size, each slot containing an empty list
        self.size = size
        self.table = [[] for _ in range(size)]

    def _hash(self, key):
        # Compute the hash code of the key and map it to an index in the array
        return hash(key) % self.size

    def insert(self, key, value):
        # Insert a key-value pair into the hash table
        index = self._hash(key)
        # Check if the key already exists in the list at the computed index
        for kv in self.table[index]:
            if kv[0] == key:
                kv[1] = value  # Update the value if key already exists
                return
        # If key does not exist, append the key-value pair to the list
        self.table[index].append([key, value])

    def retrieve(self, key):
        # Retrieve the value associated with the key from the hash table
        index = self._hash(key)
        for kv in self.table[index]:
            if kv[0] == key:
                return kv[1]  # Return the value if key is found
        return None  # Return None if key is not found

    def remove(self, key):
        # Remove a key-value pair from the hash table
        index = self._hash(key)
        for i, kv in enumerate(self.table[index]):
            if kv[0] == key:
                del self.table[index][i]  # Remove the key-value pair
                return True
        return False  # Return False if key is not found

    def __str__(self):
        # For displaying the contents of the hash table
        return str(self.table)

# Example usage
hash_table = HashTable()

hash_table.insert("apple", 1)
hash_table.insert("banana", 2)
hash_table.insert("orange", 3)

print(hash_table.retrieve("apple"))   # Output: 1
print(hash_table.retrieve("banana"))  # Output: 2
print(hash_table.retrieve("grape"))   # Output: None

hash_table.remove("banana")
print(hash_table.retrieve("banana"))  # Output: None

print(hash_table)  # Print the entire hash table
```

If number of collisions is _very high_, worst case is O(n), where n is number of keys. On the other hand, a good implementation keeps collisions to minimum, which runtime is O(1).

**Alternatively**, we can implement the hash table with a _balanced binary search tree_, which gives `O(log n)`. The advantage is _using less space_, since we no longer allocate a large array. We can also _iterate through keys in order_, which is useful in some cases.
```python
from sortedcontainers import SortedDict

class BSTHashTable:
    def __init__(self):
        # Initialize the hash table using SortedDict
        self.table = SortedDict()

    def insert(self, key, value):
        # Insert a key-value pair into the table
        self.table[key] = value

    def retrieve(self, key):
        # Retrieve the value associated with the key
        return self.table.get(key, None)

    def remove(self, key):
        # Remove a key-value pair from the table
        if key in self.table:
            del self.table[key]
            return True
        return False

    def keys(self):
        # Return all keys in sorted order
        return list(self.table.keys())

    def __str__(self):
        # For displaying the contents of the hash table
        return str(dict(self.table))

# Example usage
bst_hash_table = BSTHashTable()

bst_hash_table.insert("apple", 1)
bst_hash_table.insert("banana", 2)
bst_hash_table.insert("orange", 3)

print(bst_hash_table.retrieve("apple"))   # Output: 1
print(bst_hash_table.retrieve("banana"))  # Output: 2
print(bst_hash_table.retrieve("grape"))   # Output: None

bst_hash_table.remove("banana")
print(bst_hash_table.retrieve("banana"))  # Output: None

print(bst_hash_table.keys())  # Output: ['apple', 'orange']

print(bst_hash_table)  # Print the entire hash table
```

### StringBuilder()
**The Problem**: Imagine you were concatenating a list of strings. Assuming there are `n` strings, all have same `x` length. 
```java
String joinWords(String[] words) {
	String sentence = "";								  
	for (String word : words) sentence += word;
	return sentence;
}
```
On _each concat_, a new copy is created, and 2 strings are copied over.
- First iteration copy `x` chars -> sentence = `2x` chars.
- Second iteration copy _old_ `2x` chars + _new_ `x` chars -> sentence = `3x`.
- Third iteration copy _old_ `3x` chars + _new_ `x` chars -> sentence = `4x`.

Sum of first n is `n(n+1)/2`, therefore results in `O(x n^2)`.

**The Solution**
Instead of creating a new string for every concatenation, it _appends_ the new string into the array and only _create a new string when needed_, which takes `O(n)`.
```javascript
class StringBuilder {
  constructor() {
    // Initialize an array to hold the parts of the string
    this.parts = [];
  }

  // Append a string to the StringBuilder
  append(str) {
    this.parts.push(str);
    return this; // Return this for method chaining
  }

  // Insert a string at a specific index
  insert(index, str) {
    if (index < 0 || index > this.parts.length) {
      throw new RangeError("Index out of bounds");
    }
    this.parts.splice(index, 0, str);
    return this;
  }

  // Convert all parts into a single string
  toString() {
    return this.parts.join('');
  }

  // Clear the StringBuilder
  clear() {
    this.parts = [];
    return this;
  }

  // Get the length of the StringBuilder content
  length() {
    return this.parts.reduce((total, part) => total + part.length, 0);
  }
}

// Example usage:
const sb = new StringBuilder();
sb.append("Hello, ")
  .append("world!")
  .insert(7, "beautiful ")
  .append(" How are you?");

console.log(sb.toString()); // Output: "Hello, beautiful world! How are you?"
console.log(sb.length());   // Output: 34

sb.clear();
console.log(sb.toString()); // Output: ""
console.log(sb.length());   // Output: 0
```

### IsUnique()
Given a string, **check if a string has all _unique_ characters**.
```javascript

```

### IsPermutation()
Given 2 strings, **check if _one is a permutation of the other_**.

### IsPalindromePermutation()
Given a string, **check if it's a permutation of a palindrome**. A _palindrome_ is a word or phrase that is the same forwards and backwards. A _permutation_ is a re-arrangement of letters. The palindrome doesn't need to be limited to just dictionary words.
For example
- Input: "Tact Coa"
- Output: True (permutations: "taco cat", "atco cta", etc.)

### URLify()
Given a string and its length, **replace all spaces in a string with "%20"**, assuming that the string has _sufficient space at the end to hold additional characters_.
For example
- Input: "a b  c ", 12
- Output: "a%20b%20c"

### IsEdited()
Given 2 strings, **check is it is _inserted a character_, _removed a character_, _replaced a character_, or _not edited_**. 

### RotateMatrix()
Given an image in `NxN` matrix, where each pixel in the image is _4 bytes_, **rotate the image by 90 degrees**.

### ZeroMatrix()
Given a `MxN` matrix, **set its entire rows & columns to 0 if an element in that matrix is 0**.

### StringCompression()
Given a string, **compress it using the counts of repeated characters**.
If the result is _longer_ than the orignal string, return the origin.
Assuming there only be _upper-case_ and _lower-case_ letters.
For example
- Input: "aabcccccaaa"
- Output: "a2b1c5a3"

### StringRotation()
Given 2 strings (`s1` and `s2`) and `isSubstring()` (checks if one word is a substring of another), **check if `s2` is a rotation of `s1` using only ONE call to `isSubstring()`**.
For example
- Input: "waterbottle"
- Output: "erbottlewat"
