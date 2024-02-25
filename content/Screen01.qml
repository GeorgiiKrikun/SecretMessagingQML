import QtQuick 6.2
import QtQuick.Controls 6.2
import qmlfe
import backend



Rectangle {
    id: rectangle
    // width: Constants.width
    // height: Constants.height
    // anchors.fill: parent
    // anchors.centerIn: parent

    EncodeHandler {
        id: encodeHandler
    }



    TextField {
        id: message
        placeholderText: qsTr("Enter your message here")
        width: Math.max(parent.width / 2, 300)
        anchors.horizontalCenter: parent.horizontalCenter
        height: 50
        wrapMode: Text.WordWrap
        passwordCharacter: ""
        hoverEnabled: false
        anchors.bottom: secret.top
        anchors.bottomMargin: 10
    }
    TextField {
        id: secret
        placeholderText: qsTr("Enter your secret here")
        width: Math.max(parent.width / 2, 300)
        height: 50
        anchors.topMargin: 10
        anchors.bottomMargin: 0
        wrapMode: Text.WordWrap
        anchors.horizontalCenterOffset: 0
        hoverEnabled: false
        anchors.bottom: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Connections {
            target: checkBox
            onCheckedChanged: {
                if (checkBox.checked) {
                    secret.echoMode = TextInput.Password
                } else {
                    secret.echoMode = TextInput.Normal
                }
            }
        }
    }

    TextField {
        id: result
        placeholderText: qsTr("The result will be here")
        width: Math.max(parent.width / 2, 300)
        height: 50
        wrapMode: Text.WordWrap
        readOnly: true
        passwordCharacter: ""
        hoverEnabled: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: secret.bottom
        anchors.topMargin: 10

    }

    CheckBox {
        id: checkBox
        anchors.right: secret.left
        padding: 0
        checked: false
        anchors.verticalCenter: secret.verticalCenter
        checkable: true
        display: AbstractButton.TextUnderIcon
        text: qsTr("Hide")
    }

    Button {
        id: button
        width: 100
        anchors.left: secret.right
        anchors.leftMargin: 10
        anchors.verticalCenter: secret.verticalCenter
        text: qsTr(">>")
        onPressed: {
            result.text = encodeHandler.encode(message.text, secret.text);
        }
    }

    Button {
        text: "Copy"
        width: 100
        anchors.left: result.right
        anchors.leftMargin: 10
        anchors.verticalCenter: result.verticalCenter
        onPressed: {
            encodeHandler.copy(result.text);
        }
    }


}



