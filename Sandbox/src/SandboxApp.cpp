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
		// AU_INFO("ExampleLayer::Update");

		if (Aura::Input::IsKeyPressed(AU_KEY_TAB))
			AU_INFO("Tab key is pressed");
	}

	void OnEvent(Aura::Event& event) override
	{
		if (event.GetEventType() == Aura::EventType::KeyPressed)
		{
			Aura::KeyPressedEvent& e = (Aura::KeyPressedEvent&)event;
			AU_TRACE("{0}", (char)e.GetKeyCode());
		}
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