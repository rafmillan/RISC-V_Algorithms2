# Functions in RISC-V assembly, simulate wth RARS. 
[RARS on Github](https://github.com/TheThirdOne/rars)

**ATOI (String to int):**
- Convert ASCII string containing a positive or negative null terminated  decimal string to an integer.
- string expected in x10.
- optional '+' or '-' to determine sign, if none, assume positive. 
- place integer in x10.

**Selection Sort:**
- Implemented with recursion. 
- x10 holds adress of array that needs to be sorted
- x11 holds size or array
- modify original array and return array in x10.

**Division:**
- divide 32bit unsigned integers, only using addition and other logicla isntructions. 
- dividend in x10
- divisor in x11
- return quotient in x10
- return remainder in x11

**FindMaxXOR:**
- given array of 32bit unsigned inegers of size N.
- find maximum possible XXOR between any two elents of arary.
- expect array in x10
- size of array in x11
- return max XOR in x10


