class PlaintextJob < ApplicationJob
  queue_as :default


  def cut_array(arr)
  	temp_array = Array.new(3)
  	for i in -3..0
  		temp_array << arr[i]
  		arr.delete_at i
  	end
  	temp_array.reverse!   #unused temp_array(3)
  end



  def get_values_only(arr)
		temp_array = []
		arr.each do |i|
			puts i
			i.each do |j|
			temp_array<<j.split('=').last
			end
		end
		arr = temp_array
  end



  def put_to_db(arr)

  	tmp = Array.new
  	arr.in_groups_of(14) { |group| tmp << group}

  	cut_array(arr)
  	get_values_only(arr)
  	connection_and_queries(arr)
  end



  def connection_and_queries(arr)
  	con = PG.connect :dbname => 'parseddb_fordashing_development'



  	arr.each do |i|
  			con.exec "INSERT INTO products VALUES(#{i.join(',')})"
  	end
  end


  def perform()
  	strings_from_file = Array.new
		File.foreach("/Users/AntonMac/Dropbox/transfer/export22.txt") { |line| strings_from_file<<line.force_encoding("windows-1251").encode("utf-8") }
		
		strings_from_file = strings_from_file.drop_while { |i| !i.include? "Num" }
		strings_from_file.delete_at -1


		strings_from_file.each do |i|
			i.delete! "^"
			i.chomp!
		end

		put_to_db(strings_from_file)
	end


end
