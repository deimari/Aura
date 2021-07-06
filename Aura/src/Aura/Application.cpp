#include "Application.h"

#include "Aura/Events/ApplicationEvent.h"
#include "Aura/Log.h"

namespace Aura {
	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
			AU_ERROR(e);
		else
			AU_FATAL(e);

		while (true);
	}
}