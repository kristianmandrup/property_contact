class Property
  include Mongoid::Document

  include_concerns :contact

  belongs_to :owner, class_name: 'User::Account::Landlord', inverse_of: :property

  field :name

  alias_method :landlord, :owner

  def owned_by? user
    raise ArgumentError, "Not a landlord, was: #{user}" unless user.respond_to? :landlord
    owner == user.landlord
  end

  def max_requests_allowed
    50
  end
end