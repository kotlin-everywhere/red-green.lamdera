module Pages.Home_ exposing (Model, Msg, page)

import Effect exposing (Effect)
import Element exposing (Element, alignBottom, centerX, centerY, column, el, fill, height, paddingEach, px, rgba255, row, spacing, text, width)
import Element.Border as Border
import Element.Font as Font
import Element.Input exposing (button)
import Gen.Params.Home_ exposing (Params)
import Layout exposing (layout, nexonLv1GothicLight, nexonLv1GothicRegular)
import Page
import Request
import Shared
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared _ =
    Page.advanced
        { init = init
        , update = update
        , view = view shared
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    {}


init : ( Model, Effect Msg )
init =
    ( {}, Effect.none )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Effect.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Shared.Model -> Model -> View Msg
view shared _ =
    layout <|
        case shared.connection of
            Shared.Offline ->
                viewSplash

            Shared.Online ->
                viewLogin


viewSplash : Element msg
viewSplash =
    column [ width fill, height fill ]
        [ el [ centerX, paddingEach { top = 263, right = 0, left = 0, bottom = 0 } ]
            logo
        , row [ alignBottom, centerX, paddingEach { top = 0, right = 0, left = 0, bottom = 42 }, spacing 18 ]
            [ text "마인케이"
            , text "kenet"
            ]
        ]


logo : Element msg
logo =
    el [ width (px 330), height (px 200), Border.color (rgba255 112 112 112 1), Border.width 1, Border.rounded 69 ] <|
        el [ centerX, centerY, nexonLv1GothicRegular, Font.color (rgba255 0 0 0 1), Font.size 45 ] <|
            text "LOGO"


viewLogin : Element Msg
viewLogin =
    column [ width fill, height fill ]
        [ el [ centerX, paddingEach { top = 145, right = 0, bottom = 0, left = 0 } ]
            logo
        , column [ alignBottom, centerX, spacing 20 ]
            [ btn "Sign Up"
            , btn "Login"
            ]
        , el
            [ centerX
            , paddingEach { top = 83, right = 0, bottom = 40, left = 0 }
            , nexonLv1GothicLight
            , Font.color (rgba255 0 0 0 1)
            , Font.size 20
            ]
          <|
            text "How to Play"
        ]


btn : String -> Element msg
btn label =
    button [ width (px 314), height (px 65), Border.color (rgba255 112 112 112 1), Border.width 1, Border.rounded 43 ]
        { onPress = Nothing
        , label = el [ centerX, centerY, nexonLv1GothicLight, Font.color (rgba255 0 0 0 1), Font.size 20 ] (text label)
        }
