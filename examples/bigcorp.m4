# prevent multiple inclusions
ifdef(`TopLineLen',`',`include(`../orgchart.m4')')

.PS

SetTop(Walt,CEO,5)
Employee(Minnie,Mouse)
Manager(Daffy,Head Duck,`NullCall')
Employee(Mickey,Mouse)
Employee(Goofy,Dog)
define(MgrLabel,`SnowWhite')
Manager(Snow White,Dwarf Queen,`NullCall')
undefine(MgrLabel)

# one tier down, 2 inch long horizontal line and 3 boxes underneath
BuildTier(Daffy,1,2,3)
Employee(Huey,Nephew)
Employee(Duey,Nephew)
Employee(Louie,Nephew)

# one tier down, 4 inch long horizontal line and 7 boxes underneath
BuildTier(SnowWhite,1,4,7)
Employee(Doc)
StaggerEmployee(Dopey)
Employee(Bashful)
StaggerEmployee(Grumpy)
Employee(Sneezy)
StaggerEmployee(Sleepy)
Employee(Happy)

.PE

