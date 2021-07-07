#include "aupch.h"
#include "Application.h"

#include "Aura/Events/ApplicationEvent.h"
#include "Aura/Log.h"

#include <GLFW/glfw3.h>

namespace Aura {
	Application::Application()
	{
		m_Window = std::unique_ptr<Window>(Window::Create());
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{
		while (m_Running)
		{
			glClearColor(1, 1, 0, 1);
			glClear(GL_COLOR_BUFFER_BIT);
			m_Window->OnUpdate();
		}
	}
}