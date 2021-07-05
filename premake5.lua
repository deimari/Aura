workspace "Aura"
	architecture "x64"

	configurations 
	{
		"Debug",
		"Release",
		"Dist"
	}

project "Aura"
	location "Aura"
	kind "SharedLib"
	language "C++"

	targetdir

	AU_PLATFORM_WINDOWS;AU_BUILD_DLL;