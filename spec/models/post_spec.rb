require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should fail if title is empty' do
    post = Post.new(title: nil, content: 'article', user_id: 1)
  expect(post).to_not be_valid 
  end

  it 'should fail if content is empty' do
    post = Post.new(title: 'title one', content: nil, user_id:1)
    expect(post).to_not be_valid 
  end

  it 'should fail if user_id is empty' do
    post = Post.new(title: 'title one', content: 'article', user_id: nil)
    expect(post).to_not be_valid 
  end

  it 'should fail if post is empty' do
    post = Post.new(title: nil, content: nil, user_id: nil)
    expect(post).to_not be_valid 
  end
end
