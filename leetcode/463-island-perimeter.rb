# You are given a map in form of a two-dimensional integer grid 
# where 1 represents land and 0 represents water. 
# Grid cells are connected horizontally/vertically (not diagonally). 
# The grid is completely surrounded by water, 
# and there is exactly one island (i.e., one or more connected land cells). 
# The island doesn't have "lakes" (water inside that isn't connected to the water around the island). 
# One cell is a square with side length 1. 
# The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

# # @param {Integer[][]} grid
# # @return {Integer}

# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
    perimeter = 0
    grid.each_with_index do |row, i|
        row.each_with_index do |col, j|
            curr_perim = 0
            if grid[i][j] == 1
                curr_perim = 4
                if i - 1 >= 0
                    if grid[i-1][j] == 1
                        curr_perim -= 1
                    end
                end
                if i + 1 < grid.length
                    if grid[i+1][j] == 1
                        curr_perim -= 1
                    end
                end
                if j + 1 < grid[i].length
                    if grid[i][j+1] == 1
                        curr_perim -= 1
                    end
                end
                if j - 1 >= 0
                    if grid[i][j-1] == 1
                        curr_perim -= 1
                    end
                end
            end
            p curr_perim
            perimeter += curr_perim
        end
    end
    perimeter
end