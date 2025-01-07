project('mycpythonlib', 'cpp',
  version : '0.1.0',
  default_options : ['cpp_std=c++14']
)

py_mod = import('python')
py3 = py_mod.find_installation('python3')
py3_dep = py3.dependency()

cpp = meson.get_compiler('cpp')

pybind11_dep = dependency('pybind11', 
                         method : 'cmake',
                         modules : ['pybind11::module'],
                         required : true)

inc = include_directories('include')

src_files = [
  'src/haversine.cpp',
  'src/bindings.cpp'
]

# Główna biblioteka
python_lib = shared_module('core',
  src_files,
  include_directories : inc,
  dependencies : [py3_dep, pybind11_dep],
  install : true,
  install_dir : py3.get_install_dir() / 'mycpythonlib',
  name_prefix : '',
  cpp_args : ['-fvisibility=hidden']
)

# Instalacja __init__.py
install_data('mycpythonlib/__init__.py',
  install_dir: py3.get_install_dir() / 'mycpythonlib'
)

# Konfiguracja testów
if get_option('build_tests')
  pytest = find_program('pytest', required : false)
  if pytest.found()
    test('python_tests',
      pytest,
      args : ['tests/'],
      workdir : meson.project_source_root(),
      env : {
        'PYTHONPATH': ':'.join([
          meson.current_build_dir(),
          py3.get_install_dir()
        ])
      }
    )
  endif
endif 