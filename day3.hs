data Direction
    = DRight
    | DUp
    | DLeft
    | DDown
    deriving (Eq, Show)

data State = State
    { limit :: Int
    , dir :: Direction
    , num :: Int
    , x :: Int
    , y :: Int
    } deriving (Show)

nextState :: State -> State
nextState s
    | dir s == DRight =
        let s' = s { x = x s + 1, num = num s + 1 }
        in if x s' > limit s then s' { limit = limit s + 1, dir = DUp } else s'
    | dir s == DUp =
        let s' = s { y = y s - 1, num = num s + 1 }
        in if y s' <= -(limit s) then s' { dir = DLeft } else s'
    | dir s == DLeft =
        let s' = s { x = x s - 1, num = num s + 1 }
        in if x s' <= -(limit s) then s' { dir = DDown } else s'
    | dir s == DDown =
        let s' = s { y = y s + 1, num = num s + 1 }
        in if y s' >= limit s then s' { dir = DRight } else s'

allStates :: [State]
allStates = iterate nextState initialState
    where initialState = State { limit = 0, dir = DRight, num = 1, x = 0, y = 0 }

main = putStrLn $ show result
    where search = 312051
          state = head $ filter (\state -> num state == search) allStates
          result = abs (x state) + abs (y state)
