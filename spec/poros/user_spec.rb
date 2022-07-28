require 'rails_helper'

RSpec.describe User do
  it 'exists with attributes' do
    data = {
        "id": "2",
        "type": "user",
        "attributes": {
            "email": "GloryOfBeard@gmail.com",
            "name": "Parker"
        }}
    user = User.new(data)
    expect(user).to be_a(User)
    expect(user.id).to eq("2")
    expect(user.name).to eq("Parker")
    expect(user.email).to eq("GloryOfBeard@gmail.com")
  end
end
