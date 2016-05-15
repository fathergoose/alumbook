class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :current_title
      t.string :current_employer
      t.date :graduation_date
      t.integer :cohort_id
      t.integer :user_type

      t.timestamps null: false
    end
  end
end
