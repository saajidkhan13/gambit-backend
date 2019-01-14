class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.string :user_id
      t.string :name
      t.string :symbol
      t.integer :price_when_purchased
      t.integer :amount
      t.string :sector
      t.datetime :date_bought

      t.timestamps
    end
  end
end
