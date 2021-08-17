module Layout exposing (layout, nexonLv1GothicLight, nexonLv1GothicRegular)

import Element exposing (Attribute, Element)
import Element.Font as Font
import Html exposing (node, text)
import View exposing (View)


layout : Element msg -> View msg
layout element =
    { title = "The Red-Green Game"
    , body =
        [ node "style" [] [ text style ]
        , Element.layout [] element
        ]
    }


style : String
style =
    """
@font-face {
    font-family: 'NEXON Lv1 Gothic OTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'NEXON Lv1 Gothic OTF Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
"""



-- https://noonnu.cc/font_page/432


nexonLv1GothicRegular : Attribute msg
nexonLv1GothicRegular =
    Font.family [ Font.typeface "NEXON Lv1 Gothic OTF", Font.sansSerif ]


nexonLv1GothicLight : Attribute msg
nexonLv1GothicLight =
    Font.family [ Font.typeface "NEXON Lv1 Gothic OTF Light", Font.sansSerif ]
