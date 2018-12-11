RSpec.describe Person, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:person) }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    describe "#name" do
      it "is not valid with empty name" do
        subject.name = ""
        expect(subject).to be_invalid
        expect(subject.errors[:name]).to be_present
      end
    end

    describe "#document" do
      it "is not valid with empty document" do
        subject.document = ""
        expect(subject).to be_invalid
        expect(subject.errors[:document]).to be_present
      end

      it "is not valid with matching document" do
        FactoryBot.create(:person, document: "123 ssp")
        subject.document = "123 SSP"
        expect(subject).to be_invalid
        expect(subject.errors[:document]).to be_present
      end
    end
  end
end
