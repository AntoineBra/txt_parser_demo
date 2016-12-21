class AddUniqueIndexToNum < ActiveRecord::Migration[5.0]
  def change
    execute 'CREATE UNIQUE INDEX index_parseddb_fordashing_development_Num 
             ON products USING btree ("Num");'
    execute 'CREATE UNIQUE INDEX index_parseddb_fordashing_development_Answer
             ON system_data USING btree ("Answer");'
  end
end
