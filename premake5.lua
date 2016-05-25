include 'premake'

make_solution 'test'

-------------------------------
configuration 'windows'
	defines {
		'NOGDI',
		'CROW_MSVC_WORKAROUND'
	}
configuration '*'
-------------------------------

boost = assert(dofile 'premake/recipes/boost.lua')
boost:set_defines()
boost:set_includedirs()
boost:set_libdirs()

includedirs {
	'deps/crow/include',
	'deps/crow/amalgamate',
}

--------------------------------------------------------------------
make_console_app('example_with_all', { 'src/example_with_all.cpp' })
use_standard('c++11')

configuration 'not windows'
	links {
		'boost_system',
		'boost_date_time',
		'boost_regex',
		'pthread'
	}
configuration '*'

---------------------------------------------
if os.get() == 'windows' then
make_console_app('client', { 'src/client.cs' })
language 'C#'
links {
	'System'
}
end