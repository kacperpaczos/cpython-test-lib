from setuptools import setup, Extension
from setuptools.command.build_ext import build_ext

ext_modules = [
    Extension(
        "mypythonlib.core",
        ["src/haversine.cpp"],
        include_dirs=["src"],
        language='c++'
    ),
]

setup(
    name='mycpythonlib',
    version='0.1.0',
    description='C++ library with Python bindings',
    author='Me',
    ext_modules=ext_modules,
    setup_requires=['pytest-runner'],
    tests_require=['pytest'],
)