module Frontend exposing (..)

import Browser exposing (UrlRequest(..))
import Browser.Navigation
import Html
import Json.Encode
import Lamdera
import Main
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
        , onUrlRequest = Types.MainMsg << Main.ClickedLink
        , onUrlChange = Types.MainMsg << Main.ChangedUrl
        , update = update
        , updateFromBackend = updateFromBackend
        , subscriptions = subscriptions
        , view = view
        }


init : Url.Url -> Browser.Navigation.Key -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
init url key =
    wrapMain (Main.init Json.Encode.null url key)


update : Types.FrontendMsg -> Types.FrontendModel -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
update msg model =
    case msg of
        Types.MainMsg mainMsg ->
            wrapMain (Main.update mainMsg model.main)


wrapMain : ( Main.Model, Cmd Main.Msg ) -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
wrapMain ( model, cmd ) =
    ( { main = model }, Cmd.map Types.MainMsg cmd )


updateFromBackend : Types.ToFrontend -> Types.FrontendModel -> ( Types.FrontendModel, Cmd Types.FrontendMsg )
updateFromBackend msg model =
    case msg of
        Types.TfNoOp ->
            ( model, Cmd.none )


view : Types.FrontendModel -> Browser.Document Types.FrontendMsg
view model =
    let
        { title, body } =
            Main.view model.main

        frontendBody =
            List.map (Html.map Types.MainMsg) body
    in
    { title = title, body = frontendBody }


subscriptions : Types.FrontendModel -> Sub Types.FrontendMsg
subscriptions model =
    Main.subscriptions model.main
        |> Sub.map Types.MainMsg
