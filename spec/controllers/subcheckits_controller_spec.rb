require 'rails_helper'

RSpec.describe SubcheckitsController, type: :controller do

  it "allows users to create new subcheckit" do
    user = create :user
    sign_in user

    old_count = Subcheckit.all.count

    response = post :create, subcheckit: { name: "Test", category: "Interesting" }

    expect(response.status).to eq 302
    expect(Subcheckit.all.count).to eq old_count + 1
    expect(Subcheckit.last.name).to eq "Test"


  end
end
