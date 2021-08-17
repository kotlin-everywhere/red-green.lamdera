module Types exposing (..)

import SpaMain


type alias FrontendModel =
    { main : SpaMain.Model }


type alias BackendModel =
    {}


type FrontendMsg
    = MainMsg SpaMain.Msg


type ToBackend
    = TbNoOp


type BackendMsg
    = BeNoOp


type ToFrontend
    = TfNoOp
