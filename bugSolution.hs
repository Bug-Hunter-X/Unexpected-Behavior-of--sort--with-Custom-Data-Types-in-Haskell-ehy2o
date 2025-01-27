```haskell
data MyType = MyType { val :: Int, id :: Int }
    deriving (Show, Eq)

instance Ord MyType where
  compare (MyType v1 i1) (MyType v2 i2) = compare v1 v2  -- This doesn't guarantee stability

main :: IO ()
main = do
  let xs = [MyType 1 1, MyType 1 2, MyType 2 1]
  let ys = sort xs
  print ys -- Notice that the order of MyType 1 1 and MyType 1 2 might change because the compare function does not care about id

-- Solution: Using a different comparator that uses the id to stabilize the sort
instance Ord MyType where
    compare (MyType v1 i1) (MyType v2 i2) = case compare v1 v2 of
      EQ -> compare i1 i2
      x -> x

main' :: IO ()
main' = do
  let xs = [MyType 1 1, MyType 1 2, MyType 2 1]
  let ys = sort xs
  print ys -- Now the order of equal values in term of val is preserved according to the id
```