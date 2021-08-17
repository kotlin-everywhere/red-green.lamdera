module Pages.AboutUs exposing (view)

import Gen.Route as Route
import Html exposing (a, br, h1, text)
import Html.Attributes exposing (href)
import Layout exposing (layout)
import View exposing (View)


view : View msg
view =
    layout
        [ h1 [] [ text "AboutUs" ]
        , br [] []
        , a [ href (Route.toHref Route.Home_) ] [ text "Back to Home" ]
        ]
