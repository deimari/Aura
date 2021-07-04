#pragma once

#ifdef AU_PLATFORM_WINDOWS
	#ifdef AU_BUILD_DLL
		#define AURA_API __declspec(dllexport)
	#else
		#define AURA_API __declspec(dllimport)
	#endif
#else
	#error Aura only supports Windows!
#endif