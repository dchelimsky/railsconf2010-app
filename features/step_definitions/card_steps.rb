Given /^the following cards:$/ do |cards|
  cards.hashes.each do |card|
    swimlane = Swimlane.find_or_create_by_name(card.delete('swimlane'))
    swimlane.cards.create!(card)
  end
end

When /^I edit the "([^"]*)" card$/ do |title|
  card = Card.find_by_title(title)
  visit edit_card_path(card)
end
