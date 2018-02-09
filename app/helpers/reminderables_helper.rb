module ReminderablesHelper

	def files_fields(form, reminderable, html_class, filestype)
    tag.div class: html_class do
      if reminderable.send(filestype)
        reminderable.send(filestype).each do |f|
          concat link_to "file: #{ f.file.filename} ", f.url
        end
      end
      concat form.file_field filestype, title: 'Додати', class: 'btn-info', multiple: true
      concat tag.br
      concat form.check_box :"remove_#{filestype}"
      concat " Очистити (видалити) файли"
    end
	end

end

