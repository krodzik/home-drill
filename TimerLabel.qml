import QtQuick 2.14

Rectangle {
    property alias text: textId.text

    Text {
        id: textId

        text: "2:00"
        anchors.centerIn: parent
    }
}
