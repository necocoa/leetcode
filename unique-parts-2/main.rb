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
    if invalid_area?(0, 0)
      return
    end

    @count += search(0, 0)
  end

  private

  def search(x, y)
    # p "search x: #{x}, y: #{y}"

    if goal?(x, y)
      cache_count!(x, y, 1)
      return 1
    end

    count = 0
    next_position(x, y).each do |next_x, next_y|
      # p "next_x: #{next_x}, next_y: #{next_y}"

      cache = cache_count(next_x, next_y)
      if cache.nil?
        count += search(next_x, next_y)
      else
        count += cache
      end
    end

    cache_count!(x, y, count)
    count
  end

  def next_position(x, y)
    next_pos = []

    # 右に移動
    next_x = x+1
    if next_x <= @max_x && @grid[y][next_x] == 0
      next_pos << [next_x, y]
    end

    # 下に移動
    next_y = y+1
    if next_y <= @max_y && @grid[next_y][x] == 0
      next_pos << [x, next_y]
    end

    next_pos
  end

  def goal?(x, y)
    x == @max_x && y == @max_y && !invalid_area?(x, y)
  end

  def invalid_area?(x, y)
    @grid[y][x] == 1
  end

  def cache_count!(x, y, count)
    @cache_count["#{x}-#{y}".to_sym] = count
  end

  def cache_count(x, y)
    @cache_count["#{x}-#{y}".to_sym]
  end
end

# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  a = UniquePaths.new(obstacle_grid)
  a.call
  a.count
end

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
