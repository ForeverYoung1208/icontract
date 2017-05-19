module ApplicationHelper
  def fa_link_to(icon, *args, &block)

  	link_to(*args) do
  		concat content_tag("span", nil, class: "fa fa#{icon}")
  		concat ' '
  		concat capture &block
  	end
  end

  def mainmenu_li( p, *args, &block)

  	args[0][:class] += " active" if p[:current] == p[:menuitem]

		content_tag("li", *args) do
			capture &block
  	end
  end

  def mainmenu_tag( p, *args, &block)

  	args[0][:class] += " active" if p[:current] == p[:menuitem]

		content_tag("li", *args) do
			capture &block
  	end
  end


end
