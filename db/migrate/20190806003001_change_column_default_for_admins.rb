class ChangeColumnDefaultForAdmins < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :users,
      :is_admin,
      from: nil,
      to: false
    )
  end
end
