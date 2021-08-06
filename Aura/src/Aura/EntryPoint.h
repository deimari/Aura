#pragma once

#ifdef AU_PLATFORM_WINDOWS

extern Aura::Application* Aura::CreateApplication();

int main(int argc, char** argv)
{
	Aura::Log::Init();
	auto app = Aura::CreateApplication();
	app->Run();
	delete app;
}

#endif