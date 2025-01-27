# Haskell Sort Function Bug
This repository demonstrates a potential pitfall when using Haskell's `sort` function with custom data types. The core issue lies in the stability of the mergesort algorithm and how it interacts with custom comparison functions.

## Bug Description
The provided `bug.hs` file shows a simple example of sorting a list of integers. However, if you replace the integers with a custom data type and define a comparison function that doesn't maintain the original order of equal elements, the sorting result might be unexpected. This arises from the stable nature of Haskell's mergesort implementation. While usually beneficial, this stability can lead to unforeseen consequences if not properly accounted for in custom comparison logic.

## Bug Solution
The `bugSolution.hs` demonstrates how to handle such scenarios by either modifying the comparison function to maintain stability or by adopting alternative sorting approaches if stability is not critical.