Given /^a default swimlane named "([^"]*)"$/ do |name|
  Swimlane.create!(:name => name, :default => true)
end

Given /^the following swimlanes:$/ do |swimlanes|
  Swimlane.create! swimlanes.hashes
end

Then /^I (should|should not) see the following cards in the "([^"]*)" swimlane:$/ do |see, swimlane_name, expected_cards|
  swimlane = Swimlane.find_by_name(swimlane_name)
  within("#swimlane-#{swimlane.id}") do
    expected_cards.hashes.each do |row|
      should_or_should_not = see.gsub(/ /, '_')
      page.__send__(should_or_should_not, have_content(row["title"])) # Cleverness warning!
    end
  end
end

Then /^I should see the following swimlanes in order:$/ do |expected_swimlanes|
  actual_swimlanes = tableish('table#swimlanes thead tr', 'th')
  expected_swimlanes.raw.should == actual_swimlanes
end
