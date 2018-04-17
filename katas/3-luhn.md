# 3. Luhn-check

The formula verifies a number against its included check digit, which is usually appended to a partial account number to generate the full account number. This number must pass the following test:

* From the rightmost digit, which is the check digit, and moving left, double the value of every second digit. The check digit is not doubled, the first digit doubled is immediately to the left of the check digit. If the result of this doubling operation is greater than 9 (e.g., 8 × 2 = 16), then add the digits of the product (e.g., 16: 1 + 6 = 7, 18: 1 + 8 = 9) or, alternatively, the same result can be found by subtracting 9 from the product (e.g., 16: 16 − 9 = 7, 18: 18 − 9 = 9).
* Take the sum of all the digits.
* If the total modulo 10 is equal to 0 (if the total ends in zero) then the number is valid according to the Luhn formula; else it is not valid.

Assume an example of an account number "7992739871" that will have a check digit added, making it of the form 7992739871x:

1. Account number  7 9 9 2 7 3 9 8 7 1 x
2. Double every other  7 18  9 4 7 6 9 16  7 2 x
3. Sum digits  7 9 9 4 7 6 9 7 7 2 x
4. The sum of all the digits in the third row is 67+x.

This check is used on credit and debit cards (i.e. all your card numbers will pass the Luhn check)

## Task

Write a program that validates any card number

### Extra mile

Write a credit card number generator!
