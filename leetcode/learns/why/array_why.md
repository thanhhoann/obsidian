---
id: array_why
aliases:
  - Why array's access method is O(1) ?
tags: []
---

# Why array's access method is O(1) ?

Since arrays have contiguous memory locations, computer can directly compute the memory address of the desired element using this formula.

```
addressOfElement = baseAddress + (index * sizeOfEachElement)
```

- baseAddress : memory address of the beginning of array
- index : position of element to access
- sizeOfEachElement : size (in bytes) of each element

As a result, accessing an element in an array involves a simple calculation that doesn't depend on the size of the array.
