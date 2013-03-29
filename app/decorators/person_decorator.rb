class PersonDecorator < Draper::Decorator
  delegate_all

  def url
    h.person_path(model)
  end
end
