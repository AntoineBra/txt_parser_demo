
class Product < ApplicationRecord
	before_create :change_VidDoc

	DOC_TYPES = { "01" => "Приход", "06" => "Расход" }
	def change_VidDoc
		public_send("VidDoc=", DOC_TYPES.fetch(public_send(:VidDoc), ""))
	end
end
