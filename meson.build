project('mypythonlib', 'cpp',
  version : '0.1.0',
  default_options : ['cpp_std=c++14']
)

py_mod = import('python')
py3 = py_mod.find_installation()
py3_dep = py3.dependency()

pybind11_dep = dependency('pybind11')

src = [
  'src/haversine.cpp',
  'src/bindings.cpp'
]

py3.extension_module('core',
  src,
  dependencies : [py3_dep, pybind11_dep],
  install : true,
  install_dir : py3.get_install_dir() / 'mypythonlib'
)

install_subdir('python/mypythonlib',
  install_dir: py3.get_install_dir()
) 