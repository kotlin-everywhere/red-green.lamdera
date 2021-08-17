module Frontend exposing (..)

import Browser exposing (UrlRequest(..))
import Browser.Navigation
import Html exposing (text)
import Lamdera
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
    ( {}, Cmd.none )


update : Types.FrontendMsg -> Types.FrontendModel -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
update msg model =
    case msg of
        Types.NoOp ->
            ( model, Cmd.none )


updateFromBackend : Types.ToFrontend -> Types.FrontendModel -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
updateFromBackend msg model =
    case msg of
        Types.TfNoOp ->
            ( model, Cmd.none )


view : Types.FrontendModel -> Browser.Document Types.FrontendMsg
view _ =
    { title = "", body = [ text "Hello, Lamdera!" ] }
