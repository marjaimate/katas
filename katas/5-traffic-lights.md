# 6. Traffic Lights

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
* A - RED;   B - RED
* A - GREEN; B - RED
* A - RED;   B - RED


## Task

To start, let's create a new OTP app using `mix new traffic --app traffic --sup`

1. Write a generic manager for these light states
 - Use an Agent, or a GenServer, and implement a queue system for A and B lights
 - Implement the traffic lights sequence above
   - Expose a method to switch in sequence
2. Add some traffic to manage! What if we send cars to these lights, will they wait? how many can you let through when they are GREEN?
  - Implement a Car process type
    - A Car will start, and wait for a message back from the lights (kind of like when you're waiting at the lights, and watching them to see when they turn green!)
    - While waiting, it can display messages of boredome / anger?
    - If it sees a green light, it will pass, and go (i.e. process is finished)
3. Process those queues!
  - Now we have lights, a sequence and some cars. Time to get them moving!
4. Now tie it into our OTP app, use the supervision tree

### Extra tasks, if you're far ahead

- Add scheduling: A and B working off different clocks - A stays green for 60 seconds, B stays green for 40 seconds.
  - Plus internet points to implement the AMBER state into the sequence
  - The Amber state for both takes 5 seconds.
- Add a queue monitoring, if A queue is larger by i.e. a factor of 2, then switch sequence, etc.
- Add supervisors to this, where we can
- Change the gen\_server and allow us to create more than one traffic lights.
