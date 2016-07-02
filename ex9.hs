import Data.Ord
import Data.List

matrix =
  [ [1,2,3,4]
  , [11,12,13,14]
  , [7,8,9,10]
  , [4,5,6,7]
  ]

main = do
  print matrix

  print $ map snd $
    sortBy (comparing fst) $
      (<$> matrix) $ \row ->
        (minimum row, row)
