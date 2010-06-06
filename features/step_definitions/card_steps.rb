Then /^I should see the following cards:$/ do |expected_cards|
  expected_cards.hashes.each do |row|
    page.should have_content(row["Title"])
  end
end
