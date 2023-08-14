#
# @lc app=leetcode id=695 lang=ruby
#
# [695] Max Area of Island
#

# @lc code=start

class MaxAreaOfIsland
  attr_reader :max_area

  def initialize(grid)
    @grid = grid
    @x_length = grid[0].length
    @y_length = grid.length
    @checked_grid = init_checked_grid(@x_length, @y_length)
    @max_area = 0
  end

  def call
    @grid.each_with_index do |rows, y|
      rows.each_with_index do |col, x|
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

  def search_area(x, y)
    return if checked?(x, y)

    checked!(x, y)

    return if @grid[y][x] == 0

    @count += 1

    calc_around_positions(x, y).each do |x, y|
      search_area(x, y)
    end

    if @max_area < @count
      @max_area = @count
    end
  end

  # 指定した位置の周辺の位置を返す
  def calc_around_positions(x, y)
    dx = [1, 0, -1, 0]
    dy = [0, 1, 0, -1]
    dx.length.times.filter_map do |i|
      next_x = x + dx[i]
      next_y = y + dy[i]
      [next_x, next_y] if !out_of_area?(next_x, next_y)
    end
  end

  def out_of_area?(x, y)
    x < 0 || y < 0 || x >= @x_length || y >= @y_length
  end

  def checked!(x, y)
    @checked_grid[y][x] = true
  end

  def checked?(x, y)
    @checked_grid[y][x]
  end
end

def max_area_of_island(grid)
  a = MaxAreaOfIsland.new(grid)
  a.call
  a.max_area
end

# @lc code=end
