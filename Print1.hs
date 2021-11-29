module Print1 where
import Text.Read ( readMaybe )

main :: IO ()
main = do
  putStrLn "Hello"

interactiveSumming :: IO ()
interactiveSumming = do
  putStrLn "choose two numbers"
  mx <- readMaybe <$> getLine
  my <- readMaybe <$> getLine
  case (+) <$> mx <*> my of
    Just s -> putStrLn("sum is " <> show s)
    Nothing -> do
      putStrLn "retrying"
      interactiveSumming