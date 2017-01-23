require_relative '../../config/environment.rb'

namespace :parser_task do
	desc "Parser"
	task :parse do

		class PrepareStrings
			OPERATION_LENGTH = 14
			def initialize(lines)
				@lines=lines
			end
			
			def slice
				@lines.each_slice(OPERATION_LENGTH).map {|i| ConvertLinesToHash.new(i).to_h }
			end
		end

		class StringSplitter
			def initialize(string)
				@string = string
			end

			def to_a
				@string.delete("^").chomp.split('=')
			end
		end

		class ConvertLinesToHash
			def initialize(lines)
				@lines = lines
			end
			
			def to_h
				@lines.each_with_object({}) do |l,hash|
					k,v = StringSplitter.new(l).to_a
					hash[k]=v
				end
			end
		end

		class SaveToDB
			def initialize(hash, model, uniqueField)
				@hash=hash
				@model=model
				@uniqueField=uniqueField
			end

			def save
				@model.find_or_create_by(@uniqueField => @hash[@uniqueField]).update(@hash.except(@uniqueField))
			end
		end

		def begin_of_read(lines)
			lines.each_with_index.find{|val, ind| val["^DocDate"]}.last
		end

		lines = File.readlines("/Users/AntonMac/Dropbox/transfer/export22.txt", encoding: "windows-1251")
		beginLine = begin_of_read(lines)
		PrepareStrings.new(lines[beginLine...-27]).slice.each {|i| SaveToDB.new(i, Product, 'Num').save }
		SaveToDB.new(ConvertLinesToHash.new(lines[-27...-1]).to_h, SystemDatum, 'Answer').save

	end
end

