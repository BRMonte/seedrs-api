class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :sector
      t.string :country
      t.string :percentage_raised
      t.integer :target_amount
      t.decimal :investment_multiple

      t.timestamps
    end
  end
end
