module Evergreen.V1.Gen.Model exposing (..)

import Evergreen.V1.Gen.Params.AboutUs
import Evergreen.V1.Gen.Params.Home_
import Evergreen.V1.Gen.Params.NotFound


type Model
    = Redirecting_
    | AboutUs Evergreen.V1.Gen.Params.AboutUs.Params
    | Home_ Evergreen.V1.Gen.Params.Home_.Params
    | NotFound Evergreen.V1.Gen.Params.NotFound.Params
