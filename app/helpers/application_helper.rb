module ApplicationHelper
  def fa_link_to(icon, *args, &block)

  	link_to(*args) do
  		concat content_tag("span", nil, class: "fa fa#{icon}")
  		concat ' '
  		concat capture &block
  	end
  end

  def mainmenu_li( p, *args, &block)
    p[:synonyms]||=[]
  	args[0][:class] += " active" if ( p[:current].match( p[:menuitem] ) or p[:synonyms].include?( p[:current] ) )
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

  def list_change_buttons(all_fn, mine_fn, is_all_checked)

      content_tag("input", {
        type: "radio",
        name: "listType",
        id: "radio-contracts-all",
        onchange: all_fn,
        checked: is_all_checked
      }) {' всі що мені доступні'} +
      tag.br + 
      content_tag("input", {
        type: "radio",
        name: "listType",
        id: "radio-contracts-mine" ,
        onchange: mine_fn,
        checked: !is_all_checked
      }) {' тільки мої'}
      
  end


  def management_details( entity )
    fa_link_to('-id-card fa-2x', entity, data: { toggle: "tooltip", placement: "bottom" }, title: "Деталі") {''}
  end

  def management_edit( entity )
    fa_link_to('-edit fa-2x', polymorphic_path(entity, {action: :edit}), data: { toggle: "tooltip", placement: "bottom" }, title: "Редагувати" ) {''}
  end

  def management_delete( entity )
    fa_link_to('-remove fa-2x', entity , method: :delete, data: { confirm: 'Видалити запис?', toggle: "tooltip", placement: "bottom" }, title: "Видалити" ) {''}
  end

  # data-toggle="tooltip" data-placement="bottom" title="Tooltip on bottom"

  def management_links( entity )
    management_details(entity) + 
    management_edit(entity) + 
    management_delete(entity)
  end

end
