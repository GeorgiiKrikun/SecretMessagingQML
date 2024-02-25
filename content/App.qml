// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls 6.2
import qmlfe

Window {
    visibility: Window.Maximized
    visible: true
    title: "qmlfe"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: encrypt
    }
    Component {
        id: encrypt
        Screen01 {
            id: mainScreen
        }
    }
    Component {
        id: decrypt
        Screen02 {
            id: secondScreen
        }
    }

    Switch {
        id: switchEncryptDecrypt
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 10
        text: qsTr("Encrypt")
        onPressed: {
            if (switchEncryptDecrypt.checked) {
                switchEncryptDecrypt.text = "Encrypt"
                stackView.push(encrypt)
            } else {
                switchEncryptDecrypt.text = "Decrypt"
                stackView.push(decrypt)
            }
        }
    }

}

