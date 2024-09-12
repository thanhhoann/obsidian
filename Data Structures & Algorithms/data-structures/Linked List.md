> Memory allocated for an array must be _continuous_. However, for **very large arrays**, finding a sufficiently large continuous memory space becomes challenging. This is where _linked list_ becomes useful.

Although linked list is more useful on **adding & removing** elements, it consumes more memory per element.

A linked list is a **linear** data structure in which _each element is a node object_, each node are _interconnected through **references**_.

References hold the _memory addresses_ of subsequent nodes for navigation from one node to the next. 

Each node has a **value** and a **reference (pointer)** to the next node.
**Head node** is usually refered by the whole list.
**Tail node** points to `null`.

```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
includeLinks: true # Make headings clickable
debugInConsole: false # Print debug info in Obsidian console
```

## Operations
### Initialize

```js
const node_0 = new ListNode(1)
const node_1 = new ListNode(1)
const node_2 = new ListNode(2)
const node_3 = new ListNode(3)

node_0.next = node_1
node_1.next = node_2
node_3.next = node_4
```

### Insert a node O(1)
Place the new node in the middle by _change refs_ of 2 nearest nodes.

```js
const node_new = new ListNode(4)
node_0.next = node_new
node_new.next = node_1
```

### Delete a node O(1)
Point the former node to latter node to ignore the deleting node, _although the deleted node is still pointing to latter node_.

```js
node_0.next = node_2 // delete node_1
```

### Access a node O(n)
To access a node in a linked list, we have to traverse from head node until the desired node is found.

## Types of linked list
### Singly linked list
The standard linked list. Each node includes **a value & a ref to next node**. The first node is head node, last node is tail, points to null.

### Circular linked list
The tail node **points back** to the head node, create a loop. _Any node is a head node_.

### Doubly linked list
In contrast to _singly linked list_, **a ref can points in 2 directions**. Each node contains references to previous & next nodes, offers _more flexibility_ but _more memory space_.

## Applications
### Singly linked list
- **Stacks & Queues**: If _insertion and deletion occur at the same end_, it's a stack. If _insertion are at one end & deletion at the other_, it's a queue.
- **Hash tables**: Linked list are used in _chaining_, usually for _resolving hash collisions_. All collided elements are grouped into a linked list.
- **Graphs**: Adjacency list, a standard method for graph representation, _associate each graph vertext with a linked list_.

### Doubly linked list
- **Advanced data structures**: Red-black trees & B-trees for accessing a node's parent.
- **Browser history**
- **LRU algorithm**

### Circular linked list
- **Round-robin scheduling algorithm**: Cycling through each process, assigned a time slice, and upon expiration, rotates to the next processes.
- **Data buffers**: audio, video players