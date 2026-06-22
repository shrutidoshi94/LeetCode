# Contains Duplicate

https://neetcode.io/problems/duplicate-integer/question?list=neetcode150

### 1. Hash Set Approach (Optimal)
```python
class Solution:
    def hasDuplicate(self, nums: List[int]) -> bool:
        hashset = set()

        for n in nums:
            if n in hashset:
                return True
            
            hashset.add(n)
```
Time Complexity: $O(n)$
Space Complexity: $O(n)$


### Sorting Approach (Space Optimized)

```python
class Solution:
    def containsDuplicate(self, nums: list[int]) -> bool:
        nums.sort()
        
        for i in range(len(nums) - 1):
            if nums[i] == nums[i + 1]:
                return True
                
        return False
```
Time Complexity: (O(N \log N)
Space Complexity: O(1) or O(N)
- **O(1)** auxiliary space if you sort the array in-place (e.g., using `.sort()` in Python, depending on the language's implementation details).
    - Python's Timsort can take up to O(N) space to store temporary data structures during the sort. 

