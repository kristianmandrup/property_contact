FactoryGirl.define do
  factory :tenant_user, class: 'User', aliases: [:user, :tenant] do  
    trait :valid do
      name 'The tenant'
    end

    # after :build do |user, evaluator|
    #   user.tenant_account = FactoryGirl.create(:tenant_account, user: user)
    # end

    factory :valid_tenant_user, traits: [:valid]
  end

  factory :landlord_user, class: 'User', aliases: [:landlord] do  
    trait :valid do
      name 'The landlord'
    end

    # after :build do |user, evaluator|
    #   user.landlord_account = FactoryGirl.create(:landlord_account, user: user)
    # end

    factory :valid_landlord_user, traits: [:valid]
  end  
end