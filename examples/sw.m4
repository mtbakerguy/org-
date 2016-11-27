# prevent multiple inclusions
ifdef(`TopLineLen',`',`include(`../orgchart.m4')')

.PS
define(TopLineLen,`4')
SetTop(Snow White,Dwarf Queen,7)
Employee(Doc)
StaggerEmployee(Dopey)
Employee(Bashful)
StaggerEmployee(Grumpy)
Employee(Sneezy)
StaggerEmployee(Sleepy)
Employee(Happy)

.PE

