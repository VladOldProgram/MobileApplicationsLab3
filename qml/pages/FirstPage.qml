import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Button {
        x: Theme.horizontalPageMargin
        y: parent.width / 4
        width: parent.width - 2 * x
        color: "Green"
        text: "Start game"
        onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
    }

    Button {
        x: Theme.horizontalPageMargin
        y: parent.width / 2
        width: parent.width - 2 * x
        color: "Red"
        text: "Exit"
        onClicked: Qt.quit()
    }
}
