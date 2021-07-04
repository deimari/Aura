#include <Aura.h>

class Sandbox : public Aura::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Aura::Application* Aura::CreateApplication()
{
	return new Sandbox();
}