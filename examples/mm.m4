# prevent multiple inclusions
ifdef(`TopLineLen',`',`include(`../orgchart.m4')')

.PS

SetTop(Walt,CEO,5)
Employee(Minnie,Mouse)
Employee(Mickey,Mouse)
Employee(Goofy,Dog)
Manager(Daffy,Head Duck,`NullCall')
Manager(Dory,Flaky Fish,`NullCall')

# either a 0 in the 2nd arg or a 1 in the third triggers the behavior change

# one tier down, 2 inch long horizontal line and 3 boxes underneath
BuildTierLine(Daffy,1,2,3)
Employee(Huey,Nephew)
Employee(Duey,Nephew)
Employee(Louie,Nephew)


BuildTierLine(Dory,1,1,`Employee(Nemo,Lost Fish)')

.PE

