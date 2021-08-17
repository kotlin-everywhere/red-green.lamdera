module Shared exposing
    ( Connection(..)
    , Flags
    , Model
    , Msg
    , ToFrontend(..)
    , init
    , subscriptions
    , update
    , updateFromBackend
    )

import Json.Decode as Json
import Request exposing (Request)


type alias Flags =
    Json.Value


type alias Model =
    { connection : Connection }


type Connection
    = Online
    | Offline


type Msg
    = NoOp


type ToFrontend
    = TfNoOp
    | TfConnected


init : Request -> Flags -> ( Model, Cmd Msg )
init _ _ =
    ( { connection = Offline }, Cmd.none )


update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


updateFromBackend : ToFrontend -> Model -> ( Model, Cmd Msg )
updateFromBackend msg model =
    case msg of
        TfNoOp ->
            ( model, Cmd.none )

        TfConnected ->
            ( { model | connection = Online }, Cmd.none )
