#pragma once
#include <cmath>

namespace mycpythonlib {
    constexpr double EARTH_RADIUS = 6371.0;  // Promień Ziemi w kilometrach
    double haversine(double lon1, double lat1, double lon2, double lat2);
}