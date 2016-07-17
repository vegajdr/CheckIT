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

    posting = user.posts.create( title: "Initial", content: "Post", subcheckit_id: subcheckit.id)

    old_count = user.posts.count
    response = patch :update, subcheckit_id: 1, id: posting.id, post: { title: "This is my first post", content: "Just some random content" }

    expect(user.posts.count).to eq old_count
    expect(user.posts.last.title).to eq "This is my first post"
    expect(user.posts.last.content).to eq "Just some random content"
  end

  skip "allows users to delete posts" do
    post = create :post
    user = post.user

  end

end
