class Converter

  ### HASH OF POINTS
  # pixel is ARGB or RGB
  # def self.pixel_martrix_to_hash_of_points(matrix)
  #
  # end

  # one number is a point
  def self.martix_to_hash_of_points(matrix)

    result_hash = {}

    matrix.length.times{|row_number|

      result_hash[row_number] = {}
      matrix[row_number].length.times{ |position_in_row|
        result_hash[row_number][position_in_row] = matrix[row_number][position_in_row]
      }
    }

    result_hash

  end

end