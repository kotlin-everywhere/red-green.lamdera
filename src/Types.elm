module Types exposing (..)

import Lamdera exposing (ClientId, SessionId)


type alias FrontendModel =
    { counter : Int }


type alias BackendModel =
    { counter : Int }


type FrontendMsg
    = Inc
    | NoOp


type ToBackend
    = TbInc


type BackendMsg
    = NewClient ClientId


type ToFrontend
    = TfNewCounter Int
