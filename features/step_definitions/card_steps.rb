Given /^the following cards:$/ do |cards|
  Card.create! cards.hashes
end

When /^I edit the "([^"]*)" card$/ do |title|
  card = Card.find_by_title(title)
  visit edit_card_path(card)
end
