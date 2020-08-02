class AddDefaultDescriptionToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :description, from: nil, to: "Hey there, I´m using AI Facebook"
  end
end
