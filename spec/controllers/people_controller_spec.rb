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

  describe 'GET #show' do
    it 'gets a single person' do
      person = FactoryGirl.create(:person)
      get :show, id: person
      assigns(:person).should == person
    end

    it 'renders the show view' do
      get :show, id: FactoryGirl.create(:person)
      response.should render_template :show
    end
  end
end
