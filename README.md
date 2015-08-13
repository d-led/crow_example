# crow example #

[crow](https://github.com/ipkn/crow) is a C++11 micro web framework, which I wanted to try out for some time on windows.

[![Build Status](https://travis-ci.org/d-led/crow_example.svg)](https://travis-ci.org/d-led/crow_example)

Until [recently](https://github.com/ipkn/crow/commit/686e5e220b782ef47b5c59271a946bd9603de1d1) it didn't build with VC++. This is a working build for crow for VS2015. The solution is generated using [premake5](https://github.com/premake/premake-core/wiki) with some [customized directory patterns](https://github.com/d-led/premake-meta-cpp).
