include 'premake'

make_solution 'test'

defines {
	'NOGDI',
	'CROW_MSVC_WORKAROUND'
}

boost = assert(dofile 'premake/recipes/boost.lua')
boost:set_defines()
boost:set_includedirs()
boost:set_libdirs()

includedirs {
	'deps/crow/include',
	'deps/crow/amalgamate',
}

make_console_app('example_with_all', { 'src/example_with_all.cpp' })
use_standard('c++11')

-- links {
-- 	'boost_system',
-- 	'boost_date_time',
-- 	'boost_regex',
-- }
