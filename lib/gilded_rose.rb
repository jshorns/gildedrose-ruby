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
      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        backstage_passes(item)
        next
      end
      decrease_quality(item)
      if item.sell_in < 0
        decrease_quality(item)
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

  def backstage_passes(passes)
    if passes.sell_in <= 0
      passes.quality = 0 
    else
      increase_quality(passes)
      increase_quality(passes) if passes.sell_in < 10
      increase_quality(passes) if passes.sell_in < 5
    end
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
