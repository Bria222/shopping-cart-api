class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :price, :product_type, :discount, :units, :category, :image

  def image
    rails_blob_path(object.image, only_path: true ) if object.image.attached?
  end
end
