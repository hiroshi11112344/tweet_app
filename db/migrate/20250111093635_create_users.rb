class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :line_uid
      t.date :birth_date # 生年月日バースデーデータ
      t.boolean :in_relationship, default: false # 恋人判定 インリレーションシップ
      t.boolean :relationship_pending, default: false # 申請中 リレーションシップペンディング

      t.timestamps
    end
  end
end
