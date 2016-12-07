class AddDetailsToProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.bigint     :Num           
      t.bigint     :UNNRec        
      t.text        :KorNameOnly
      t.text        :Nazn       
      t.integer     :Cod           
      t.bigint     :Acc           
      t.float       :Db          
      t.float       :DbS         
      t.decimal     :Credit        
      t.decimal     :CreditS       
      t.integer     :QueuePay
      t.integer     :VidDoc 
      t.datetime    :DocDate        
      t.text        :DocType    

      t.timestamps
    end
  end
end
