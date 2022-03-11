require 'rails_helper'

RSpec.describe "Comments", type: :request do

  let(:user) { create(:user) }
  let!(:post) { create(:post, authorid: user.id) }
  let!(:comments) { create_list(:comment, 20, post_id: post.id, user_id: user.id) }
  let(:post_id) { post.id }
  let(:id) { comments.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /posts/:post_id/comments
  describe 'GET users/user_id/posts/:post_id/comments' do
    before { get "/users/#{user_id}/posts/#{post_id}/comments", params: {}, headers: headers }

    context 'when post exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all post comments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when post does not exist' do
      let(:post_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Text/)
      end
    end
  end

  # Test suite for GET /posts/:post_id/comments/:id
  describe 'GET /posts/:post_id/comments/:id' do
    before { get "/posts/#{post_id}/comments/#{id}", params: {}, headers: headers }

    context 'when todo comment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the commet' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when post comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  # Test suite for PUT /posts/:post_id/comments
  describe 'POST /posts/:post_id/comments' do
    let(:valid_attributes) { { text: 'Visit Narnia' }.to_json }

    context 'when request attributes are valid' do
      before do
        post "/posts/#{post_id}/comments", params: valid_attributes, headers: headers
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/posts/#{post_id}/comments", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Text can't be blank/)
      end
    end
  end

  # Test suite for PUT /posts/:post_id/comments/:id
  describe 'PUT /posts/:post_id/comments/:id' do
    let(:valid_attributes) { { text: 'Mozart' }.to_json }

    before do
      put "/posts/#{post_id}/comments/#{id}", params: valid_attributes, headers: headers
    end

    context 'when comment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the comment' do
        updated_comment = Comment.find(id)
        expect(updated_comment.text).to match(/Mozart/)
      end
    end

    context 'when the comment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  # Test suite for DELETE /posts/:id
  describe 'DELETE /posts/:id' do
    before { delete "posts/#{post_id}/comments/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
