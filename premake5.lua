workspace "Aura"
	architecture "x64"

	configurations 
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Aura/vendor/GLFW/include"
IncludeDir["Glad"] = "Aura/vendor/Glad/include"
IncludeDir["ImGui"] = "Aura/vendor/imgui"

include "Aura/vendor/GLFW"
include "Aura/vendor/Glad"
include "Aura/vendor/imgui"

project "Aura"
	location "Aura"
	kind "SharedLib"
	language "C++"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "aupch.h"
	pchsource "Aura/src/aupch.cpp"

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}"
	}

	links
	{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"

		defines
		{
			"AU_PLATFORM_WINDOWS",
			"AU_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
	
	filter "configurations:Debug"
		defines "AU_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "AU_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "AU_DIST"
		runtime "Release"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	staticruntime "off"


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
		systemversion "latest"

		defines
		{
			"AU_PLATFORM_WINDOWS"
		}
	
	filter "configurations:Debug"
		defines "AU_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "AU_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "AU_DIST"
		runtime "Release"
		optimize "On"