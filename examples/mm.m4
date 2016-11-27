# prevent multiple inclusions
ifdef(`TopLineLen',`',`include(`../orgchart.m4')')

.PS

SetTop(Disney,CEO,4)
Employee(Minnie,Mouse)
Employee(Mickey,Mouse)
Employee(Goofy,Dog)

# one tier down, 2 inch long horizontal line and 3 boxes underneath
Manager(Daffy,Head Duck,`NullCall')
BuildTierLine(Daffy,1,2,3)
Employee(Huey,Nephew)
Employee(Duey,Nephew)
Employee(Louie,Nephew)

.PE

