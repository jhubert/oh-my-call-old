class PeopleController < ApplicationController
  respond_to :json

  def index
    @people = PersonDecorator.decorate_collection(Person.all)
  end

  def show
    @person = PersonDecorator.decorate(Person.find(params[:id]))
  end
end
