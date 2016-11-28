divert(-1)

#Don't edit these -- just redefine in the calling code
define(TopLineLen,`10')
define(DownLineHt,`0.3')
define(BoxWid,`1.2')
define(BoxHt,`0.4')


# setup the initial box for the chart
define(SetTop,`
box invisible wid maxpswid
down
move to center of last box
Box($1,$2)
TierLine(TopLineLen,0,$3)
')

define(DownLine,`
prevlineht = lineht
lineht = DownLineHt 
down
line $1
lineht = prevlineht
')

# invisibility keeps the text and boxes from colliding
define(Box,`
box invisible wid BoxWid ht BoxHt "$1" "$2" dnl
')

# a way to defer the output of a macro until later
# useful for collating processing but inserting the results later
define(CollectGDiversion,`undivert(100)')

define(Stagger,`
DownLine
DownLine
$1($2,`$3',$4)
move up (2 * DownLineHt)
')

define(Lead,Manager)
define(StaggerLead,StaggerManager)

define(StaggerManager,`Stagger(`Manager',$1,$2,``$3'')')
define(StaggerEmployee,`Stagger(`Employee',$1,$2,$3)')

define(Manager,`
ifdef(`MgrLabel',MgrLabel:,$1:)
Employee($1,$2)
divert(100)
$3($1,$4,$5) 
divert
')

define(Employee,`
DownLine
Box($1,$2)
move right (lasttierlen/(boxcnt - 1))
move up (DownLineHt + BoxHt)
right
')

# used for managers of managers who also have direct reports
define(Directs,`Employee($1,$2)')

define(Group,`
move to $1.s
move down (DownLineHt + BoxHt)
DownLine
Box($2,$3)
')

define(DownLineExtend,`
ifelse(eval($1 <= 0),1,`DownLine',`DownLine DownLine DownLineExtend(decr($1)) dnl')
')

# $1 --> width of the line to draw
# $2 --> how far down you want the line to go (increments of DownLine)
# $3 --> number of employees to be inserted on the line (box spacing)
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

# used with the previous TierLine macro with an associate label
define(BuildTierLine,`
move to $1.s
move down BoxHt + DownLineHt
ifelse(eval($3 == 0 || $4 == 1),1,`$4',`TierLine($3,$2,$4)')
')


define(NullCall,`')
divert(0)
