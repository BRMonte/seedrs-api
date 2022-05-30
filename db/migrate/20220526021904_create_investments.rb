class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.references :campaign, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
