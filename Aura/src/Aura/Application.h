#pragma once

#include "Core.h"

#include "Window.h"
#include "Aura/LayerStack.h"
#include "Aura/Events/Event.h"
#include "Aura/Events/ApplicationEvent.h"

namespace Aura {

	class AURA_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

		void PushLayer(Layer* layer);
		void PushOverlay(Layer* overlay);
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
		LayerStack m_LayerStack;
	};

	// To be defined in Client
	Application* CreateApplication();
}