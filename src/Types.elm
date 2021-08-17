module Types exposing (..)

import Lamdera exposing (ClientId)
import Shared
import SpaFrontend


type alias FrontendModel =
    { main : SpaFrontend.Model }


type alias BackendModel =
    {}


type FrontendMsg
    = MainMsg SpaFrontend.Msg


type ToBackend
    = TbNoOp


type BackendMsg
    = BeNoOp
    | BeNewClient ClientId


type ToFrontend
    = TfNoOp
    | TfShared Shared.ToFrontend
