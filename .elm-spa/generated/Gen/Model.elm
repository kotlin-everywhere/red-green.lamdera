module Gen.Model exposing (Model(..))

import Gen.Params.AboutUs
import Gen.Params.Home_
import Gen.Params.NotFound
import Pages.AboutUs
import Pages.Home_
import Pages.NotFound


type Model
    = Redirecting_
    | AboutUs Gen.Params.AboutUs.Params
    | Home_ Gen.Params.Home_.Params
    | NotFound Gen.Params.NotFound.Params

