module Backend exposing (..)

import Lamdera exposing (ClientId, SessionId, broadcast, onConnect, sendToFrontend)
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
    ( { counter = 0 }
    , Cmd.none
    )


update : BackendMsg -> Model -> ( Model, Cmd BackendMsg )
update msg model =
    case msg of
        NewClient clientId ->
            ( model, sendToFrontend clientId (TfNewCounter model.counter) )


updateFromFrontend : SessionId -> ClientId -> ToBackend -> Model -> ( Model, Cmd BackendMsg )
updateFromFrontend _ _ msg model =
    case msg of
        TbInc ->
            let
                newCounter =
                    model.counter + 1
            in
            ( { model | counter = newCounter }, broadcast (TfNewCounter newCounter) )


subscriptions : Model -> Sub BackendMsg
subscriptions _ =
    onConnect (\_ -> NewClient)
