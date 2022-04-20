class JobSerializer
  include JSONAPI::Serializer
  attributes :salary, :location, :id, :company, :contact, :title 
end
