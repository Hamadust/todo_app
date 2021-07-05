class MessageToTask < ActiveRecord::Migration[6.1]
  def change
    # 以下を追加 -------------------
    rename_table :messages, :tasks
    # ----------------------------
  end
end
