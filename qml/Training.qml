import QtQuick 2.14

Item {
    Image {
        id: currentExerciseImage
        width: parent.width * 0.5
        height: parent.height
        anchors.top: parent.top
        anchors.left: parent.left
        source: "qrc:/qtquickplugin/images/template_image.png"
        fillMode: Image.PreserveAspectFit
    }

    Item {
        id: exerciseName
        width: parent.width * 0.2
        height: parent.height * 0.5
        anchors.top: parent.top
        anchors.left: currentExerciseImage.right

        Text {
            text: qsTr("A4")
            font.pixelSize: 12
            anchors.centerIn: parent
        }
    }

    ListView {
        id: previousTrainingReps
        width: parent.width * 0.2
        height: parent.height * 0.2
        anchors.top: exerciseName.bottom
        anchors.left: currentExerciseImage.right
        orientation: ListView.Horizontal

        model: ListModel {
            ListElement {
                reps: 10
            }

            ListElement {
                reps: 10
            }

            ListElement {
                reps: 10
            }
        }

        delegate: Rectangle {
            width: ListView.view.width / 3
            height: ListView.view.height

            color: ListView.isCurrentItem ? "#157efb" : "#53d769"
            border.color: Qt.lighter(color, 1.1)

            Text {
                anchors.centerIn: parent

                font.pixelSize: 10

                text: reps
            }
        }
    }

    ListView {
        id: currentTrainingReps
        width: parent.width * 0.2
        height: parent.height * 0.3
        anchors.top: previousTrainingReps.bottom
        anchors.left: currentExerciseImage.right
        orientation: ListView.Horizontal

        model: ListModel {
            ListElement {
                reps: 10
            }

            ListElement {
                reps: 10
            }

            ListElement {
                reps: 10
            }
        }

        delegate: Rectangle {
            width: ListView.view.width / 3
            height: ListView.view.height

            color: ListView.isCurrentItem ? "#157efb" : "#53d769"
            border.color: Qt.lighter(color, 1.1)

            Text {
                anchors.centerIn: parent

                font.pixelSize: 10

                text: reps
            }
        }
    }

    Item {
        id: nextExerciseName
        width: parent.width * 0.3
        height: parent.height * 0.25
        anchors.top: parent.top
        anchors.right: parent.right

        Text {
            anchors.centerIn: parent
            text: qsTr("Next")
            font.pixelSize: 12
        }
    }

    Image {
        id: nextExerciseImage
        width: parent.width * 0.3
        height: parent.height * 0.75
        anchors.top: nextExerciseName.bottom
        anchors.right: parent.right
        source: "qrc:/qtquickplugin/images/template_image.png"
        fillMode: Image.PreserveAspectFit
    }
}
