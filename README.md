simple robot program

by Glenn Marks

robot takes command from the console and outputs position (when asked) to the console

When it was first written there was no meta programming (--send-- & metoh_missing). The advantage is that its simple to read and understand, the down side is that 2 objects need to be altered if another action is added.

With meta programming and using method_missing you only need to add new actions to one object
