class User
  include Mongoid::Document

  embeds_one :landlord_account, class_name: 'User::Account::Landlord', inverse_of: :user
  embeds_one :tenant_account,   class_name: 'User::Account::Tenant',   inverse_of: :user

  delegate :property, :property=, to: :landlord_account

  field :name

  after_initialize do
    self.landlord_account = User::Account::Landlord.create user: self unless self.landlord_account
  end

  def landlord
    landlord_account
  end

  def landlord?
    landlord_account
  end
end