workspace "Aura"
	architecture "x64"
	startproject "Sandbox"

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
IncludeDir["glm"] = "Aura/vendor/glm"

include "Aura/vendor/GLFW"
include "Aura/vendor/Glad"
include "Aura/vendor/imgui"


project "Aura"
	location "Aura"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "aupch.h"
	pchsource "Aura/src/aupch.cpp"

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
	}

	links
	{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"AU_PLATFORM_WINDOWS",
			"AU_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}
	
	filter "configurations:Debug"
		defines "AU_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "AU_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "AU_DIST"
		runtime "Release"
		optimize "on"

------------------------------------------------------------------------------------------------------------------

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

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
		"Aura/src",
		"Aura/vendor",
		"%{IncludeDir.glm}"
	}

	links
	{
		"Aura"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"AU_PLATFORM_WINDOWS"
		}
	
	filter "configurations:Debug"
		defines "AU_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "AU_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "AU_DIST"
		runtime "Release"
		optimize "on"