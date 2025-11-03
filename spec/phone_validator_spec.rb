require_relative '../lib/phone_validator'
RSpec.describe "valid_phone_number?" do
  context "valid phone numbers" do
    it "Validate Parentheses around area code, space, then 3 digits, dash, 4 digits" do
      valid_number = "(555) 555-5555"
      expect(valid_phone_number?(valid_number)).to be true
    end
    it "validate Three groups separated by dashes" do
      expect(valid_phone_number?("555-555-5555")).to be true
    end
    it "validate Ten digits with no separators" do
      expect(valid_phone_number?("5555555555")).to be true
    end
  end
  context "invalid phone numbers" do
  
    it "Invalidate if  phone number > 10 digit  or number < 10 digit" do
      expect(valid_phone_number?("555-555-55")).to be false
      expect(valid_phone_number?("555-45-5555555")).to be false
    end

    it "Invalidate due to bad separator" do
      expect(valid_phone_number?("555.125.0000")).to be false
    end

    it "rejects non-digit characters" do
      expect(valid_phone_number?("(123) 456-78x0")).to be false
    end

    it "rejects country codes and extensions" do
      expect(valid_phone_number?("+1-555-555-7890 123f")).to be false
    end

    it "rejects leading/trailing whitespace" do
      expect(valid_phone_number?(" 123-456-7890  ")).to be false
    end
    
    it "rejects empty string and nil" do
      expect(valid_phone_number?("")).to be false
      expect(valid_phone_number?(nil)).to be false
    end

    it "rejects phone numbers embedded in text" do
      expect(valid_phone_number?("My number is (123) 456-7890 ruby")).to be false
    end
    it "rejects wrong digit groupings" do
      expect(valid_phone_number?("5555-55-5555")).to be false 
    end
  end
end
