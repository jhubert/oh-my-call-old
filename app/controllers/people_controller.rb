class PeopleController < ApplicationController
  respond_to :json

  def index
    @people = PersonDecorator.decorate_collection(Person.all)
  end

  def show
    @person = PersonDecorator.decorate(Person.find(params[:id]))
  end

  def update
    @person = Person.find(params[:id])

    data = Hash.new

    if params[:fullname].present?
      data[:fullname] = params[:fullname]
    end
    
    if params[:nickname].present?
      data[:nickname] = params[:nickname]
    end

    # TODO: Make the following actually work

    #if params[:situation_ids].present?
      #data[:situation_ids] = params[:situation_ids]
      #if data[:situation_ids].to_s == data[:situation_ids]
        #data[:situation_ids] = data[:situation_ids].split(/,\s+/).map(&:to_i)
      #end
    #end

    if @person.update_attributes!(data)
      render :update, status: 202
    else
      respond_with "oh shit"
    end
  end
end
