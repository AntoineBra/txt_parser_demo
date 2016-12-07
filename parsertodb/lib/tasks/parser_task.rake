require_relative '../../config/environment.rb'

namespace :parser_task do
	desc "Parser"
	task :parse do



		data = File.readlines("/Users/AntonMac/Dropbox/transfer/export22.txt", encoding: 'windows-1251')[35..-39]
               .each_slice(14)
               .map{|l| l.map { |x| x[1..-2].split('=') } }
               .select{|l| l.length == 14}
               .map{|l| l.map{|k,v| [k,v[0..-2]]} }
               .map(&:flatten)
               .map{|x| Hash[*x].symbolize_keys}
               .each{|l| Product.create(l) }
	end
end


