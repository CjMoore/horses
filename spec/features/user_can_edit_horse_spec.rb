require_relative '../spec_helper'

describe "When user edits a horse and clicks submit" do
  it "changes the appropriate attribute for that horse" do
    Breed.create(name: "Palimino")
    Jockey.create(name: "Adolf")
    Horse.create(name: "Phil", age: 22, total_winnings: 3, breed_id: 1, jockey_id: 1)

    visit('/horses/1/edit')

    horse = Horse.find(1)
    expect(horse.name).to eq("Phil")

    fill_in('horse[name]', :with => 'Dufus')
    click_button('Update Horse')

    horse = Horse.find(1)
    expect(horse.name).to eq("Dufus")
  end
end
