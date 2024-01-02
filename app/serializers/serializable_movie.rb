class SerializableMovie < JSONAPI::Serializable::Resource
  include AttachmentService

  type "movies"

  attributes :name, :description, :annotation, :duration_in_minutes, :release_date

  attribute :poster_url do
    AttachmentService.file_url(@object.poster) if @object.poster.attached?
  end
end
