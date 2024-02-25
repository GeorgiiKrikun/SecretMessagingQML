import QtQuick 2.15
import QtQuick.Controls 2.15
import qmlfe
import backend

Rectangle {
    id: rectangle2
    // width: Constants.width
    // height: Constants.height
    // anchors.centerIn: parent
    // anchors.fill: parent


    EncodeHandler {
        id: encodeHandler
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

    Button {
        id: button
        anchors.left: secret.right
        anchors.leftMargin: 10
        width: 100
        anchors.verticalCenter: secret.verticalCenter
        text: qsTr(">>")
        onPressed: {
            result.text = encodeHandler.decode(secret.text);
        }
    }

    Button {
        text: "Paste"
        width: 100
        anchors.right: secret.left
        anchors.rightMargin: 10
        anchors.verticalCenter: secret.verticalCenter
        onPressed: {
            secret.text = encodeHandler.paste();
        }
    }


}

