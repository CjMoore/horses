require_relative '../spec_helper'

describe "When user fills out form and clicks submit" do
  it "the database adds a new horse" do
    Breed.create(name: "Palimino")
    Jockey.create(name: "Adolf")

    visit('/horses/new')

    fill_in('horse[name]', :with=>"Dufus")
    fill_in('horse[total_winnings]', :with =>3)
    select('Adolf', from: "horse[jockey_id]")
    select('Palimino', from: "horse[breed_id]")

    click_button("Create New Horse")
    horse = Horse.find(1)

    expect(horse).to be_valid
    expect(horse.name).to eq("Dufus")
    expect(horse.total_winnings).to eq(3)
    expect(horse.jockey.name).to eq("Adolf")
    expect(horse.breed.name).to eq("Palimino")
  end
end
