RSpec.describe House, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:house) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    describe "#number" do
      it "is not valid with empty number" do
        subject.number = ""
        expect(subject).to be_invalid
        expect(subject.errors[:number]).to be_present
      end

      it "is not valid with matching number" do
        FactoryBot.create(:house, number: "29d")
        subject.number = "29D"
        expect(subject).to be_invalid
        expect(subject.errors[:number]).to be_present
      end
    end

    describe "#address" do
      it "is not valid with empty address" do
        subject.address = ""
        expect(subject).to be_invalid
        expect(subject.errors[:address]).to be_present
      end
    end
  end
end
