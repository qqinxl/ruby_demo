class Blog < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :publish_at, :subject
  
  paginates_per 5
end
