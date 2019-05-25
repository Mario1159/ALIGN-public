
from cell_fabric import RemoveDuplicates

def test_containedIn():
    rA = ([0,0,1,1],'A')
    rB = ([1,1,2,2],'B')
    assert RemoveDuplicates.containedIn(rA,rA)
    assert RemoveDuplicates.containedIn(rB,rB)
    assert not RemoveDuplicates.containedIn(rA,rB)
    assert not RemoveDuplicates.containedIn(rB,rA)

    rA = ([0,0,1,1],'A')
    rB = ([2,2,3,3],'B')
    assert RemoveDuplicates.containedIn(rA,rA)
    assert RemoveDuplicates.containedIn(rB,rB)
    assert not RemoveDuplicates.containedIn(rA,rB)
    assert not RemoveDuplicates.containedIn(rB,rA)

    rA = ([0,0,100,100],'A')
    rB = ([50,50,51,51],'B')
    assert RemoveDuplicates.containedIn(rA,rA)
    assert RemoveDuplicates.containedIn(rB,rB)
    assert not RemoveDuplicates.containedIn(rA,rB)
    assert RemoveDuplicates.containedIn(rB,rA)

    rA = ([0,0,100,100],'A')
    rB = ([99,50,101,51],'B')
    assert RemoveDuplicates.containedIn(rA,rA)
    assert RemoveDuplicates.containedIn(rB,rB)
    assert not RemoveDuplicates.containedIn(rA,rB)
    assert not RemoveDuplicates.containedIn(rB,rA)

    rA = ([0,0,100,100],'A')
    rB = ([101,50,102,51],'B')
    assert RemoveDuplicates.containedIn(rA,rA)
    assert RemoveDuplicates.containedIn(rB,rB)
    assert not RemoveDuplicates.containedIn(rA,rB)
    assert not RemoveDuplicates.containedIn(rB,rA)
