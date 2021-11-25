class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :NumCode
      t.string :CharCode
      t.integer :Nominal
      t.string :Name
      t.float :Value

      t.timestamps
    end
  end
end
