import QtQuick
import "../components" as Components

Components.TextSlide {
    id: root

    title: "Screen and DPI*"
    pageNb: 11
    contents: [
        {
            main: "Using the <b>Screen</b> object provided by Qt, You can retrieve information like",
            sub: [
                "screen's width",
                "screen's height",
                "screen's DPI (*Dot Per Inch)"
            ]
        }
    ]
}
