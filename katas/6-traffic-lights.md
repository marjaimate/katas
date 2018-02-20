6. Traffic Lights
========

We are all familiar with traffic lights? At least I assume everyone seen one of those before. And in that case, you should be familiar with how traffic intersections work, right? Let's take a look at the following intersection:

```
    |   |
    |   |
----+   +----

0 >
----+   +----
  A |  ^|B
    |  0|
```

In this intersection we have 2 lights, and 2 one-way streets.

* `Light A` governs the traffic going from left to right
* `Light B` governs the traffic going from bottom to top

Light sequence is the following:

* A - RED;   B - RED
* A - RED;   B - GREEN
* A - RED;   B - AMBER
* A - RED;   B - RED
* A - GREEN; B - RED
* A - AMBER; B - RED
* A - RED;   B - RED

A and B working off different clocks - A stays green for 60 seconds, B stays green for 40 seconds.
The Amber state for both takes 5 seconds.

## Task

1. Write a generic manager for these light states
2. Add some traffic to manage! What if we send cars to these lights, will they wait? how many can you let through when they are GREEN?
