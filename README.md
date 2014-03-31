# MATLAB Spring 2014 – Research Plan (Template)
(text between brackets to be removed)

> * Group Name: (Mensa)
> * Group participants names: (Bissig Raphael, Hottinger Daniel)
> * Project Title: Simulating behavoir in the Mensa at HCI, ETH Hoenggerberg using CA and agent based approaches

## General Introduction

Wherever people are the demnand of food is crucial. Especially at a big university like the ETH. There are several different offers at different places to feed the immense amount of hungry students and academical staff. In Spring semester 2014 at the chemistry biuliding HCI, ETH Hoenggerberg the Restaurant reopened it's doors, which was rebuilt  in order to optimize the troughput and space for the masses of people. Here the before and after situation of the Mensa are simulated and analyzed to judge the renovation's improvement

## The Model
During the two hours of food service a dynamic flow of people enter the Mensa. This flow depends on the end of the different student's classes as well as the breaktime of the academical staff. It can be simulated whith different density peaks representing the end of a class. Additional a group dynamic must be implemented because normally people don't eat alone in such a setting.
The Mensa is differatiated in three different parts:
- 1. obtaining food and pay for it
- 2. search a place to sit and eat
- 3. return the dishes and leave
 1. In this part line formation apears. People line in according to their chosen menu which is considered as a long-range interaction. After receiving the food the interaction immediately changes to the requirement to pay for the food an walk to the chash box. Due to the high flow of the people line formation is observed again. The specific architecture of the food stations and cash boxes play an important role in this part.
 2. After passing through part 1 the search of a place to sit is obvious. When a group formation before entering the Mensa is assumed the needs for the place to sit is bound to several of the group's parameters e.g. amount of people. Then people eat the food which takes time. This will be simulated by an averaged eating time with some deviations.
 3. After eating the dishes have to be returned and the Mensa is left using the nearest exit. 

## Fundamental Questions
How does the flow of the people look like?
What is the average time to pass through part 1? Are there big differences depending on time?
How does the group formation influence the choice or the seats? Are there gaps?
What role has the Mensa's architecture? 
How did the throughput improve since the renovation? Are there weak points of the new design?



## Expected Results

A clear improvent of the thoughput is expected due to more food stations more cash boxes and more place to sit. However a clear weak point will be in the last part by returning the dishes. This is shown by the empirical observed line formation at the station where the dishes should be returned. 


## References 

CA Approach to Collective Phenomena in Pedestrian Dynamics matched to the architecture of the Mensa


## Research Methods

Cellular Automata, Agent-Based Model, Continuous Modeling

## Other

The Mensa is asked to provide us data sets so set up important and fixed parameters.

hfldshfakjdsaöhgdaöksdhg
