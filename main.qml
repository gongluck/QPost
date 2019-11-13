import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QPost")

    Column {
        width: parent.width
        height: parent.height
        spacing: 10
        Rectangle {
            width: parent.width
            height: 30
            color: "yellow"
            Text {
                id: texturi
                text: "URI:"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            TextInput {
                text: "please in put "
                anchors.left: texturi.right
                anchors.verticalCenter: parent.verticalCenter
            }
            Button {
                focus: true
                text: "Post"
                width: 50
                height: 30
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

            }
        }
        Rectangle {
            width: parent.width
            height: 60
            color: "green"
            Text {
                id: textheader
                text: "header:"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            TextArea {
                height: parent.height
                text: "input header "
                anchors.left: textheader.right
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        TextEdit {
            text: "body"
        }
        TextEdit {
            text: "reponse"
        }
    }
}
