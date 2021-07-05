#pragma once

#ifdef AU_PLATFORM_WINDOWS

extern Aura::Application* Aura::CreateApplication();

int main(int argc, char** argv)
{
	Aura::Log::Init();
	AU_CORE_WARN("Initialized Log!");
	int a = 10;
	AU_INFO("Hello! Var = {0}", a);

	auto app = Aura::CreateApplication();
	app->Run();
	delete app;
}

#endif