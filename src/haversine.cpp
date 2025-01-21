#define _USE_MATH_DEFINES
#include "mycpythonlib/haversine.hpp"
#include <cmath>

namespace mycpythonlib {
    double haversine(double lon1, double lat1, double lon2, double lat2) {
        // Konwersja na radiany
        lon1 = lon1 * M_PI / 180.0;
        lat1 = lat1 * M_PI / 180.0;
        lon2 = lon2 * M_PI / 180.0;
        lat2 = lat2 * M_PI / 180.0;

        // Wzór haversine
        double dlon = lon2 - lon1;
        double dlat = lat2 - lat1;
        double a = std::pow(std::sin(dlat/2), 2) + 
                   std::cos(lat1) * std::cos(lat2) * 
                   std::pow(std::sin(dlon/2), 2);
        double c = 2 * std::asin(std::sqrt(a));
        
        return c * EARTH_RADIUS;
    }
}