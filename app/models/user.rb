class User < ActiveRecord::Base
  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true

  def as_json(options = {})
    super(options).select { |_, v| v }
  end
end
