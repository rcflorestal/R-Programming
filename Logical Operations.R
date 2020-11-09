#----------------------------LOGICAL OPERATIONS--------------------------------#
#
#There are two logical values in R, also called boolean values. They are TRUE 
# and FALSE.
#
# The first logical operator we are going to discuss is the equality operator, 
# represented by two equals signs `==`.
TRUE == TRUE

# Just like arithmetic, logical expressions can be grouped by parenthesis so
# that the entire expression (TRUE == TRUE) == TRUE evaluates to TRUE.
(TRUE == TRUE) == TRUE

# The equality operator can also be used to compare numbers.
6 == 7

# The less than operator `<` tests whether the number on the left side of the 
# operator is less than the number on the right side of the operator.
6 < 7

# There is also a less-than-or-equal-to operator `<=` which tests whether the 
# left operand is less than or equal to the right operand.
10 <= 10

# The next operator we will discuss is the 'not equals' operator represented by 
# "!="
5 != 7

# Other wawy
!(5 == 7)

# At some point you may need to examine relationships between multiple logical 
# expressions. This is where the AND operator and the OR operator come in.
#
# There are two AND operators in R, `&` and `&&`. Both operators work similarly,
# if the right and left operands of AND are both TRUE the entire expression is 
# TRUE, otherwise it is FALSE. For example, TRUE & TRUE evaluates to TRUE.
FALSE & FALSE

# You can use the `&` operator to evaluate AND across a vector.
# The `&&` version of AND only evaluates the first member of a vector.
TRUE & c(TRUE, FALSE, FALSE)

# What happens in this case above is that the left operand `TRUE` is recycled
# across every element in the vector of the right operand. This is the equivalent 
# statement as c(TRUE, TRUE, TRUE) & c(TRUE, FALSE, FALSE).

# Now we'll type the same expression except we'll use the `&&` operator
TRUE && c(TRUE, FALSE, FALSE)

# In this case above, the left operand is only evaluated with the first member 
# of the right operand (the vector). The rest of the elements in the vector
# aren't evaluated at all in this expression.

# The OR operator follows a similar set of rules. The `|` version of OR evaluates 
# OR across an entire vector, while the `||` version of OR only evaluates the 
# first member of a vector.
TRUE | c(TRUE, FALSE, FALSE)
TRUE || c(TRUE, FALSE, FALSE)

# The function isTRUE() takes one argument. If that argument evaluates to TRUE, 
# the function will return TRUE. Otherwise, the function will return FALSE.
isTRUE(6 > 4)

# You should also be aware of the xor() function, which takes two arguments. 
# The xor() function stands for exclusive OR. If one argument evaluates to TRUE 
# and one argument evaluates to FALSE, then this function will return TRUE, 
# otherwise it will return FALSE.
xor(5 == 6, !FALSE)     ## Evaluated as TRUE
xor(4 >= 9, 8 != 8.0)   ## Evaluated as FALSE

# For the next few questions, we're going to need to create a vector of integers called ints.
ints <- sample(10)

ints > 5

# We can use the resulting logical vector above to ask other questions about ints. 
# The which() function takes a logical vector as an argument and returns the 
# indices of the vector that are TRUE. 
# To find the indices of ints that are greater than 7:
which(ints > 7)

# Like the which() function, the functions any() and all() take logical vectors 
# as their argument. The any() function will return TRUE if one or more of the 
# elements in the logical vector is TRUE. The all() function will return TRUE if 
# every element in the logical vector is TRUE.
any(ints < 0)   ## Check out if all elements of ints are less than 0.
all(ints > 0)   ## Check out if all elements of ints are greater than 0.



