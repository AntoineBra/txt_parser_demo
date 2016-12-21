# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
require "pg"

SCHEDULER.every '10m', :first_in => 0 do |job|
  db = PG.connect(:dbname => "parseddb_fordashing_development" )
  acctitems_fir = []
  acctitems_sec = []

  db.exec("SELECT * FROM products") do |results|
	  acctitems_fir = results.map do |row|
	    row = {
	      :Num        	=> row['Num'],
	      :UNNRec     	=> row['UNNRec'],
	      :KorNameOnly	=> row['KorNameOnly'],
	      :Nazn       	=> row['Nazn'],
	      :Cod        	=> row['Cod'],
	      :Acc        	=> row['Acc'],
	      :Db         	=> row['Db'],
	      :DbS        	=> row['DbS'],
	      :Credit     	=> row['Credit'],
	      :CreditS    	=> row['CreditS'],
	      :QueuePay 		=> row['QueuePay'],
	      :VidDoc     	=> row['VidDoc'],
	      :DocDate 			=> row['DocDate'],
	      :DocType 			=> row['DocType'],
	      :DB         	=> row['DB'],
	      :DBS        	=> row['DBS']
	    }
	  end
	end

	db.exec("SELECT * FROM system_data") do |results|
	  acctitems_sec = results.map do |row|
	    row = {

	    	:CR 					=> row['CR'],
				:CRS 					=> row['CRS'],
				:DateOut			=> row['DateOut'],
				:DebOut				=> row['DebOut'],
				:CrOut 				=> row['CrOut'],
				:RestOutS			=> row['RestOutS'],
				:stampLeft		=> row['stampLeft'],
				:stampRight		=> row['stampRight'],
				:stampTop			=> row['stampTop'],
				:stampBotto		=> row['stampBotto'],
				:KOD_SOATO		=> row['KOD_SOATO'],
				:SEAL_NUMBE		=> row['SEAL_NUMBE'],
				:FILIAL_NAM		=> row['FILIAL_NAM'],
				:PODR_NAME		=> row['PODR_NAME'],
				:DATE_PROV		=> row['DATE_PROV'],
				:USER 				=> row['USER 	'],
				:USER_KOD			=> row['USER_KOD'],
				:Answer				=> row['Answer'],
				:AppSign			=> row['AppSign'],
				:BAppSign			=> row['BAppSign'],
				:FIOSign			=> row['FIOSign'],
				:BFIOSign			=> row['BFIOSign'],
				:KeySign			=> row['KeySign'],
				:BKeySign			=> row['BKeySign']
	    }
	  end
	end

#  send_event('show_widget', { title: "DATA FROM DATA BASE", items_fir: acctitems_fir, items_sec: acctitems_sec })
send_event('show_widget', { title: "DATA FROM DATA BASE", items_fir: acctitems_fir, items_sec: acctitems_sec })
end




