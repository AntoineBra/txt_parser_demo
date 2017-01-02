class CreateSystemData < ActiveRecord::Migration[5.0]
  def change
    create_table :system_data do |t|
    	t.text	:CR
		t.text	:CRS
		t.text	:DateOut
		t.text	:DebOut
		t.text	:CrOut
		t.text	:RestOutS
		t.text	:stampLeft
		t.text	:stampRight
		t.text	:stampTop
		t.text	:stampBottom
		t.text	:KOD_SOATO
		t.text	:SEAL_NUMBER
		t.text	:FILIAL_NAME
		t.text	:PODR_NAME
		t.text	:DATE_PROV
		t.text	:USER
		t.text	:USER_KOD
		t.text	:Answer
		t.text	:AppSign
		t.text	:BAppSign
		t.text	:FIOSign
		t.text	:BFIOSign
		t.text	:KeySign
		t.text	:BKeySign
      t.timestamps
    end
  end
end

