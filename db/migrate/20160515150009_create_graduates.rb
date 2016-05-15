class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :current_title
      t.string :current_employer
      t.date :graduation_date

      t.timestamps null: false
    end
  end
end
