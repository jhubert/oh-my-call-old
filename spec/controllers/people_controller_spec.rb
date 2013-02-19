require 'spec_helper'

describe PeopleController do
  describe 'GET #index' do
    it 'gets the entire people collection' do
      people = (0..5).map { FactoryGirl.create(:person) }
      get :index
      assigns(:people).should eq(people)
    end

    it 'renders the index view' do
      get :index
      response.should render_template :index
    end
  end
end
