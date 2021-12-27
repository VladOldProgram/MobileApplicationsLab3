import QtQuick 2.0

Timer {
    property int spawnSpeed: 1000

    interval: spawnSpeed
    running: true
    repeat: true
    onTriggered: {
        createObstacle()
    }
}
