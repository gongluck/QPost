import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QPost")
    color: "black"

    signal postrequest(string uri, string header, string body);

    Column {
        anchors.fill: parent
        spacing: 5

        Rectangle {
            width: parent.width
            height: parent.height/15
            color: "yellow"

            Text {
                id: texturi
                text: "URI:"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            TextInput {
                id: uri
                text: "please in put uri"
                cursorVisible: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: texturi.right
                anchors.right: post.left
            }
            Button {
                id: post
                text: "Post"
                width: 50
                height: parent.height
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    console.log("Post clicked ", uri.text, header.text, body.text);
                    postrequest(uri.text, header.text, body.text)
                }
            }
        }

        Rectangle {
            width: parent.width
            height: parent.height/5
            color: "green"

            Text {
                id: textheader
                text: "header:"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            ScrollView {
                height: parent.height
                width: parent.width - textheader.width
                anchors.left: textheader.right
                anchors.verticalCenter: parent.verticalCenter
                TextArea {
                    id: header
                    text: "please input header"
                }
            }
        }

        Rectangle {
            width: parent.width
            height: parent.height/4
            color: "blue"
            Text {
                id: textbody
                text: "body:"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            ScrollView {
                width: parent.width - textbody.width
                height: parent.height
                anchors.left: textbody.right
                anchors.verticalCenter: parent.verticalCenter
                TextArea {
                    id: body
                    text: "please input body"
                }
            }
        }

        Rectangle {
            width: parent.width
            height: parent.height/5
            color: "grey"
            Text {
                id: textreponseheader
                text: "reponse header:"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            ScrollView {
                width: parent.width - textreponseheader.width
                height: parent.height
                anchors.left: textreponseheader.right
                anchors.verticalCenter: parent.verticalCenter
                TextArea {
                    readOnly: true
                    text: "the reponseheader"
                }
            }
        }

        Rectangle {
            width: parent.width
            height: parent.height/4
            color: "red"
            Text {
                id: textreponse
                text: "reponse:"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            ScrollView {
                width: parent.width - textreponse.width
                height: parent.height
                anchors.left: textreponse.right
                anchors.verticalCenter: parent.verticalCenter
                TextArea {
                    readOnly: true
                    text: "the reponse"
                }
            }
        }
    }
}
