module Frontend exposing (..)

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Html exposing (br, button, text)
import Html.Events exposing (onClick)
import Lamdera exposing (sendToBackend)
import Types exposing (..)
import Url


type alias Model =
    FrontendModel



-- lamdera entry point
--noinspection ElmUnusedSymbol


app =
    Lamdera.frontend
        { init = init
        , onUrlRequest = always NoOp
        , onUrlChange = always NoOp
        , update = update
        , updateFromBackend = updateFromBackend
        , subscriptions = \m -> Sub.none
        , view = view
        }


init : Url.Url -> Nav.Key -> ( Model, Cmd FrontendMsg )
init _ _ =
    ( { counter = 0 }, Cmd.none )


update : FrontendMsg -> Model -> ( Model, Cmd FrontendMsg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        Inc ->
            ( model, sendToBackend TbInc )


updateFromBackend : ToFrontend -> Model -> ( Model, Cmd FrontendMsg )
updateFromBackend msg model =
    case msg of
        TfNewCounter counter ->
            ( { model | counter = counter }, Cmd.none )


view : Model -> Browser.Document FrontendMsg
view model =
    { title = ""
    , body =
        [ text ("counter = " ++ String.fromInt model.counter)
        , br [] []
        , button [ onClick Inc ] [ text "Increment" ]
        ]
    }
