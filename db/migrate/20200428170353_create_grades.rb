class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.string :student_id
      t.string :student_name
      t.float :student_grade

      t.timestamps
    end
  end
end
