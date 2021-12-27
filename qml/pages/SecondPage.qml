import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: gameplay

    property int currentScore: 0
    property var obstaclesList: []
    property var treesList: []
    property var newObstacleSpawner: 0
    property var newTreeSpawner: 0
    property int stage: 0
    property int spawnSpeedForObstacles: 1200
    property int spawnSpeedForTrees: 600
    property int obstacleMoveSpeed: 3000
    property int treeMoveSpeed: 3500
    property int elapsedTime: 0
    property int carXVelocity: 0

    function obstaclesListPop() {
        obstaclesList.pop()
    }

    function treesListPop() {
        treesList.pop()
    }

    function getRandomInt(min, max) {
        return Math.random() * (max - min + 1) + min
    }

    function newGame() {
        if (newObstacleSpawner !== 0)
            newObstacleSpawner.destroy()
        if (newTreeSpawner !== 0)
            newTreeSpawner.destroy()
        for (var i = 0; i < obstaclesList.length; i++)
            obstaclesList[i].destroy()
        obstaclesList = []
        for (i = 0; i < treesList.length; i++)
            treesList[i].destroy()
        treesList = []
        carMoving.stop()
        carXVelocity = 0
        stage = 0
        spawnSpeedForObstacles = 1200
        spawnSpeedForTrees = 600
        obstacleMoveSpeed = 3000
        treeMoveSpeed = 3500
        elapsedTime = 0
        currentScore = 0
        car.imageNumber = getRandomInt(1, 6)
        car.x = parent.width / 2 - width
        car.y = parent.height - height - 40
        carMoving.restart()
        createObstacleSpawner()
        createTreeSpawner()
        speedBooster.restart()
        car.focus = true
    }

    function gameOver() {
        car.focus = false
        carXVelocity = 0
        for (var i = 0; i < obstaclesList.length; i++)
            obstaclesList[i].stopAnimation()
        for (i = 0; i < treesList.length; i++)
            treesList[i].stopAnimation()
        carMoving.stop()
        speedBooster.stop()
        newObstacleSpawner.stop()
        newTreeSpawner.stop()
    }

    function createObstacle() {
        var component = Qt.createComponent("Obstacle.qml")
        if (component.status === Component.Ready) {
            var newObstacle = component.createObject(road, {"x": getRandomInt(50, 250),
                                                         "y": -40,
                                                         "moveSpeed": obstacleMoveSpeed,
                                                         "imageNumber": getRandomInt(1, 4)})
            obstaclesList.unshift(newObstacle)
        }
    }

    function createTree() {
        var component = Qt.createComponent("Tree.qml")
        if (component.status === Component.Ready) {
            var newX
            var side = getRandomInt(1, 2)
            if (side == 1)
                newX = getRandomInt(-10, 50)
            else if (side == 2)
                newX = getRandomInt(260, 300)
            var newTree = component.createObject(road, {"x": newX,
                                                     "y": -120,
                                                     "moveSpeed": treeMoveSpeed,
                                                     "imageNumber": helper.randomTreeImage()})
            treesList.unshift(newTree)
        }
    }

    function createObstacleSpawner() {
        var component = Qt.createComponent("obstacleSpawner.qml")
        if (component.status === Component.Ready) {
            newObstacleSpawner = component.createObject(road, {"spawnSpeed": spawnSpeedForObstacles})
        }

    }

    function createTreeSpawner() {
        var component = Qt.createComponent("treeSpawner.qml")
        if (component.status === Component.Ready) {
            newTreeSpawner = component.createObject(road, {"spawnSpeed": spawnSpeedForTrees})
        }
    }

    Road {
        id: road

        Timer {
            id: speedBooster
            interval: 5000
            running: false
            repeat: true
            onTriggered: {
                stage += 1
                newObstacleSpawner.destroy()
                newTreeSpawner.destroy()
                spawnSpeedForObstacles -= 130
                spawnSpeedForTrees -= 50
                obstacleMoveSpeed -= 300
                treeMoveSpeed -= 350
                createObstacleSpawner()
                createTreeSpawner()
                elapsedTime += 10
                if (elapsedTime == 60)
                    speedBooster.stop()
            }
        }

        Car {
            id: car
            imageNumber: getRandomInt(1, 6)

            Timer {
                id: carMoving
                interval: 5
                triggeredOnStart: true
                running: true
                repeat: true
                onTriggered: {
                    if (car.x > ((parent.width - parent.width / 1.5) / 2 + parent.width / 1.5))
                        car.x = (parent.width - parent.width / 1.5) / 2 + parent.width / 1.5
                    if (car.x < (parent.width - parent.width / 1.5) / 2)
                        car.x = (parent.width - parent.width / 1.5) / 2
                    if (car.x <= ((parent.width - parent.width / 1.5) / 2 + parent.width / 1.5)
                            && car.x >= (parent.width - parent.width / 1.5) / 2)
                        car.x += carXVelocity
                }
            }
        }
    }

    Button {
            text: qsTr("<=")
            height: 200
            width: 120
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            onClicked: carXVelocity -= 3
    }
    Button {
            text: qsTr("=>")
            height: 200
            width: 120
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            onClicked: carXVelocity += 3
    }

    Button {
            text: qsTr("Restart")
            height: 60
            width: 150
            anchors.right: parent.right
            anchors.top: parent.top
            onClicked: newGame()
    }

    Label {
        x: Theme.horizontalPageMargin
        anchors.bottom: parent.bottom
        color: "Orange"
        font.pixelSize: Theme.fontSizeMedium
        text: "Your score: " + gameplay.currentScore
    }
}
