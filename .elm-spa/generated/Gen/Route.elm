module Gen.Route exposing
    ( Route(..)
    , fromUrl
    , toHref
    )

import Gen.Params.AboutUs
import Gen.Params.Home_
import Gen.Params.NotFound
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = AboutUs
    | Home_
    | NotFound


fromUrl : Url -> Route
fromUrl =
    Parser.parse (Parser.oneOf routes) >> Maybe.withDefault NotFound


routes : List (Parser (Route -> a) a)
routes =
    [ Parser.map Home_ Gen.Params.Home_.parser
    , Parser.map AboutUs Gen.Params.AboutUs.parser
    , Parser.map NotFound Gen.Params.NotFound.parser
    ]


toHref : Route -> String
toHref route =
    let
        joinAsHref : List String -> String
        joinAsHref segments =
            "/" ++ String.join "/" segments
    in
    case route of
        AboutUs ->
            joinAsHref [ "about-us" ]
    
        Home_ ->
            joinAsHref []
    
        NotFound ->
            joinAsHref [ "not-found" ]

