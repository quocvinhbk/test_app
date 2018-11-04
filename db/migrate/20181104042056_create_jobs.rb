class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :company, foreign_key: true
      t.references :occupational_category,  foreign_key: true
      t.text :title
      t.text :job_location
      t.string :base_salary
      t.integer :employment_type_cd
      t.integer :work_hours
      t.text :description
      t.string :education_requirements
      t.date :date_posted
      t.date :valid_through

      t.timestamps
    end
  end
end
