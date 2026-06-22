# Python Built-in Data Structures: Complete Reference Guide

This comprehensive reference guide details all built-in methods for Python's four primary data structures: **Lists**, **Tuples**, **Dictionaries**, and **Sets**.

---

## 1. List (`[ ]`) — Ordered, mutable sequences that allow duplicate elements.


| **Method**                         | **What it does**                                                       | **Return Value**                        | **Time Complexity**              | **Space Complexity** |
| ---------------------------------- | ---------------------------------------------------------------------- | --------------------------------------- | -------------------------------- | -------------------- |
| `append(x)`                        | Adds `x` to the end of the list.                                       | `None`                                  | $O(1)$                           | $O(1)$               |
| `extend(iterable)`                 | Appends all items from an iterable to the list.                        | `None`                                  | $O(k)$                           | $O(1)$               |
| `insert(i, x)`                     | Inserts item `x` at a specific index `i`.                              | `None`                                  | $O(n)$                           | $O(1)$               |
| `pop([i])`                         | Removes and returns the item at index `i` (defaults to the last item). | The removed item                        | $O(1)$ for end, $O(n)$ for index | $O(1)$               |
| `remove(x)`                        | Removes the first occurrence of value `x`.                             | `None` (Raises `ValueError` if missing) | $O(n)$                           | $O(1)$               |
| `sort(*, key=None, reverse=False)` | Sorts the items of the list in place (using Timsort).                  | `None`                                  | $O(n \log n)$                    | $O(n)$               |
| `reverse()`                        | Reverses the elements of the list in place.                            | `None`                                  | $O(n)$                           | $O(1)$               |
| `clear()`                          | Removes all elements from the list, leaving it empty.                  | `None`                                  | $O(n)$                           | $O(1)$               |
| `count(x)`                         | Returns the number of times `x` appears in the list.                   | `int`                                   | $O(n)$                           | $O(1)$               |
| `index(x, [start, [end]])`         | Returns the zero-based index of the first occurrence of `x`.           | `int` (Raises `ValueError` if missing)  | $O(n)$                           | $O(1)$               |
| `copy()`                           | Returns a shallow copy of the list.                                    | A new `list` object                     | $O(n)$                           | $O(n)$               |


---

## 2. Tuple (`( )`) — Ordered, immutable sequences that allow duplicate elements.


| **Method**                 | **What it does**                                                 | **Return Value**                       | **Time Complexity** | **Space Complexity** |
| -------------------------- | ---------------------------------------------------------------- | -------------------------------------- | ------------------- | -------------------- |
| `count(x)`                 | Counts the number of times `x` appears in the tuple.             | `int`                                  | $O(n)$              | $O(1)$               |
| `index(x, [start, [end]])` | Finds the zero-based index of the first occurrence of value `x`. | `int` (Raises `ValueError` if missing) | $O(n)$              | $O(1)$               |


---

## 3. Dictionary (`{key: value}`) — Mutable mappings of unique, immutable keys to arbitrary values.


| **Method**                       | **What it does**                                                      | **Return Value**                                                  | **Time Complexity** | **Space Complexity** |
| -------------------------------- | --------------------------------------------------------------------- | ----------------------------------------------------------------- | ------------------- | -------------------- |
| `get(key, default=None)`         | Returns the value for `key` if it exists.                             | The value, or `default` if key is missing                         | $O(1)$              | $O(1)$               |
| `keys()`                         | Extracts all keys from the dictionary.                                | A dynamic view object (`dict_keys`)                               | $O(1)$              | $O(1)$               |
| `values()`                       | Extracts all values from the dictionary.                              | A dynamic view object (`dict_values`)                             | $O(1)$              | $O(1)$               |
| `items()`                        | Extracts all key-value pairs.                                         | A dynamic view object (`dict_items`)                              | $O(1)$              | $O(1)$               |
| `update(other)`                  | Updates the dictionary with key-value pairs from `other`.             | `None`                                                            | $O(k)$              | $O(1)$               |
| `pop(key[, default])`            | Removes the specified key and extracts its value.                     | The value of the key (or `default`; raises `KeyError` if missing) | $O(1)$              | $O(1)$               |
| `popitem()`                      | Removes and returns the last inserted `(key, value)` pair.            | `tuple` (Raises `KeyError` if empty)                              | $O(1)$              | $O(1)$               |
| `setdefault(key, default=None)`  | Returns the value of `key`. If missing, inserts `key` with `default`. | The value of the key                                              | $O(1)$              | $O(1)$               |
| `clear()`                        | Removes all items from the dictionary.                                | `None`                                                            | $O(n)$              | $O(1)$               |
| `copy()`                         | Returns a shallow copy of the dictionary.                             | A new `dict` object                                               | $O(n)$              | $O(n)$               |
| `fromkeys(iterable, value=None)` | Class method: creates a new dictionary from keys in iterable.         | A new `dict` object                                               | $O(k)$              | $O(k)$               |


---

## 4. Set (`{ }`) — Unordered collections of unique, hashable elements.


| **Method**                                   | **What it does**                                             | **Return Value**                                 | **Time Complexity** | **Space Complexity** |
| -------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------ | ------------------- | -------------------- |
| `add(x)`                                     | Adds element `x` to the set if it isn't already present.     | `None`                                           | $O(1)$              | $O(1)$               |
| `remove(x)`                                  | Removes element `x` from the set.                            | `None` (Raises `KeyError` if missing)            | $O(1)$              | $O(1)$               |
| `discard(x)`                                 | Removes element `x` from the set if it is present.           | `None` (Safe, no error if missing)               | $O(1)$              | $O(1)$               |
| `pop()`                                      | Removes and returns an arbitrary element from the set.       | The removed element (Raises `KeyError` if empty) | $O(1)$              | $O(1)$               |
| `union(*others)` or `|`                      | Finds all unique elements across all sets.                   | A new `set` object                               | $O(n + m)$          | $O(n + m)$           |
| `intersection(*others)` or `&`               | Finds elements common to all sets.                           | A new `set` object                               | $O(\min(n, m))$     | $O(\min(n, m))$      |
| `difference(*others)` or `-`                 | Finds elements in the main set but not in the others.        | A new `set` object                               | $O(n)$              | $O(n)$               |
| `symmetric_difference(other)` or `^`         | Finds elements in either set but not both.                   | A new `set` object                               | $O(n + m)$          | $O(n + m)$           |
| `intersection_update(*others)` or `&=`       | Mutates the set to keep only elements found in all sets.     | `None`                                           | $O(\min(n, m))$     | $O(1)$               |
| `difference_update(*others)` or `-=`         | Mutates the set to remove all elements found in others.      | `None`                                           | $O(n)$              | $O(1)$               |
| `symmetric_difference_update(other)` or `^=` | Mutates the set to keep elements in either set but not both. | `None`                                           | $O(n + m)$          | $O(1)$               |
| `isdisjoint(other)`                          | Checks if the set has no common elements with `other`.       | `bool`                                           | $O(\min(n, m))$     | $O(1)$               |
| `issubset(other)` or `<=`                    | Checks if every element of the set is in `other`.            | `bool`                                           | $O(n)$              | $O(1)$               |
| `issuperset(other)` or `>=`                  | Checks if every element of `other` is in the set.            | `bool`                                           | $O(m)$              | $O(1)$               |
| `clear()`                                    | Removes all elements from the set.                           | `None`                                           | $O(n)$              | $O(1)$               |
| `copy()`                                     | Returns a shallow copy of the set.                           | A new `set` object                               | $O(n)$              | $O(n)$               |


