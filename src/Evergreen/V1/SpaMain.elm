module Evergreen.V1.SpaMain exposing (..)

import Browser
import Browser.Navigation
import Evergreen.V1.Gen.Pages
import Evergreen.V1.Shared
import Url


type alias Model =
    { url : Url.Url
    , key : Browser.Navigation.Key
    , shared : Evergreen.V1.Shared.Model
    , page : Evergreen.V1.Gen.Pages.Model
    }


type Msg
    = ChangedUrl Url.Url
    | ClickedLink Browser.UrlRequest
    | Shared Evergreen.V1.Shared.Msg
    | Page Evergreen.V1.Gen.Pages.Msg
