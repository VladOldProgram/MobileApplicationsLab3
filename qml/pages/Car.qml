import QtQuick 2.0

Rectangle {
    width: 40
    height: 90
    x: parent.width / 2 - width
    y: parent.height - height - 40
    color: "transparent"

    property int imageNumber: 1

    Image {
        source: "/CarImages/" + imageNumber + ".png"
        anchors.fill: parent
    }
}
