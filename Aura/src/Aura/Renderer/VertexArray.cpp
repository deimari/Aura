#include "aupch.h"
#include "VertexArray.h"

#include "Renderer.h"

#include "Platform/OpenGL/OpenGLVertexArray.h"

namespace Aura {

	VertexArray* VertexArray::Create()
	{
		switch (Renderer::GetAPI())
		{
			case RendererAPI::API::None:    AU_CORE_ASSERT(false, "RendererAPI::None is currently not supported!!"); return nullptr;
			case RendererAPI::API::OpenGL:  return new OpenGLVertexArray();
		}

		AU_CORE_ASSERT(false, "Unknown RendererAPI!!!");
		return nullptr;
	}
}