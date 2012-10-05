module ApplicationHelper
	def is_homepage?
		(controller.action_name =~ /index/ and controller.controller_name =~ /home/)
	end
end
