class MapMarkerSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer

  attributes :id, 
  :title, 
  :address, 
  :latitude, 
  :longitude,
  :creator,
  :message,
  :created_at

  has_many :comments
  has_many :bookmarks
  has_many :users, through: :bookmarks
  belongs_to :creator
  
  # belongs_to :creator, record_type: :user
  # belongs_to :user
  # belongs_to :creator, class_name: 'User', foreign_key: :user_id
  
end
