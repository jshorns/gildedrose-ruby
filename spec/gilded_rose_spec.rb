require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    describe 'for normal items' do

      before(:each) do
        @items = [Item.new("foo", 3, 4)]
        @shop = GildedRose.new(@items)
      end

      it "does not change the name" do
        @shop.update_quality
        expect(@items[0].name).to eq "foo"
      end

      it "diminishes sellIn by 1" do
        expect {@shop.update_quality }.to change {@items[0].sell_in }.by -1
      end

      it "diminishes quality by 1 when sell_in is above 0" do
        expect {@shop.update_quality }.to change {@items[0].quality}.by -1
      end

    end
    
  end

end
