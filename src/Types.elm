module Types exposing (..)

import Main


type alias FrontendModel =
    { main : Main.Model }


type alias BackendModel =
    {}


type FrontendMsg
    = MainMsg Main.Msg


type ToBackend
    = TbNoOp


type BackendMsg
    = BeNoOp


type ToFrontend
    = TfNoOp
