import QtQuick
import ThemesModule
import "../components" as Components

Components.ImageSlide {
    id: root

    property color color1: "pink"
    property color color2: Themes.style_themeColor
    property color color3: Themes.style_brightestColor

    pageNb: 18
    imageSrc: "qrc:/images/chameleon1.png"
    animate: true

    gradient: Gradient {
        id: myGradient
        GradientStop { position: 0.0; color: root.color1 }
        GradientStop { position: 0.33; color: root.color2 }
        GradientStop { position: 1.0; color: root.color3 }
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
                duration: 500
            }
            PropertyAnimation {
                target: myGradient.stops[0]
                property: "color"
                from: root.color2
                to: root.color1
                duration: 500
            }
        }
        SequentialAnimation {
            PropertyAnimation {
                target: myGradient.stops[1]
                property: "color"
                from: root.color3
                to: root.color1
                duration: 1500
            }
            PropertyAnimation {
                target: myGradient.stops[1]
                property: "color"
                from: root.color1
                to: root.color3
                duration: 1500
            }
        }
        SequentialAnimation {
            PropertyAnimation {
                target: myGradient.stops[2]
                property: "color"
                from: root.color2
                to: root.color3
                duration: 1000
            }
            PropertyAnimation {
                target: myGradient.stops[2]
                property: "color"
                from: root.color3
                to: root.color2
                duration: 1000
            }
        }
    }
}
