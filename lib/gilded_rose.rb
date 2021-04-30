class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.map do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros"
      item.sell_in -= 1
      if item.name == "Aged Brie"
        aged_brie(item)
        next
      end
      if item.name != "Backstage passes to a TAFKAL80ETC concert"
        decrease_quality(item)
      else
        increase_quality(item)
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in < 11
            increase_quality(item)
          end
          if item.sell_in < 6
            increase_quality(item)
          end
        end
      end
      if item.sell_in < 0
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            decrease_quality(item)
          else
            item.quality = item.quality - item.quality
          end
      end
    end
  end

  private

  def increase_quality(item)
    item.quality += 1 unless item.quality >= 50
  end

  def decrease_quality(item)
    item.quality -= 1 unless item.quality <= 0
  end

  def aged_brie(brie)
    increase_quality(brie)
    increase_quality(brie) if brie.sell_in <= 0
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
