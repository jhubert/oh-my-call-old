Given %{some people exist} do
  (rand(9) + 1).times {FactoryGirl.create(:person)}
end

When %{I request the people list} do
  step %{I get "/people"}
end

When %{I pick a random person} do
  @person = Person.all.sort_by { rand }.first.decorate
end

When %{I request the info for one of the people} do
  step %{I pick a random person}
  step %{I get "#{person_path(@person)}"}
end

When /^I change a person's (name|nickname) to "(.*?)"$/ do |attribute, value|
  @person = Person.last
  attribute = 'fullname' if attribute == 'name'
  @old_person_data = Hash.new
  @old_person_data[attribute] = @person.send(attribute)
  @data = { attribute => value }
  step %{I patch "#{person_path(@person)}"}
end

When %{I change a person's situations with an array of situation ids} do
  @person = Person.last
  @old_person_data = Hash.new
  @old_person_data['situations'] = @person.situations
  @data = { 'situation_ids' => (0 .. rand(100)).to_a }
  step %{I patch "#{person_path(@person)}"}
end

When %{I change a person's situations with a CSV list of situation ids} do
  pending
end

Then %{I should receive a JSON array of people} do
  body = Oj.load(@response.body)
  body.should be_a(Array)
  body.each do |item|
    item.should be_a(Hash)
    item.keys.tap do |keys|
      keys.should include('phone_number')
      keys.should include('fullname')
      keys.should include('nickname')
      keys.should include('active')
      keys.should include('url')
      keys.should include('response_count')
      keys.should include('call_count')
      keys.should include('situations')
    end
  end
end

Then %{I should receive a JSON person} do
  body = Oj.load(@response.body)
  body.should be_a(Hash)
  body['phone_number'].should == @person.phone_number
  body['fullname'].should == @person.fullname
  body['nickname'].should == @person.nickname
  body['active'].should == @person.active
  body['url'].should == @person.url
  body['response_count'].should == @person.response_count
  body['call_count'].should == @person.call_count
  body['situations'].should == @person.situations

end

Then %{the person's name should be updated} do
  @person = Person.last
  @person.fullname.should_not == @old_person_data['fullname']
end

Then %{the JSON should indicate the update} do
  body = Oj.load(@response.body)
  body['status'].should == 'updated'
end

Then %{the person's nickname should be updated} do
  @person = Person.last
  @person.nickname.should_not == @old_person_data['nickname']
end

Then %{the person's situations should be updated} do
  @person = Person.last
  @person.situations.sort.should_not == @old_person_data['situations'].sort
end

