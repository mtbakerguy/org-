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
Employee($1,$2)
ifelse($# == 5,1,Group($1,$3,$4))
')

define(Employee,`
DownLine
Box($1,$2)
move right (lasttierlen/(boxcnt - 1))
move up (DownLineHt + BoxHt)
right
')

define(Directs,`Employee($1,$2)')

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
boxcnt = $3
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
TierLine($3,$2,$4)
')

divert(0)

.PS
SetTop
Box(Knotwell,Perf & Virt) at center of last box
TierLine(TopLineLen,0,8)
Manager(Wright,Cloud)
Employee(Thornewell,Sr Architect)
Employee(Pruitt,Architect)
Manager(Pope,Virt Sys)
Manager(Goziker,Sr Mgr,Control Plane,11 FTE)
Manager(Karagianes,Sr Mgr,Web UI,11 FTE)
Manager(Pak,Test Mgr,VE Test,9 FTE)
Manager(McCardle,TMM)

BuildTierLine(Pope,1,2,2)
Directs(VE/vCMP Dev,7 FTE)
Manager(Lahti,Test Mgr,VE/vCMP/CP Test,7 FTE)

BuildTierLine(Wright,1,3.5,3)
Manager(Blood,Sr Mgr,Cloud Dev,5 FTE)
Manager(Moshiri,Mgr,Cloud Sol 9 FTE)
Manager(Comer,Sr Mgr,Tech Pubs, 8 FTE)

BuildTierLine(McCardle,1,2,2)
Directs(TMM Dev,10 FTE)
Manager(Lato,Test Mgr,TMM Dev/Test,4 FTE)

.PE
