# Resource-extraction-in-the-Lotka-Volterra-model
Suppose that the equation for R′ has an additional term −E, representing the rate at which the resource is extracted from the system, probably by humans (hunted, fished, gathered, etc). Find the value at E at which the population R goes extinct at given time.

Section 1: Feed the parameters and initial conditions into the model of Lotka- V olterra.
First, we give certain values to parameters (a, b, c, and d) and initial conditions.

Section 2: Test the Given Case (T = 100)
This section, we test the case when T = 100. This test gives us some tips about the range of E. Specifically speaking, from this test, we might not obtain the rough range of E, but we can speculate that E is not too large and for T = 100, E might be near 6.4. With the ode45 solver, we found that E = 6.4 when T = 100.

Section 3: Case (T = 200): Narrow the range of possible E (Accuracy: 0.1)
Since this section, we are looking for the value of E when T is 200, which is the answer that the topic 2 asks for. We set the range [0, 5] as the current range of E. The solution of ode45 solver might not be quite accurate, so we would like to find step by step. Here we set the range of R as (16, 31.9) and the terminate period T as [189, 213] which can be observed from the data from our searching process. Then we save the data generated from our searching process. It includes E and its corresponding terminate period T and R. Finally, we obtain a range of E as [2.3,2.9].

Section 4: Narrow the range of possible E (Accuracy: 0.0001)
In this step, we continue to narrow the range of E within the accuracy 0.0001. Specifically, since R(200) might not be strictly 0, we would like to set a relatively positive range to bracket the R. Here, the range of R is (0, 1.31) and the period of T is [197, 197] which can be observed from the data generated in our searching process. Then we save the data generated from our searching process. It includes E and its corresponding terminate period T and R. Finally, we obtain a range of E as [2.4454, 2.4517].

Section 5: Finally Solve the problem for E
Here, we use the previous range of E [2.4454, 2.4517] to search for the possible E with ode45 solver. The terminate period T is less than or equal to 200 and the quantity of R is less than one but not negative since negative solution is meaningful. Then we can obtain a set of E as [2.4455, 2.4516] with accuracy of 0.0001. By the way, if we want to get a more accurate result, we can just increase the accuracy (the searching step-size), which is easy to implement. We can find that the quantity of R goes to 0 when T goes to 200
which satisfies the requirement of topic 2. And the exact value of E when T is 200 is found. The result is displayed, and the graphs are plot.
