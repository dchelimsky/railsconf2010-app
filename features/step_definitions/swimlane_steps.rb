Given /^a default swimlane named "([^"]*)"$/ do |name|
  Swimlane.create!(:name => name, :default => true)
end

Given /^the following swimlanes:$/ do |swimlanes|
  Swimlane.create! swimlanes.hashes
end

When /^I move "([^"]*)" to the "([^"]*)" swimlane$/ do |card_title, swimlane_name|
  visit cards_path
  if(@javascript)
    card_widget = page.driver.find(card_widget(card_title)).first
    swimlane_widget = page.driver.find(swimlane_widget(swimlane_name)).first
    card_widget.drag_to(swimlane_widget)
  else
    within(card_widget(card_title, :css)) do
      select swimlane_name, :from => "Move to"
      click_button "Move"
    end
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
  def card_widget(card_title, selector_type = :xpath)
    card = Card.find_by_title(card_title)
    selector_type == :xpath ? "//li[@id='card-#{card.id}']" : "#card-#{card.id}"
  end

  def swimlane_widget(swimlane_name)
    swimlane = Swimlane.find_by_name(swimlane_name)
    "//ul[@id='swimlane-#{swimlane.id}']"
  end
end

Before('@javascript') do
  @javascript = true
end

World(SwimlaneHelpers)
