import QtQuick
import ThemesModule

Slide {
    id: root

    property color color1: Themes.style_darkColor
    property color color2: Themes.style_brightestColor

    gradient: Gradient {
        id: myGradient
        GradientStop { position: 0.0; color: root.color1 }
        GradientStop { position: 1.0; color: root.color2 }
    }

    ParallelAnimation {
        loops: Animation.Infinite
        running: true

        SequentialAnimation {
            PropertyAnimation {
                target: myGradient.stops[0]
                property: "color"
                from: root.color1
                to: root.color2
                duration: 2000
            }
            PropertyAnimation {
                target: myGradient.stops[0]
                property: "color"
                from: root.color2
                to: root.color1
                duration: 2000
            }
        }
        SequentialAnimation {
            PropertyAnimation {
                target: myGradient.stops[1]
                property: "color"
                from: root.color2
                to: root.color1
                duration: 4000
            }
            PropertyAnimation {
                target: myGradient.stops[1]
                property: "color"
                from: root.color1
                to: root.color2
                duration: 4000
            }
        }
    }
}
