require_relative '../../config/environment.rb'

namespace :parser_task do
	desc "Parser"
	task :parse do

		def save_to_db_values(lines, model, uniqueField)
			uniqueField = uniqueField.to_sym
			lines.each_slice(14)
      		.map{|l| l.map { |x| x[1..-2].delete("^").split('=') } }
      		.select{|l| l.length == 14}
      		.map{|l| l.map{|k,v| [k,v[0..-2]]} }
      		.map(&:flatten)
      		.map{|x| Hash[*x].symbolize_keys}
      		.each{|l| model.find_or_create_by(uniqueField => l[uniqueField]).update(l.except(uniqueField)) }
		end

		def save_to_db_system_data(lines, model, uniqueField)
			uniqueField = uniqueField.to_sym
			puts lines.map{|l| l[1..-2].delete("^").chomp.split('=') }
					.each_with_object(SystemDatum.new){|(k,v), obj| obj.public_send("#{k}=", v) }.save
		end



		def define_the_begin_of_read(lines)
			lines.each_with_index.find{|val, ind| val["^Num"]}.last
		end



		lines = File.readlines("/Users/AntonMac/Dropbox/transfer/export2.txt")
		data_first = save_to_db_values(lines[define_the_begin_of_read(lines)..-25], Product, 'Num')
    data_second = save_to_db_system_data(lines[-24..-2], SystemDatum, 'Answer')

	end
end
