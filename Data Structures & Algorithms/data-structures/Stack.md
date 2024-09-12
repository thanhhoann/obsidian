A linear data structure follows **Last-in-First-out (LIFO)**.
Accessing the bottom node by removing the top node (of the stack).

A stack can be seen as **a restricted array or linked list**, while both _arrays and linked lists allow adding & removing elements at any position_.
This can be useful to **shield irrelevant operations** of an array or linked list.

## Operations

```js
const stack = []

// Push an element into the stack (on top) O(1)
stack.push(1)
stack.push(2)
stack.push(3)

// Pop an element from the stack O(1)
const pop = stack.pop()

// (Access) Peek the top element O(1)
const top_element = stack[stack.length - 1]
```

## Implementations
### Using linked list
> Comparing to _array_'s implementation, this provides **more stable effienciency performance**.

_Head node_: top of the stack
_Tail node_: bottom of the stack

**push() "head insertion"**: insert elements at the head of linked list.
**pop()**: remove the head node from the list.

### Using array
> Comparing to _linked list_'s implemtation, the **average effienciency is higher**.

_End of array_: top of the stack

**push() & pop()**: both add & remove at the end of array, with `O(1)`.

> Use _dynamic array_ to avoid handle array expansion, because pushing elements into array may _continuously increase_, which occurs _resizing mechanism_, making push() `O(n)`.

