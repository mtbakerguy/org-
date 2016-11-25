divert(-1)

#editables
define(TopLineLen,`10')
define(DownLineHt,`0.4')
define(BoxWid,`1.2')
define(BoxHt,`0.4')

# hacky way to center the initial box
define(SetTop,`box invisible wid maxpswid; down')

define(DownLine,`
prevlineht = lineht
lineht = DownLineHt 
down
line $1
lineht = prevlineht
')

define(Box,`
box invisible wid BoxWid ht BoxHt "$1" "$2" dnl
')

define(Manager,`
$1:
Employee($1,$2,$3)
')

define(Employee,`
DownLine
Box($1,$2)
move right (lasttierlen/eval($3 - 1))
move up (DownLineHt + BoxHt)
right
')

define(GroupDone,`
move up (DownLineHt + BoxHt)
')

define(GroupNotDone,`')

define(Group,`
move to $1.s
move down (DownLineHt + BoxHt)
DownLine
Box($2,$3)
')

define(DownLineExtend,`
ifelse(eval($1 <= 0),1,`DownLine',`DownLine DownLine DownLineExtend(decr($1)) dnl')
')
	
define(TierLine,`
DownLineExtend($2)
prevlinewid = linewid
linewid = $1
lasttierlen = $1
move right ($1 / 2) from last line .s
left
line
linewid = prevlinewid
down
')

define(BuildTierLine,`
move to $1.s
move down BoxHt + DownLineHt;
$1Line:
TierLine($3,$2)
')

divert(0)

.PS
SetTop
Box(Knotwell,Perf & Virt) at center of last box
TierLine(TopLineLen,0)
Manager(Wright,Cloud, 8)
Employee(Thornewell,Sr Architect, 8)
Employee(Pruitt,Architect, 8)
Manager(Pope,Virt Sys, 8)
Manager(Goziker,Sr Mgr, 8)
Manager(Karagianes,Sr Mgr, 8)
Manager(Pak,Test Mgr, 8)
Manager(McCardle,TMM, 8)
Group(Karagianes,Web UI,11 FTE)
Group(Pak,VE Test,9 FTE)
Group(Goziker,Control Plane,11 FTE)

BuildTierLine(Pope,1,2)
Employee(VE/vCMP Dev,7 FTE,2)
Manager(Lahti,Test Mgr,2)
Group(Lahti,VE/vCMP/CP Test,7 FTE)

BuildTierLine(Wright,1,3.5)
Manager(Blood,Sr Mgr,3)
Manager(Moshiri,Mgr,3)
Manager(Comer,Sr Mgr,2)
Group(Blood,Cloud Dev,5 FTE)
Group(Moshiri,Cloud Sol,9 FTE)
Group(Comer,Tech Pubs,8 FTE)

BuildTierLine(McCardle,1,2)
Employee(TMM Dev,10 FTE,2)
Manager(Lato,Test Mgr,2)  # yes, this is a hack
Group(Lato,TMM Dev/Test,4 FTE) 

.PE
