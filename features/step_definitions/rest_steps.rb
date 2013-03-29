def api_url(path)
  %{http://localhost:#{API_PORT}#{path}}
end

When /^I (get) "(.*?)"$/ do |verb, path|
  @response = case verb
              when 'get'
               get(path)
             end
end

When /^I (patch) "(.*?)"$/ do |verb, path|
  @response = case verb
             when 'patch'
               patch(path, @data)
             end
end
