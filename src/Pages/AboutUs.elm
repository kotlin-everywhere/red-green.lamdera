module Pages.AboutUs exposing (view)

import Element exposing (centerX, centerY, column, link, spacing, text)
import Gen.Route as Route
import Layout exposing (layout)
import View exposing (View)


view : View msg
view =
    layout <|
        column [ spacing 30, centerX, centerY ]
            [ text "AboutUs"
            , link []
                { url = Route.toHref Route.Home_
                , label = text "Back to Home"
                }
            ]
