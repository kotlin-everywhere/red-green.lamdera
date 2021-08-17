module Pages.Home_ exposing (view)

import Gen.Route as Route
import Html exposing (a, br, h1, text)
import Html.Attributes exposing (href)
import Layout exposing (layout)
import View exposing (View)


view : View msg
view =
    layout
        [ h1 [] [ text "Home" ]
        , br [] []
        , a [ href (Route.toHref Route.AboutUs) ] [ text "Let go to AboutUs" ]
        ]
