class MaxAreaOfIsland
  attr_reader :grid, :max_x, :max_y, :max_area
  attr_accessor :checked_grid

  def initialize(grid)
    @grid = grid
    x_length = grid[0].length
    y_length = grid.length
    @checked_grid = init_checked_grid(x_length, y_length)
    @max_x = x_length - 1
    @max_y = y_length - 1
    @max_area = 0
  end

  def call
    grid.each_with_index do |rows, y|
      rows.each_with_index do |_col, x|
        # p "grid x: #{x}, y: #{y}"
        @count = 0
        search_area(x, y)
      end
    end
  end

  private

  # チェック済かどうか、をキャッシュする配列を作成する
  def init_checked_grid(x_length, y_length)
    Array.new(y_length) { Array.new(x_length, false) }
  end

  def checked!(x, y)
    checked_grid[y][x] = true
  end

  def checked?(x, y)
    checked_grid[y][x]
  end

  def search_area(x, y)
    return if checked?(x, y)

    checked!(x, y)

    return if grid[y][x].zero?

    @count += 1

    calc_around_positions(x, y).each do |x, y|
      # p "positions x: #{x}, y: #{y}"
      search_area(x, y)
    end

    if @max_area < @count
      # p "@max_area: #{@max_area}, c_count: #{c_count}"
      @max_area = @count
    end
  end

  # 指定した位置の周辺の位置を返す
  def calc_around_positions(base_x, base_y)
    ary = []

    calc_x = base_x - 1
    calc_y = base_y
    unless out_of_area(calc_x, calc_y)
      ary << [calc_x, calc_y]
    end

    calc_x = base_x + 1
    calc_y = base_y
    unless out_of_area(calc_x, calc_y)
      ary << [calc_x, calc_y]
    end

    calc_x = base_x
    calc_y = base_y - 1
    unless out_of_area(calc_x, calc_y)
      ary << [calc_x, calc_y]
    end

    calc_x = base_x
    calc_y = base_y + 1
    unless out_of_area(calc_x, calc_y)
      ary << [calc_x, calc_y]
    end

    ary
  end

  def out_of_area(x, y)
    x.negative? || y.negative? || x > @max_x || y > @max_y
  end
end

grid = [
  [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
  [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
  [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]
]

def max_area_of_island(grid)
  a = MaxAreaOfIsland.new(grid)
  a.call
  a.max_area
end
