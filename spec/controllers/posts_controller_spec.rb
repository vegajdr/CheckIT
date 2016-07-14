require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  it "allows users to create new post" do
    user = create :user
    sign_in user
    subcheckit = create :subcheckit

    old_count = user.posts.count

    response = post :create, subcheckit_id: subcheckit.id, post: { title: "This is my first post", content: "Just some random content" }

    expect(user.posts.count).to eq old_count + 1
    expect(user.posts.last.title).to eq "This is my first post"
    expect(subcheckit.posts.last.title).to eq "This is my first post"
  end

  it "allows users to edit posts" do
    user = create :user
    subcheckit = create :subcheckit
    sign_in user

    post = user.posts.create( title: "Initial", content: "Post", subcheckit_id: subcheckit.id)

    old_count = user.posts.count

    response = post :update, id: post.id, post: { title: "This is my first post", content: "Just some random content" }

    expect(user.posts.count).to eq old_count
    expect(user.posts.last.title).to eq "This is my first post"
    expect(user.posts.last.content).to eq "Just some random content"

  end

end
