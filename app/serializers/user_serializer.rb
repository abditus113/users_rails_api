class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age

  def include_age?
    object.age.present?
  end
end
