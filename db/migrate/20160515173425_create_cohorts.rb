class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.string :campus
      t.string :instructor
      t.string :cohort_date

      t.timestamps null: false
    end
  end
end
