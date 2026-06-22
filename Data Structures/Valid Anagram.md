# Valid Anagram

An anagram is a word or phrase formed by rearranging the letters of another word or phrase, using all the original letters exactly once.

```python
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        counterS = {}
        counterT = {}
        
        if len(s) != len(t):
            return False
        for i in range(len(s)):
            counterS[s[i]] = 1 + counterS.get(s[i], 0)
            counterT[t[i]] = 1 + counterT.get(t[i], 0)
        for c in counterS:
            if counterS[c] != counterT.get(c, 0):
                return False
        return True
```

Time Complexity: $O(n)$
Space Complexity: $O(1)$

### Use Python's built-in `Counter` from `collections` module

The Python `**collections` module** ==provides specialized, high-performance container data types that serve as cleaner and more efficient alternatives to built-in containers== like `list`, `dict`, `set`, and `tuple`
[https://docs.python.org/3/library/collections.html](https://docs.python.org/3/library/collections.html)

```python
from collections import Counter

class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        # If lengths aren't equal, they can't be anagrams
        if len(s) != len(t):
            return False
            
        # Counter creates the frequency dicts automatically
        return Counter(s) == Counter(t)
```

Time Complexity: $O(n)$
Space Complexity: $O(1)$
This solution runs faster in practice

### Using Sorting

```python
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        return sorted(s) == sorted(t)

```

- **Time Complexity**: $O(n log n)$ using Timsort (Python's built-in sorting algorithm).
- **Space Complexity**: **O(1)** auxiliary space if we modify the input in-place, or **O(N)** in Python because `sorted()` creates a new list of characters.

