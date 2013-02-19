class PeopleController < ApplicationController
  respond_to :json

  def index
    @people = PersonDecorator.decorate_collection(Person.all)
  end
end
