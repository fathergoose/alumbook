class UserAttributes < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :current_title, :string
    add_column :users, :current_employer, :string
    add_column :users, :graduation_date, :date
    add_column :users, :cohort_id, :integer
    add_column :users, :user_type, :integer
    add_column :users, :admin, :boolean, default: false
  end
end
