Given %{some people exist} do
  (rand(9) + 1).times {FactoryGirl.create(:person)}
end

When %{I request the people list} do
  step %{I get "/people"}
end

When %{I request the info for one of the people} do
  @person = Person.all.sort_by { rand }.first.decorate
  step %{I get "#{person_path(@person)}"}
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
