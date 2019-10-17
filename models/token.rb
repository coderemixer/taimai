class Token < Ohm::Model
  attribute :token
  attribute :user_id
  attribute :role

  index :token

  def user
    # TODO: Link with user model
  end
end
