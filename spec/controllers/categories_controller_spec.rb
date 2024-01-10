require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  render_views
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all categories as @categories' do
      get :index
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested category as @category' do
      get :show, params: { id: category.to_param }
      expect(assigns(:category)).to eq(category)
    end
  end

  describe 'GET #new' do
    it 'assigns a new category as @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested category as @category' do
      get :edit, params: { id: category.to_param }
      expect(assigns(:category)).to eq(category)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'New Category' } }

      it 'updates the requested category' do
        put :update, params: { id: category.to_param, category: new_attributes }
        category.reload
        expect(category.name).to eq('New Category')
      end

      it 'redirects to the category' do
        put :update, params: { id: category.to_param, category: new_attributes }
        category.reload
        expect(response).to redirect_to(category)
      end

      it 'sets a flash message' do
        put :update, params: { id: category.to_param, category: new_attributes }
        expect(flash[:notice]).to eq 'Category was successfully updated.'
      end
    end

    context 'with invalid params' do
      it 'does not update the category' do
        put :update, params: { id: category.to_param, category: { name: nil } }
        category.reload
        expect(category.name).not_to be_nil
      end

      it 're-renders the "edit" template' do
        put :update, params: { id: category.to_param, category: { name: nil } }
        expect(response).to render_template('edit')
      end
    end
  end
end
