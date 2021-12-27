import QtQuick 2.0

Rectangle {
    id: obstacle
    width: 40
    height: 40
    color: "Transparent"

    property int moveSpeed: 3000
    property int imageNumber: 0

    function intersection(right1, right2, left1, left2)
    {
        if (right1 < left2 || right2 < left1)
            return false;

        return true;
    }

    function stopAnimation() {
        obstacleAnimation.stop()
    }

    Image {
        source: "/ObstacleImages/" + imageNumber + ".png"
        anchors.fill: parent
    }

    NumberAnimation on y {
        id: obstacleAnimation
        from: y
        to: parent.height + 40
        duration: moveSpeed
        running: true
    }

    onYChanged: {
        if ((obstacle.y >= 570) && (obstacle.y <= 650))
            if (intersection(car.x + car.width, obstacle.x + obstacle.width, car.x, obstacle.x))
                gameOver()

        if (obstacle.y >= parent.height + 40) {
            obstaclesListPop()
            obstacle.destroy()
            currentScore += 1
        }
    }
}
