# 1. Two Sum (Easy)

### Notes
We use a HashMap to achieve $O(N)$ runtime performance.

### Implementation
```java
// Click the small "Run" button that appears above this block in VS Code!
import java.util.*;

public class Solution {
    public static void main(String[] args) {
        int[] nums = {2, 7, 11, 15};
        int target = 9;
        System.out.println("Result: " + Arrays.toString(twoSum(nums, target)));
    }

    public static int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int comp = target - nums[i];
            if (map.containsKey(comp)) return new int[]{map.get(comp), i};
            map.put(nums[i], i);
        }
        return new int[]{};
    }
}
```

* **Why this is awesome**: Since your `Java: Ready` extension is already perfectly configured (as proven by your `Tes.java` file), VS Code will automatically place a small **Run / Debug** button directly above the code block inside your Markdown file. You can take rich markdown notes, run your Java script instantly, and upload it straight to GitHub!

---

Which option sounds better to get you straight into solving coding problems? If you run the **Option 1** user command, let me know if it clears the setup block immediately!
