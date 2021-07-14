#include <Aura.h>

class ExampleLayer : public Aura::Layer
{
public:
	ExampleLayer()
		: Layer("Example") 
	{
	}

	void OnUpdate() override
	{
		AU_INFO("ExampleLayer::Update");
	}

	void OnEvent(Aura::Event& event) override
	{
		AU_TRACE("{0}", event);
	}
};

class Sandbox : public Aura::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new Aura::ImGuiLayer());
	}

	~Sandbox()
	{

	}
};

Aura::Application* Aura::CreateApplication()
{
	return new Sandbox();
}