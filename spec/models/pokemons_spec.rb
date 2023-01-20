require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  subject {
    Pokemon.new(name: "Bulbasaur",
                abilities: ["overgrow", "chlorophyll"],
                weight: "69",
                descriptions: ["grass", "poison"],
                evolutions: ["bulbasaur", "ivysaur", "venusaur"],image:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
                flavours:
                  "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without abilities" do
    subject.abilities = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a weight" do
    subject.weight = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without descriptions" do
    subject.descriptions = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without evolutions" do
    subject.evolutions = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an image" do
    subject.image = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without flavours" do
    subject.flavours = nil
    expect(subject).to_not be_valid
  end
end
