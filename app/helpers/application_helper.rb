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

  def mainmenu_item( p, *args, &block)
  	mainmenu_li(p, class: "nav-item") do
  		link_to( p[:menuitem], class: 'nav-link' ) do
  			capture &block
  		end
  	end
  end


  def mainmenu_dropdown( p, &block)
    paths = []
    p[:menuitems].each { |name, path| paths<<path }

    args = {class: "nav-item dropdown"}
    args[:class] += " active" if paths.include?( p[:current] )

    content_tag("li", args) do
      content_tag("a", {
        class: "nav-link dropdown-toggle",
        href: "",
        id: "navbarDropdownMenuLink1",
        'data-toggle': "dropdown",
        'aria-haspopup': "true",
        'aria-expanded': "false"
      }) { capture &block } +
      content_tag("div", { class: "dropdown-menu", 'aria-labelledby': "navbarDropdownMenuLink1" }) do 
        p[:menuitems].collect do |name, path|
          concat( link_to( path, class: 'dropdown-item' ){ name } )
        end
      end

    end

  end

          # <li class="nav-item dropdown">
          #   <a class="nav-link dropdown-toggle" href="" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          #     Налаштування
          #   </a>
          #   <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          #     <%= link_to 'Компанії', companies_path, {class: 'dropdown-item'} %>
          #     <%= link_to 'Типи договорів', types_path, {class: 'dropdown-item'} %>
          #     <%= link_to 'Типи подій-нагадувань', reminder_types_path, {class: 'dropdown-item'} %>
          #   </div>
          # </li>



end
