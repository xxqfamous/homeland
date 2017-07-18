class CreateSms < ActiveRecord::Migration[5.1]
  def change
    create_table :sms_logs do |t|
      t.integer :user_id
      t.string :channel
      t.string :mobile
      t.string :content
      ## '1-成功 2-失败 3-号码无效（包括黑名单） 4-拉黑,5-超过最大数'
      t.integer :status
      t.text :return_str
      t.timestamps
    end
  end
end
