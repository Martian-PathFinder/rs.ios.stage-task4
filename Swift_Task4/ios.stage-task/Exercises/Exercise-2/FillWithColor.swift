import Foundation

final class FillWithColor {
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {
        
        let m = image.count
        let n = image.first?.count ?? 0
        
        if (m == 0 || row >= m || column >= image[0].count || row < 0 || column < 0) {
            return image
        }
        
        if (m >= 50 && m < 0 && n >= 50 && n <= 1 && newColor <= 0 && newColor > 65536) {
            return image
        }
     
        var image = image
        let color = image[row][column]
        
        recursiveFill(&image, row, column, color, newColor)
        return image
        
    }

    fileprivate func recursiveFill(_ image: inout [[Int]], _ row: Int, _ column: Int, _ color: Int, _ newColor: Int) {
          if row >= image.count ||  column >= image[0].count || row < 0 || column < 0 || image[row][column] != color || image[row][column] == newColor {
              return
          }

          image[row][column] = newColor

          recursiveFill(&image, row - 1, column, color, newColor)
          recursiveFill(&image, row + 1, column, color, newColor)
          recursiveFill(&image, row, column - 1, color, newColor)
          recursiveFill(&image, row, column + 1, color, newColor)
      }
}
