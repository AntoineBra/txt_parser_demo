# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
require "pg"
DB = PG.connect(:dbname => "parseddb_fordashing_development" )
class CashChange
	def initialize
		
	end




end


class BalanceAndDate
	def initialize
		@items = []
	end
	
	def data_hash
		DB.exec('select "RestOutS", "Answer" from system_data') do |results|
	  	@items = results.map do |row|
		  	row = {
					:RestOutS	=> row['RestOutS'],
					:Answer		=> row['Answer']
		  	}
	  	end
		end
		return @items
	end
end


SCHEDULER.every '10m', :first_in => 0 do |job|
	
	

	send_event('balance_and_data_widget', { title: "Остаток: ", items: BalanceAndDate.new.data_hash })
#	send_event('cash_change_widget', { title: "",  } )
end




