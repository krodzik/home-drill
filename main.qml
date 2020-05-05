import QtQuick 2.14
import QtQuick.Window 2.14

Window {
    id: window
    visible: true
    width: 640
    height: 480
    color: "#efeaea"
    title: qsTr("Home Drill")

    // property aliases
    property alias displayTimerText: timer.text

    // signals
    signal startPressed()

    Training {
        id: training
        width: parent.width
        height: parent.height * 0.7
        anchors.top: parent.top
    }

    TimerLabel {
        id: timer
        width: parent.width * 0.7
        height: parent.height * 0.3
        anchors.left: parent.left
        anchors.bottom: parent.bottom
    }

    TimerButton {
        id: startButton
        width: parent.width * 0.3
        height: parent.height * 0.3
        anchors.left: timer.right
        anchors.bottom: parent.bottom
    }
}
