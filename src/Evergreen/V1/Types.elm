module Evergreen.V1.Types exposing (..)

import Evergreen.V1.SpaMain


type alias FrontendModel =
    { main : Evergreen.V1.SpaMain.Model
    }


type alias BackendModel =
    {}


type FrontendMsg
    = MainMsg Evergreen.V1.SpaMain.Msg


type ToBackend
    = TbNoOp


type BackendMsg
    = BeNoOp


type ToFrontend
    = TfNoOp
