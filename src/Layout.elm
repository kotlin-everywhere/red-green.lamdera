module Layout exposing (layout)

import Html exposing (Html)
import View exposing (View)


layout : List (Html a) -> View a
layout nodes =
    { title = "The Red-Green Game", body = nodes }
