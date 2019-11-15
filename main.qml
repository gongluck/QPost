import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QPost")
    color: "black"

    //signal postrequest(string uri, string header, string body);
    //signal gotreponse(string header, string body);

    function	request()
    {
        var xhr	= new XMLHttpRequest();
        function setstatustext() {
            status.text = "TIMEOUT OR ERROR ";
            status.text += xhr.status;
        }
        xhr.onreadystatechange	=	function()	{
            if	(xhr.readyState 	===	XMLHttpRequest.HEADERS_RECEIVED)	{
                status.text = "SENDED";
            }	else	if (xhr.readyState === xhr.DONE) {
                status.text = xhr.statusText;
                reponseheader.text = xhr.getAllResponseHeaders();
                reponse.text = xhr.response;
            }
        }
        xhr.ontimeout = setstatustext;
        xhr.onerror = setstatustext;

        if(body.text == "")
        {
            xhr.open("GET", uri.text);
        }
        else
        {
            xhr.open("POST",	uri.text);
        }

        if(header.text != "")
        {
            var headers = header.text;
            var words = headers.split("\n");
            for(var i = 0; i<words.length; ++i)
            {
                var ky = words[i].split(":");
                xhr.setRequestHeader(ky[0], ky[1]);
            }
        }

        if(body.text == "")
        {
            xhr.send();
        }
        else
        {
            xhr.send(body.text);
        }
    }

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
                text: "http://www.example.com"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: texturi.right
                anchors.right: post.left
                selectByMouse: true
            }
            Button {
                id: post
                text: "Post"
                width: 50
                height: parent.height
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    reponseheader.text = ""
                    reponse.text = ""
                    status.text = "READY";
                    //postrequest(uri.text, header.text, body.text);
                    request();
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
                    text: ""
                    selectByMouse: true
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
                    text: ""
                    selectByMouse: true
                }
            }
        }

        Text {
            id: status
            color: "white"
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
                    id: reponseheader
                    readOnly: true
                    text: ""
                    selectByMouse: true
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
                    id: reponse
                    readOnly: true
                    text: ""
                    selectByMouse: true
                }
            }
        }
    }
}
