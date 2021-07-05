#pragma once

#include <memory>
#include "Core.h"
#include "spdlog/spdlog.h"

namespace Aura {
	
	class AURA_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core log macros
#define AU_CORE_TRACE(...)   ::Aura::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define AU_CORE_INFO(...)    ::Aura::Log::GetCoreLogger()->info(__VA_ARGS__)
#define AU_CORE_WARN(...)	 ::Aura::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define AU_CORE_ERROR(...)   ::Aura::Log::GetCoreLogger()->error(__VA_ARGS__)
#define AU_CORE_FATAL(...)   ::Aura::Log::GetCoreLogger()->critical(__VA_ARGS__)

// Client log macros
#define AU_TRACE(...)		 ::Aura::Log::GetClientLogger()->trace(__VA_ARGS__)
#define AU_INFO(...)		 ::Aura::Log::GetClientLogger()->info(__VA_ARGS__)
#define AU_WARN(...)		 ::Aura::Log::GetClientLogger()->warn(__VA_ARGS__)
#define AU_ERROR(...)		 ::Aura::Log::GetClientLogger()->error(__VA_ARGS__)
#define AU_FATAL(...)		 ::Aura::Log::GetClientLogger()->critical(__VA_ARGS__)