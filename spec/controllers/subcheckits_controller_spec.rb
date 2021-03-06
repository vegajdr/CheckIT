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

  it "makes user be owner of subcheckit" do
    user = create :user
    sign_in user

    old_count = user.owned_subcheckits.count

    response = post :create, subcheckit: { name: "Test", category: "Interesting" }

    expect(response.status).to eq 302
    expect(user.owned_subcheckits.count).to eq old_count + 1
    expect(user.owned_subcheckits.last.name).to eq "Test"
    expect(user.owned_subcheckits.last.category).to eq "Interesting"
  end

  it "automatically adds owner as moderator of subcheckit" do
    user = create :user
    sign_in user

    response = post :create, subcheckit: { name: "Moderated", category: "New" }

    subcheckit = Subcheckit.last
    expect(response.status).to eq 302
    expect(subcheckit.moderators.last.user).to eq user
  end

  it "allows users to edit owned subcheckit" do
    user = create :user
    sign_in user
    subcheckit = user.subcheckits.create( name: "Test", category: "Category")

    response = post :update, id: subcheckit.id, subcheckit: { name: "Updated", category: "Updated" }

    expect(user.subcheckits.last.name).to eq "Updated"
    expect(user.subcheckits.last.category).to eq "Updated"
  end

  it "allows users to delete owned subcheckit" do
    user = create :user
    sign_in user
    subcheckit = user.subcheckits.create( name: "Delete", category: "This")

    old_count = user.subcheckits.count

    response = delete :destroy, id: subcheckit.id

    expect(user.subcheckits.count).to eq old_count - 1
  end

  pending "pundit tests"
end
