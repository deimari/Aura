workspace "Aura"
	architecture "x64"

	configurations 
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Aura"
	location "Aura"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"AU_PLATFORM_WINDOWS",
			"AU_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
	
	filter "configurations:Debug"
		defines "AU_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "AU_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "AU_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Aura/vendor/spdlog/include",
		"Aura/src"
	}

	links
	{
		"Aura"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"AU_PLATFORM_WINDOWS"
		}
	
	filter "configurations:Debug"
		defines "AU_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "AU_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "AU_DIST"
		optimize "On"