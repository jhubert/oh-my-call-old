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

  describe 'PATCH/PUT #update' do
    before(:each) do
      @person = FactoryGirl.create(:person,
                                   fullname: "Original Full Name",
                                   nickname: "Original Nickname")
    end

    context 'updating a person' do
      it 'can change the full name' do
        put :update, id: @person.id, fullname: 'New Full Name'
        @person.reload
        @person.fullname.should == "New Full Name"
      end

      it 'can change the nickname' do
        put :update, id: @person.id, nickname: 'New Nickname'
        @person.reload
        @person.nickname.should == "New Nickname"
      end

      it 'can change the situations via array' do
        pending "Need to figure out situations"
      end

      it 'can change the situations via CSV' do
        pending "Need to figure out situations"
      end
    end
  end
end
