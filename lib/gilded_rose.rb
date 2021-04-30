class GildedRose
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(items, min_quality = MIN_QUALITY, max_quality = MAX_QUALITY)
    @items = items
    @min_quality = min_quality
    @max_quality = max_quality
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
      normal_items(item)
    end
  end

  private

  def normal_items(item)
    if item.sell_in >= 0
      decrease_quality(item)
    else
      2.times { decrease_quality(item) }
    end
  end

  def increase_quality(item)
    item.quality += 1 unless item.quality >= @max_quality
  end

  def decrease_quality(item)
    item.quality -= 1 unless item.quality <= @min_quality
  end

  def aged_brie(brie)
    if brie.sell_in >= 0
      increase_quality(brie)
    else
      2.times { increase_quality(brie) }
    end
  end

  def backstage_passes(passes)
    case 
    when passes.sell_in < 0
      passes.quality = 0
    when passes.sell_in > 10
      increase_quality(passes)
    when passes.sell_in.between?(5, 10)
      2.times { increase_quality(passes) }
    when passes.sell_in.between?(0, 5)
      3.times { increase_quality(passes) }
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
