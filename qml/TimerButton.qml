import QtQuick 2.14
import QtQuick.Controls 2.14

Button {
    id: control

    property bool started: false

    text: started ? qsTr("STOP") : qsTr("START")

    background: Rectangle {
        id: buttonBackground
        color: "#41cd52"
        radius: 6
        opacity: enabled ? 1 : 0.3
        border.width: 1
        border.color: "#21be2b"
    }

    contentItem: Text {
        id: textItem
        text: control.text

        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    onClicked: {
        startPressed()
        started = !started
    }

    states: [
        State {
            name: "normal"
            when: !control.down
            PropertyChanges {
                target: buttonBackground
            }
        },
        State {
            name: "down"
            when: control.down
            PropertyChanges {
                target: textItem
                color: "black"
            }
            PropertyChanges {
                target: buttonBackground
                color: "#a2a2a2"
                border.color: "black"
            }
        }
    ]
}
