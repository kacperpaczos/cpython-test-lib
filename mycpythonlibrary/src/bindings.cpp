#include <pybind11/pybind11.h>
#include "haversine.hpp"

namespace py = pybind11;

PYBIND11_MODULE(core, m) {
    m.doc() = "Moduł C++ do obliczania odległości Haversine"; 
    
    m.def("haversine", &mypythonlib::haversine, 
          "Oblicza odległość między dwoma punktami na Ziemi",
          py::arg("lon1"), py::arg("lat1"), 
          py::arg("lon2"), py::arg("lat2"));
}