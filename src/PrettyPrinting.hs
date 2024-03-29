module PrettyPrinting
    ( Pretty
    , pretty
    ) where

import Term

class Pretty a where
  pretty :: a -> String

-- Make a term look sleek.
instance Pretty Term where
  pretty (Var name)       = name
  pretty (Comb name [])   = name
  pretty (Comb name list) = name ++ " " ++ prettyList list
   where
    prettyHelper :: Term -> String
    prettyHelper (Var  varName)       = varName
    prettyHelper (Comb varName [])    = varName
    prettyHelper (Comb combName args) =
      "(" ++ combName ++ " " ++ prettyList args ++ ")"
    prettyList :: [Term] -> String
    prettyList args = unwords (map prettyHelper args)
