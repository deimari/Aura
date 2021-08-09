#include "aupch.h"
#include "Platform/OpenGL/OpenGLContext.h"

#include <GLFW/glfw3.h>
#include <glad/glad.h>

namespace Aura {

	OpenGLContext::OpenGLContext(GLFWwindow* windowHandle)
		: m_WindowHandle(windowHandle) 
	{
		AU_CORE_ASSERT(windowHandle, "Window handle is null!");
	}

	void OpenGLContext::Init()
	{
		glfwMakeContextCurrent(m_WindowHandle);
		int status = gladLoadGLLoader((GLADloadproc)glfwGetProcAddress);
		AU_CORE_ASSERT(status, "Failed to initialize Glad!");

		AU_CORE_INFO("OpenGL Info:");
		AU_CORE_INFO("  Vendor: {0}", glGetString(GL_VENDOR));
		AU_CORE_INFO("  Renderer: {0}", glGetString(GL_RENDERER));
		AU_CORE_INFO("  Version: {0}", glGetString(GL_VERSION));
	}

	void OpenGLContext::SwapBuffers()
	{
		glfwSwapBuffers(m_WindowHandle);
	}

}