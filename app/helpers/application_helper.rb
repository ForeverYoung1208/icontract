module ApplicationHelper
  def fa_link_to(icon, *args, &block)
  	link_to(*args) do
  		concat content_tag("span", nil, class: "fa fa#{icon}")
  		concat ' '
  		concat capture &block
  	end
  end	
end
