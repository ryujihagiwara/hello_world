class AddProfileImageIdToLearners < ActiveRecord::Migration[5.2]
  def change
    add_column :learners, :profile_image_id, :string
  end
end
