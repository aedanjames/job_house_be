class UserSerializer
  include JSONAPI::Serializer
  attributes :email

  has_many :jobs, through: :user_jobs
end
