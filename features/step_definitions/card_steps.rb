Given /^the following cards:$/ do |cards|
  Card.create! cards.hashes
end

When /^I edit the "([^"]*)" card$/ do |title|
  card = Card.find_by_title(title)
  visit edit_card_path(card)
end

Then /^I should see the following cards:$/ do |expected_cards|
  expected_cards.hashes.each do |row|
    page.should have_content(row["title"])
  end
end

