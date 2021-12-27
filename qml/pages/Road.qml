import QtQuick 2.0

Rectangle {
    width: parent.width
    height: parent.height
    color: "Green"

    Rectangle {
        width: parent.width / 1.5
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        color: "Grey"
    }
}
