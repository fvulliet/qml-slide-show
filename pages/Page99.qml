import QtQuick

Item {
    id: root

    Image {
        id: delImage
        property double _ratio: 1

        height: parent.height * _ratio
        width: parent.width * _ratio
        source: "qrc:/images/marsipanpig.jpg"
        fillMode: Image.PreserveAspectFit

        SequentialAnimation {
            id: myAnim1

            loops: Animation.Infinite
            NumberAnimation {
                target: delImage
                property: "_ratio"
                from: 1; to: 0.9
                easing.type: Easing.InQuad; duration: 500
            }
            NumberAnimation {
                target: delImage
                property: "_ratio"
                from: 0.9; to: 1
                easing.type: Easing.OutQuad; duration: 1000
            }
        }

        SequentialAnimation {
            id: myAnim2

            loops: Animation.Infinite
            NumberAnimation {
                target: delImage
                property: "opacity"
                from: 1; to: 0.5
                easing.type: Easing.InQuad; duration: 250
            }
            NumberAnimation {
                target: delImage
                property: "opacity"
                from: 0.5; to: 1
                easing.type: Easing.OutQuad; duration: 500
            }
        }
    }
}
