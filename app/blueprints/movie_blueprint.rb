class MovieBlueprint < Blueprinter::Base
  include AttachmentService

  identifier :id

  fields :name

  field :description do |movie|
    movie.description.presence
  end

  field :annotation do |movie|
    movie.annotation.presence
  end

  field :duration_in_minutes do |movie|
    movie.duration_in_minutes.presence
  end

  field :release_date do |movie|
    movie.release_date.presence
  end

  field :poster_url do |movie|
    AttachmentService.file_url(movie.poster) if movie.poster.attached?
  end
end
