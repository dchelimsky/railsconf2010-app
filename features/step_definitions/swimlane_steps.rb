Given /^a default swimlane named "([^"]*)"$/ do |name|
  Swimlane.create!(:name => name, :default => true)
end

Given /^the following swimlanes:$/ do |swimlanes|
  Swimlane.create! swimlanes.hashes
end

When /^I move "([^"]*)" to the "([^"]*)" swimlane$/ do |card_title, swimlane|
  visit cards_path
  within(card_div(card_title)) do
    select swimlane, :from => "Move to"
    click_button "Move"
  end
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

Then /^I should see the following cards in their respective lanes:$/ do |board|
  board.raw.transpose.each do |swimlane_with_cards|
    swimlane_name = swimlane_with_cards.shift
    swimlane_with_cards.reject{|c| c == ""}.each do |card_name|
      Then %Q{I should see the following cards in the "#{swimlane_name}" swimlane:}, table([['title'], [card_name]])
    end
  end
end

module SwimlaneHelpers
  def card_div(card_title)
    card = Card.find_by_title(card_title)
    "#card-#{card.id}"
  end
end

World(SwimlaneHelpers)
