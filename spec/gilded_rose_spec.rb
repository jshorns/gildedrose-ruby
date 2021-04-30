require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    describe 'for normal items' do

      before(:each) do
        @items = [Item.new("foo", 3, 4), Item.new("bar", 0, 2), Item.new("baz", 0, 0)]
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
      it "diminishes quality by 2 when sell_in is below 0" do
        expect {@shop.update_quality }.to change {@items[1].quality}.by -2
      end
      it "does not diminish quality past 0" do
        expect {@shop.update_quality }.not_to change {@items[2].quality}
      end

    end

    describe 'for aged brie' do

      before(:each) do
        @items = [Item.new("Aged Brie", 3, 4), Item.new("Aged Brie", 0, 4), Item.new("Aged Brie", 0, 50)]
        @shop = GildedRose.new(@items)
      end

      it "does not change the name" do
        @shop.update_quality
        expect(@items[0].name).to eq "Aged Brie"
      end
      it "diminishes sellIn by 1" do
        expect {@shop.update_quality }.to change {@items[0].sell_in }.by -1
      end
      it "increases quality by 1 when sell_in is above 0" do
        expect {@shop.update_quality }.to change {@items[0].quality}.by 1
      end
      it "increases quality by 2 when sell_in is below 0" do
        expect {@shop.update_quality }.to change {@items[1].quality}.by 2
      end
      it "does not increase quality past 50" do
        expect {@shop.update_quality }.not_to change {@items[2].quality}
      end

    end

  end

end
