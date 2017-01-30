require_relative '../spec_helper'

describe 'When user visits index' do
  it 'they are able to see horses in database' do
    Breed.create(name: "Palimino")
    Jockey.create(name: "Adolf")
    Horse.create(name: "Phil", age: 22, total_winnings: 3, breed_id: 1, jockey_id: 1)

    visit('/horses')

    within('#name') do
      expect page.has_content?("Phil")
    end
    within(".breed") do
      expect page.has_content?("Palimino")
    end
    within(".jockey") do
      expect page.has_content?("Adolf")
    end
    within(".winnings") do
      expect page.has_content?(3)
    end

    expect page.has_button?("Delete")
  end
end
