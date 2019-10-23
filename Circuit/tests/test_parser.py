import pytest

from circuit.elements import SubCircuit
from circuit.parser import SpiceParser

@pytest.fixture
def setup_basic():
    return 'X1 a b testdev x=1f y=0.1'

@pytest.fixture
def setup_multiline():
    return '''
    X1 a b  testdev x =1f y= 0.1
    X2 a  b testdev x = 1f
    '''

@pytest.fixture
def setup_realistic():
    return '''
R1 vcc outplus 1e4
R2 vcc outminus 1e4

M1 outplus inplus src 0 NMOS   l=0.014u nfin=2
M2 outminus inminus src 0 NMOS l=0.014u nfin=2

C1 outplus 0 1e-12
C2 outminus 0 1e-12
'''

@pytest.fixture
def parser():
    parser = SpiceParser()
    parser.library['testdev'] = SubCircuit('testdev', 'pin1', 'pin2', x='1f', y=0.1)
    return parser

def test_lexer_basic(setup_basic):
    types = ['NAME', 'NAME', 'NAME', 'NAME', 'NAME', 'EQUALS', 'NUM', 'NAME', 'EQUALS', 'NUM']
    assert len(list(SpiceParser._generate_tokens(setup_basic))) == len(types)
    assert all(tok.type == type_ for tok, type_ in zip(SpiceParser._generate_tokens(setup_basic), types))

def test_lexer_with_comments(setup_basic):
    str_ = '''
X1 a b testdev; COMMENT ABOUT M1 pins
; SOME MORE COMMENTS ABOUT PARAMETERS
+ x=1f y=0.1; AND A FW MORE FOR GOOD MEASURE
'''
    tokens = list(SpiceParser._generate_tokens(str_))
    assert tokens.pop().type == 'NEWL'
    assert all(tok1.type == tok2.type and tok1.value == tok2.value for tok1, tok2 in zip(tokens, SpiceParser._generate_tokens(setup_basic)))

def test_lexer_multiline(setup_multiline):
    str_ = setup_multiline
    types = ['NAME', 'NAME', 'NAME', 'NAME', 'NAME', 'EQUALS', 'NUM', 'NAME', 'EQUALS', 'NUM', 'NEWL',
             'NAME', 'NAME', 'NAME', 'NAME', 'NAME', 'EQUALS', 'NUM', 'NEWL']
    assert len(list(SpiceParser._generate_tokens(str_))) == len(types)
    assert all(tok.type == type_ for tok, type_ in zip(SpiceParser._generate_tokens(str_), types))

def test_parser_basic(setup_basic, parser):
    parser.parse(setup_basic)
    assert len(parser.circuit.elements) == 1
    assert parser.circuit.elements[0].name == 'X1'
    assert isinstance(parser.circuit.elements[0], parser.library['testdev'])
    assert parser.circuit.nets == ['a', 'b']

def test_parser_multiline(setup_multiline, parser):
    parser.parse(setup_multiline)
    assert len(parser.circuit.elements) == 2
    assert parser.circuit.elements[0].name == 'X1'
    assert parser.circuit.elements[1].name == 'X2'
    assert isinstance(parser.circuit.elements[0], parser.library['testdev'])
    assert isinstance(parser.circuit.elements[1], parser.library['testdev'])
    assert parser.circuit.nets == ['a', 'b']

def test_parser_realistic(setup_realistic, parser):
    parser.parse(setup_realistic)
    assert len(parser.circuit.elements) == 6
    assert [x.name for x in parser.circuit.elements] == ['R1', 'R2', 'M1', 'M2', 'C1', 'C2']
    assert len(parser.circuit.nets) == 7
    assert parser.circuit.nets == ['vcc', 'outplus', 'outminus', 'inplus', 'src', '0', 'inminus']

def test_subckt_decl(setup_realistic, parser):
    parser.parse(f'''
.subckt diffamp vcc outplus outminus inplus src 0 inminus
.param res = 100
{setup_realistic}
.ends
X1 vcc outplus outminus inplus src 0 inminus diffamp res=200
''')
    assert 'diffamp' in parser.library
    print([x.name for x in parser.library['diffamp'].circuit.elements])
    assert len(parser.library['diffamp'].circuit.elements) == 6
    assert len(parser.circuit.elements) == 1
    assert type(parser.circuit.elements[0]).__name__ == 'diffamp'

