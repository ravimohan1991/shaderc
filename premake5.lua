-- premake5.lua
project "shaderc"
	kind "StaticLib"
	language "C++"
	staticruntime "on"

	targetdir ("build/" .. outputdir .. "/%{prj.name}")
	objdir ("obj/" .. outputdir .. "/%{prj.name}")

	files
	{
		"libshaderc/include/shaderc/shaderc.h",
		"libshaderc/include/shaderc/shaderc.hpp",
		"libshaderc/src/shaderc.cc",
		"libshaderc/src/shaderc_private.h"
	}


	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		-- https://github.com/premake/premake-core/wiki/pic
		pic "On"
		buildoptions "-std=c++11"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"