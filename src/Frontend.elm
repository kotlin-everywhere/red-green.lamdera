module Frontend exposing (..)

import Browser exposing (UrlRequest(..))
import Browser.Navigation
import Html exposing (br, button, text)
import Html.Events exposing (onClick)
import Lamdera exposing (sendToBackend)
import Types
import Url exposing (Url)



-- lamdera entry point
--noinspection ElmUnusedSymbol


app :
    { init : Url -> Browser.Navigation.Key -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
    , view : Types.FrontendModel -> Browser.Document Types.FrontendMsg
    , update : Types.FrontendMsg -> Types.FrontendModel -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
    , updateFromBackend : Types.ToFrontend -> Types.FrontendModel -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
    , subscriptions : Types.FrontendModel -> Sub Types.FrontendMsg
    , onUrlRequest : Browser.UrlRequest -> Types.FrontendMsg
    , onUrlChange : Url.Url -> Types.FrontendMsg
    }
app =
    Lamdera.frontend
        { init = init
        , onUrlRequest = always Types.NoOp
        , onUrlChange = always Types.NoOp
        , update = update
        , updateFromBackend = updateFromBackend
        , subscriptions = \m -> Sub.none
        , view = view
        }


init : Url.Url -> Browser.Navigation.Key -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
init _ _ =
    ( { counter = 0 }, Cmd.none )


update : Types.FrontendMsg -> Types.FrontendModel -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
update msg model =
    case msg of
        Types.NoOp ->
            ( model, Cmd.none )

        Types.Inc ->
            ( model, sendToBackend Types.TbInc )


updateFromBackend : Types.ToFrontend -> Types.FrontendModel -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
updateFromBackend msg model =
    case msg of
        Types.TfNewCounter counter ->
            ( { model | counter = counter }, Cmd.none )


view : Types.FrontendModel -> Browser.Document Types.FrontendMsg
view model =
    { title = ""
    , body =
        [ text ("counter = " ++ String.fromInt model.counter)
        , br [] []
        , button [ onClick Types.Inc ] [ text "Increment" ]
        ]
    }
