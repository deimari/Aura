#pragma once

#include "Aura/Layer.h"

#include "Aura/Events/KeyEvent.h"
#include "Aura/Events/ApplicationEvent.h"
#include "Aura/Events/MouseEvent.h"

namespace Aura {

	class AURA_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		virtual void OnAttach() override;
		virtual void OnDetach() override;
		virtual void OnImGuiRender() override;

		void Begin();
		void End();
	private:						 
		float m_Time = 0.0f;
	};
}