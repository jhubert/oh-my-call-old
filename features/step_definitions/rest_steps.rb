When /^I (.*?) "(.*?)"$/ do |verb, path|
  @response = case verb
              when 'get'
               get(path)
             end
end
