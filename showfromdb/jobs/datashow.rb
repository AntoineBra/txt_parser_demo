# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
require "pg"

SCHEDULER.every '10m', :first_in => 0 do |job|
  db = PG.connect(:hostaddr => "0.0.0.0", :user => "AntonMac", :password => "12345678", :port => 5432, :dbname => "parseddb_fordashing_development" )
  sql = "SELECT * FROM products"
  acctitems = []
  db.exec(sql) do |results|
	  acctitems = results.map do |row|
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
	      :DocType 			=> row['DocType'] 
	    }
	  end
	end
  send_event('show_widget', { title: "DATA FROM DATA BASE", items: acctitems })
end