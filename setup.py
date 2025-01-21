from setuptools import setup, Extension
from setuptools.command.build_ext import build_ext

ext_modules = [
    Extension(
        "mycpythonlib.core",
        ["src/haversine.cpp", "src/bindings.cpp"],
        include_dirs=["include"],
        language='c++',
        extra_compile_args=['-std=c++14']
    ),
]

setup(
    name='mycpythonlib',
    version='0.1.0',
    description='C++ library with Python bindings',
    author='Me',
    ext_modules=ext_modules,
    setup_requires=['pytest-runner', 'pybind11'],
    tests_require=['pytest'],
    packages=['mycpythonlib'],
    package_dir={'mycpythonlib': 'mycpythonlib'},
    include_package_data=True,
)