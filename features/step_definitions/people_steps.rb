Given %{some people exist} do
  (rand(9) + 1).times {FactoryGirl.create(:person)}
end

When %{I request the people list} do
  step %{I get "/people"}
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
