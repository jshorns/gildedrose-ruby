require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do

    describe 'for normal items' do

      before(:each) do
        @items = [
          Item.new("foo", 3, 4), 
          Item.new("bar", 0, 2), 
          Item.new("baz", 0, 0)
          ]
        @shop = GildedRose.new(@items)
      end

      it "does not change the name" do
        @shop.update_quality
        expect(@items[0].name).to eq "foo"
      end
      it "diminishes sellIn by 1" do
        expect { @shop.update_quality }.to change { @items[0].sell_in }.by -1
      end
      it "diminishes quality by 1 when sell_in is above 0" do
        expect { @shop.update_quality }.to change { @items[0].quality }.by -1
      end
      it "diminishes quality by 2 when sell_in is below 0" do
        expect { @shop.update_quality }.to change { @items[1].quality }.by -2
      end
      it "does not diminish quality past 0" do
        expect { @shop.update_quality }.not_to change { @items[2].quality }
      end

    end

    describe 'for legendary items' do
      before(:each) do
        @items = [
          Item.new("Sulfuras, Hand of Ragnaros", 0, 80), 
          Item.new("Sulfuras, Hand of Ragnaros", -4, 80), 
          ]
        @shop = GildedRose.new(@items)
      end
      it 'changes nothing' do
        expect { @shop.update_quality }.not_to change { @items[0].name }
        expect { @shop.update_quality }.not_to change { @items[0].sell_in }
        expect { @shop.update_quality }.not_to change { @items[0].quality }
        expect { @shop.update_quality }.not_to change { @items[0].name }
        expect { @shop.update_quality }.not_to change { @items[0].sell_in }
        expect { @shop.update_quality }.not_to change { @items[0].quality }
      end
    end

    describe 'for aged brie' do

      before(:each) do
        @items = [
          Item.new("Aged Brie", 3, 4),
          Item.new("Aged Brie", 0, 4), 
          Item.new("Aged Brie", -1, 49), 
          Item.new("Aged Brie", 3, 50)
          ]
        @shop = GildedRose.new(@items)
      end

      it "does not change the name" do
        @shop.update_quality
        expect(@items[0].name).to eq "Aged Brie"
      end
      it "diminishes sellIn by 1" do
        expect { @shop.update_quality }.to change { @items[0].sell_in }.by -1
      end
      it "increases quality by 1 when sell_in is above 0" do
        expect { @shop.update_quality }.to change { @items[0].quality }.by 1
      end
      it "increases quality by 2 when sell_in is below 0" do
        expect { @shop.update_quality }.to change { @items[1].quality }.by 2
      end
      it "unless increasing by 2 would take quality beyond 50" do
        expect { @shop.update_quality }.to change { @items[2].quality }.by 1
      end
      it "does not increase quality past 50" do
        expect { @shop.update_quality }.not_to change { @items[3].quality }
      end
      
    end

    describe 'for backstage passes' do

      before(:each) do
        @items = [
        Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 4), 
        Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 4),
        Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 49),
        Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 20),
        Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 48),
        Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 50),
        Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 48),
        Item.new("Backstage passes to a TAFKAL80ETC concert", -2, 0),
        ]
        @shop = GildedRose.new(@items)
      end

      it "does not change the name" do
        @shop.update_quality
        expect(@items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      end
      it "diminishes sellIn by 1" do
        expect {@shop.update_quality }.to change { @items[0].sell_in }.by -1
      end
      it "increases quality by 1 when sell_in is above 10" do
        expect { @shop.update_quality }.to change { @items[0].quality }.by 1
      end
      it "increases quality by 2 when sell_in is between 10 and 5" do
        expect { @shop.update_quality }.to change { @items[1].quality }.by 2
      end
      it "unless increasing by 2 would take quality beyond 50" do
        expect { @shop.update_quality }.to change { @items[2].quality }.by 1
      end
      it "increases quality by 3 when sell_in is between 5 and 0" do
        expect { @shop.update_quality }.to change { @items[3].quality }.by 3
      end
      it "unless increasing by 3 would take quality beyond 50" do
        expect { @shop.update_quality }.to change { @items[4].quality }.by 2
      end
      it "does not increase quality past 50" do
        expect { @shop.update_quality }.not_to change { @items[5].quality }
      end
      it "drops quality to zero after sellIn date passed" do
        expect { @shop.update_quality }.to change { @items[6].quality }.by -48
      end
      it "does not decrease quality past 0" do
        expect { @shop.update_quality }.not_to change { @items[7].quality }
      end
      
    end

  end

end
