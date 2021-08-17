module Backend exposing (..)

import Lamdera exposing (ClientId, SessionId, onConnect, sendToFrontend)
import Shared
import Types exposing (..)


type alias Model =
    BackendModel



-- lamdera backend entry point
--noinspection ElmUnusedSymbol


app =
    Lamdera.backend
        { init = init
        , update = update
        , updateFromFrontend = updateFromFrontend
        , subscriptions = subscriptions
        }


init : ( Model, Cmd BackendMsg )
init =
    ( {}
    , Cmd.none
    )


update : BackendMsg -> Model -> ( Model, Cmd BackendMsg )
update msg model =
    case msg of
        BeNoOp ->
            ( model, Cmd.none )

        BeNewClient clientId ->
            ( model, sendToFrontend clientId (TfShared Shared.TfConnected) )


updateFromFrontend : SessionId -> ClientId -> ToBackend -> Model -> ( Model, Cmd BackendMsg )
updateFromFrontend _ _ msg model =
    case msg of
        TbNoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub BackendMsg
subscriptions _ =
    onConnect (always BeNewClient)
