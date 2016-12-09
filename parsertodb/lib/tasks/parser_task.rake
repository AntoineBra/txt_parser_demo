require_relative '../../config/environment.rb'

namespace :parser_task do
	desc "Parser"
	task :parse do

		def save_to_db(lines, model)
			lines.each_slice(14)
      		 .map{|l| l.map { |x| x[1..-2].delete("^").split('=') } }
      		 .select{|l| l.length == 14}
      		 .map{|l| l.map{|k,v| [k,v[0..-2]]} }
      		 .map(&:flatten)
      		 .map{|x| Hash[*x].symbolize_keys}
      		 .each{|l| model.find_or_create_by(l) }
		end



		lines = File.readlines("/Users/AntonMac/Dropbox/transfer/export22.txt", encoding: 'windows-1251')
		data_first = save_to_db(lines[35..-25], Product)
    data_second = save_to_db(lines[-24..-1], SystemDatum)

	end
end


