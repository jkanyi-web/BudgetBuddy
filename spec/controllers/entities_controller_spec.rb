require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  let(:user) { create(:user) }
  let(:entity) { create(:entity, author: user) }
  let(:valid_attributes) { { author_id: user.id, name: 'Test Entity', amount: 100 } }
  let(:invalid_attributes) { { author_id: nil, name: '', amount: nil } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: entity.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Entity' do
        expect {
          post :create, params: { entity: valid_attributes }
        }.to change(Entity, :count).by(1)
      end

      it 'redirects to the created entity' do
        post :create, params: { entity: valid_attributes }
        expect(response).to redirect_to(Entity.last)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Entity' do
        expect {
          post :create, params: { entity: invalid_attributes }
        }.to change(Entity, :count).by(0)
      end

      it "renders 'new'" do
        post :create, params: { entity: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'Updated Entity' } }

      it 'updates the requested entity' do
        put :update, params: { id: entity.id, entity: new_attributes }
        entity.reload
        expect(entity.name).to eq('Updated Entity')
      end

      it 'redirects to the entity' do
        put :update, params: { id: entity.id, entity: new_attributes }
        entity.reload
        expect(response).to redirect_to(entity)
      end
    end

    context 'with invalid parameters' do
      it "renders 'edit'" do
        put :update, params: { id: entity.id, entity: invalid_attributes }
        expect(response).to be_unprocessable
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested entity' do
      entity = Entity.create! valid_attributes
      expect {
        delete :destroy, params: { id: entity.id }
      }.to change(Entity, :count).by(-1)
    end

    it 'redirects to the entities list' do
      entity = Entity.create! valid_attributes
      delete :destroy, params: { id: entity.id }
      expect(response).to redirect_to(entities_url)
    end
  end
end
