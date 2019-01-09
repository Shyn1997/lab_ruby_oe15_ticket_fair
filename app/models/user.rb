class User < ApplicationRecord
  belongs_to :garage

  has_secure_password
end
