class AddUserReferencesToFriendRequests < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :friend_requests, :users, column: :from_user_id
    add_foreign_key :friend_requests, :users, column: :to_user_id 
  end
end
