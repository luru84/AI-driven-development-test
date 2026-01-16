import importlib


def test_main_callable():
    mod = importlib.import_module("yourpkg.__main__")
    assert hasattr(mod, "main")
