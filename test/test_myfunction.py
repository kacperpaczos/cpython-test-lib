# uczulam na mypythonlibrary i mylib, patrz jak to jest w katalogu
from mypythonlibrary import mylib

def test_haversine():
    # Amsterdam to Berlin
    assert mylib.haversine(
        4.895168, 52.370216, 13.404954, 52.520008
    ) == 576.6625818456291