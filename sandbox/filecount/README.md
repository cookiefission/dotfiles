# Filecount

Fiddling around with git status --porcelain to get change information into prompt

## Status Meaning

From Git site:

X      |   Y    |Meaning
-------|--------|--------------------------------
       |  [MD]  | not updated
M      | [ MD]  | updated in index
A      | [ MD]  |added to index
D      |  [ M]  |deleted from index
R      | [ MD]  |renamed in index
C      | [ MD]  |copied in index
[MARC] |        |index and work tree matches
[ MARC]|    M   |work tree changed since index
[ MARC]|    D   |deleted in work tree
D      |    D   |unmerged, both deleted
A      |    U   |unmerged, added by us
U      |    D   |unmerged, deleted by them
U      |    A   |unmerged, added by them
D      |    U   |unmerged, deleted by us
A      |    A   |unmerged, both added
U      |    U   |unmerged, both modified
?      |    ?   |untracked
!      |    !   |ignored

Intepretation:

 XY | Counts
----|-------
`_M`|_Unstaged
`_D`|_Unstaged
`MM`|_Unstaged,_Staged
`MD`|_Unstaged,_Staged
`A_`|_Staged


## Combination Mappings

Of 4 counts: `Changed`, `Staged`, `Untracked` and `Unmerged`
