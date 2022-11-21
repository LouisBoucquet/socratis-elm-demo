module Main exposing (..)

import Browser
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onClick, onInput)
import Html exposing (Html, button, div, h1, input, text)

type Msg = IncrementCount | UpdateInput String | AddToNumber

type alias Model =
    {
        count: Int,
        input: String
    }

init : Model
init =
    {
        count = 0,
        input = ""
    }

update : Msg -> Model -> Model
update msg model =
    case msg of
        IncrementCount ->
            {
                count = model.count + 1,
                input = model.input
            }
        UpdateInput string ->
            {
                count = model.count,
                input = string
            }
        AddToNumber ->
            {
                input = "",
                count =
                    case String.toInt model.input of
                        Just val -> val + model.count
                        Nothing -> model.count
            }


view : Model -> Html Msg
view model =
    h1 []
        [
            text ("Hello world!" ++ String.fromInt(model.count)),
            button [onClick IncrementCount] [text "Increment"],
            input [placeholder "Text to reverse", value model.input, onInput UpdateInput] [],
            button [onClick AddToNumber] [text "add to number"]
        ]

main = Browser.sandbox { init = init, update = update, view = view }
