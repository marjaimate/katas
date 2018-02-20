5. Dependencies
=======

Let’s write some code that calculates how dependencies propagate between things such as classes in a program.

Highly coupled code is code where the dependencies between things are dense, lots of things depend on other things. This kind of program is hard to understand, tough to maintain, and tends to be fragile, breaking easily when things change.

One of the insidious things about dependencies is that they are transitive—if A depends on B and B depends on C, then A also depends on C. So, let’s write some code that calculates the full set of dependencies for a group of items. The code takes as input a set of lines where the first token is the name of an item. The remaining tokens are the names of things that this first item depends on. Given the following input, we know that A directly depends on B and C, B depends on C and E, and so on.

```
 A - B, C
 B - C, E
 C - G
 D - A, F
 E - F
 F - H
```

The program should use this data to calculate the full set of dependencies. For example, looking at B, we see it directly depends on C and E. C in turn relies on G, E relies on F, and F relies on H. This means that B ultimately relies on C, E, F, G, and H.

## Task

Write a program that carries out this dependency analysis
