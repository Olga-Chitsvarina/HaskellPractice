-----------------------------------------------------------------------

-- This function takes the list as a parameter and returns the sum of 
-- elements in the list
sumList :: [Int] -> Int
sumList list = foldr (+) 0 list


-- This function finds the minimum number in the list
minInList :: [Int] -> Int
minInList list  
        | length list < 1 = error "This list is empty"
        | otherwise = foldr min (head list) (tail list)


-- These functions computes the dot product of two lists, passed in as parameters
dotProduct :: [Int] -> [Int] -> Int
dotProduct listA listB = foldr (+) 0 (zipWith (*) listA listB)
 
dotProduct2 :: [Int] -> [Int] -> Int
dotProduct2 listA listB =  foldr1 (+) (map (uncurry (*)) zipped)
        where 
        zipped = zip listA listB
       
-- This function takes the list as a parameter.
-- It returns true if all elements in the list are equal
-- It returns false otherwise
areEqual :: [Int] -> Bool
areEqual [] = True
areEqual (x:xs) = foldl (&&) True (map (x==) xs)

-------------------------------------------------------------------

--This is a helper function for reverseList:
reverseHelper :: [Int] -> Int -> [Int]
reverseHelper [] a = [a]
reverseHelper list a = [a] ++ list

-- This function reverses the list:
reverseList :: [Int] -> [Int]
reverseList [] = []
reverseList list = foldl reverseHelper [] list 

----------------------------------------------------------------------
-- This function is the helper function for removeDuplicates
removeDuplicatesHelper :: [Int] -> Int -> [Int]
removeDuplicatesHelper [] a = [a]
removeDuplicatesHelper list a 
        | (myLast == a) = list
        | otherwise = list ++ [a]
        where 
        myLast = last list 

-- This function removes the duplicates from the list of values
removeDuplicates :: [Int] -> [Int]
removeDuplicates [] = []
removeDuplicates (a:[]) = [a]
removeDuplicates list = foldl removeDuplicatesHelper [] list
------------------------------------------------------------------------

-- This function takes the list (resulting list for onlyAscendingLeft)
-- It also takes an integer as a second parameter (from the input list to
-- onlyAscendingLeft).
-- If that integer is greater, than the last element in the list, 
-- add the element to the list, else keep it the same
leftHelper :: [Int] -> Int -> [Int]
leftHelper [] a = [a]
leftHelper list a
        | myLast < a = list ++ [a]
        | otherwise = list
        where myLast = last list


-- This function takes the list of integers and
-- removes the elements, which are not in the 
-- ascending order, using left fold.
onlyAscendingLeft :: [Int] -> [Int]
onlyAscendingLeft values = foldl leftHelper [] values

------------------------------------------------------------

-- This function takes the integer and a list
-- if integer is greater, than a head of the list,
-- make that integer a new head. Otherwise add that integer
-- to the left of the list
rightHelper :: Int -> [Int] -> [Int]
rightHelper a [] = [a]
rightHelper a list
        | a >= myHead = rightHelper a myTail
        | otherwise = [a] ++ [myHead] ++ myTail
        where 
        myHead = head list
        myTail = tail list



-- This function takes the list of integers and
-- removes the elements, which are not in the 
-- ascending order, using right fold.
onlyAscendingRight:: [Int] -> [Int]
onlyAscendingRight values = foldr rightHelper [] values

------------------------------------------------------------
