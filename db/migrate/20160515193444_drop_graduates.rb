class DropGraduates < ActiveRecord::Migration
  def change
    drop_table :graduates
  end
end
