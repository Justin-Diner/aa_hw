require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

	# validations
it { should validate_presence_of(:email) }
it { should validate_presence_of(:password_digest) }
it { should validate_length_of(:password).is_at_least(6).on(:create) }  
end



