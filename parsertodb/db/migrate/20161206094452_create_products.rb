class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.bigint  :Num
      t.text  :UNNRec
      t.text  :KorNameOnly
      t.text  :Nazn
      t.text  :Cod
      t.text  :Acc
      t.text  :Db
      t.text  :DbS
      t.text  :Credit
      t.text  :CreditS
      t.text  :QueuePay
      t.text  :VidDoc
      t.text  :DocDate
      t.text  :DocType
      t.text  :DB
      t.text  :DBS
      t.timestamps
    end
  end
end
