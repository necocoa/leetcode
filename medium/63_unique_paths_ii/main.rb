#
# @lc app=leetcode id=63 lang=ruby
#
# [63] Unique Paths II
#

# @lc code=start
class UniquePaths
  attr_reader :count

  def initialize(grid)
    @grid = grid
    @x_length = grid[0].length
    @y_length = grid.length
    @max_x = @x_length - 1
    @max_y = @y_length - 1
    @cache_count = {}
    @count = 0
  end

  def call
    return if !valid_area?(0, 0)

    @count += search(0, 0)
  end

  private

  def search(x, y)
    if goal?(x, y)
      cache_count!(x, y, 1)
      return 1
    end

    count = next_position(x, y).sum do |next_x, next_y|
      cache_count(next_x, next_y) || search(next_x, next_y)
    end

    cache_count!(x, y, count)
    return count
  end

  def next_position(x, y)
    dx = [1, 0]
    dy = [0, 1]
    dx.length.times.filter_map do |i|
      next_x = x + dx[i]
      next_y = y + dy[i]
      if next_x <= @max_x && next_y <= @max_y && valid_area?(next_x, next_y)
        [next_x, next_y]
      end
    end
  end

  def goal?(x, y)
    x == @max_x && y == @max_y && valid_area?(x, y)
  end

  def valid_area?(x, y)
    @grid[y][x] == 0
  end

  def cache_count(x, y)
    @cache_count["#{x}-#{y}".to_sym]
  end

  def cache_count!(x, y, count)
    @cache_count["#{x}-#{y}".to_sym] = count
  end
end

# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  a = UniquePaths.new(obstacle_grid)
  a.call
  a.count
end

# @lc code=end

# obstacle_grid = [
#   [0,0,0],
#   [0,1,0],
#   [0,0,0]
# ]

# obstacle_grid = [
#   [0,0,0],
#   [0,0,0],
#   [0,0,0]
# ]

# obstacle_grid = [
#   [0,1],
#   [0,0]
# ]

# obstacle_grid = [
#   [1]
# ]

# obstacle_grid = [
#   [1, 0]
# ]

# obstacle_grid = [
#   [0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0],
#   [0,0,0,0,0,0,1,0,0,0,0,1,0,1,0,1,0,0],
#   [1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,1,0,1],
#   [0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0],
#   [0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0],
#   [0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0],
#   [0,0,0,0,0,1,0,0,0,0,1,1,0,1,0,0,0,0],
#   [1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,1,0],
#   [0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0],
#   [0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0],
#   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
#   [1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0],
#   [0,0,1,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0],
#   [0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0],
#   [0,0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1],
#   [0,1,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0],
#   [0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1],
#   [1,0,1,1,0,0,0,0,0,0,1,0,1,0,0,0,1,0],
#   [0,0,0,1,0,0,0,0,1,1,1,0,0,1,0,1,1,0],
#   [0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
#   [0,1,1,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0],
#   [0,0,0,0,0,0,1,0,1,0,0,1,0,1,1,1,0,0],
#   [0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,1],
#   [0,1,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0],
#   [1,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0,0],
#   [0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0],
#   [0,1,0,0,0,0,0,1,0,0,0,0,0,0,1,1,1,0],
#   [1,0,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,1],
#   [1,0,0,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0]
# ]

# unique_paths_with_obstacles(obstacle_grid)
