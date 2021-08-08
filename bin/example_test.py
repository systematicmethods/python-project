
def func1(x):
    return x + 1

def test_should_be_4():
    assert func1(3) == 4

def test_should_fail():
    assert func1(3) == 5
