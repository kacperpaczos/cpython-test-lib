#include <pybind11/pybind11.h>
#include "mycpythonlib/haversine.hpp"

namespace py = pybind11;

PYBIND11_MODULE(core, m) {
    using namespace mycpythonlib;
    m.doc() = "Moduł Python zawierający funkcję haversine";
    m.def("haversine", &haversine, 
          "Oblicza odległość między dwoma punktami na Ziemi",
          py::arg("lon1"), py::arg("lat1"), 
          py::arg("lon2"), py::arg("lat2"));
}