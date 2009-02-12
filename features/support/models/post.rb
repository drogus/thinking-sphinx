class Post < ActiveRecord::Base
  has_many :comments
  
  define_index do
    indexes subject
    indexes content

    has comments(:id), :as => :comment_ids, :source => :ranged_query
  end
end