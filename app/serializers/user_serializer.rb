class UserSerializer
  include JSONAPI::Serializer
  attributes :email

  has_many :user_jobs
end
