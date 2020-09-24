class AddIntroductionToLearners < ActiveRecord::Migration[5.2]
  def change
    add_column :learners, :introduction, :text
  end
end
