class SermonTopics < ActiveRecord::Migration
  def change
    create_table :sermon_topics do |t|
     t.integer :topic_id, :sermon_id
     
     end 
  end
end
