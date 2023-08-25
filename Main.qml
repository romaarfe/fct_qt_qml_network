import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow {
    id: appWindow
    title: qsTr("Network - IP address")
    visible: true

    readonly property int margin: 11

    function clearFields() {
        connection.text = "";
        networkCard.text = "";
        configurationType.text = "";
        networkMask.text = "";
        router.text = "";
        nameserver.text = "";
        ipAddress.text = "";
        wifiSsid.text = "";
        security.text = "";
        wpaKey.text = "";
        identity.text = "";
        password.text = "";
        activeCheckBox.checked = false;
    }

    Component.onCompleted: {
        width = mainLayout.implicitWidth + 2 * margin
        height = mainLayout.implicitHeight + 2 * margin
    }

    minimumWidth: mainLayout.Layout.minimumWidth + 2 * margin
    minimumHeight: mainLayout.Layout.minimumHeight + 2 * margin

    ColumnLayout {
        id: mainLayout
        anchors.fill: parent
        anchors.margins: appWindow.margin

        RowLayout {
            Layout.fillHeight: true
            anchors.fill: parent

            GroupBox {
                id: leftBox
                title: qsTr("Connections")
                font.bold: true
                Layout.fillHeight: true
                Layout.preferredWidth: 220
                Layout.minimumHeight: Layout.minimumHeight + 50
                Layout.minimumWidth: Layout.minimumWidth + 50

                ColumnLayout {
                    anchors.fill: parent

                    ComboBox {
                        id: combo
                        font.bold: true
                        textRole: "text"
                        valueRole: "value"
                        Layout.fillWidth: true
                        implicitContentWidthPolicy: ComboBox.ContentItemImplicitWidth
                        onActivated: backend.modifier = combo.currentValue

                        model: ListModel {
                            ListElement{text: qsTr("No Internet Connection")}
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                        height: 100
                    }

                    Button {
                        id: newConnection
                        Layout.fillWidth: true
                        text: qsTr("New Connection")
                        font.bold: true
                        onClicked: {
                            clearFields();
                        }
                    }

                    Button {
                        id: eliminateConnection
                        Layout.fillWidth: true
                        text: qsTr("Eliminate")
                        font.bold: true
                        onClicked: {
                            if (combo.currentIndex !== 0) {
                                combo.model.remove(combo.currentIndex);
                            }
                        }
                    }

                    Button {
                        id: applyConnection
                        Layout.fillWidth: true
                        text: qsTr("Apply")
                        font.bold: true
                        onClicked: {
                            if (connection.text !== "") {
                                combo.model.append({text: qsTr(connection.text)});
                            }
                        }
                    }
                }
            }

            GroupBox {
                id: centerBox
                title: qsTr(" ")
                Layout.fillHeight: true
                Layout.preferredWidth: 160
                Layout.minimumHeight: Layout.minimumHeight + 50
                Layout.minimumWidth: Layout.minimumWidth + 50

                GridLayout {
                    id: centerLayout
                    rows: 14
                    flow: GridLayout.TopToBottom
                    anchors.fill: parent
                    Layout.fillWidth: true

                    Label {
                        text: qsTr("Connection")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("Network card")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("Configuration type")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("Network mask")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("Router")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("Nameserver")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("IP address")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("WiFi SSID")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("Security")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("WPA/WPA2 key")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("Identity")
                        font.bold: true
                    }

                    Label {
                        text: qsTr("Password")
                        font.bold: true
                    }

                    Item {
                        height: 5
                    }

                    RowLayout {
                        Label {
                            text: qsTr("Active")
                            font.bold: true
                            Layout.alignment: Qt.AlignLeft

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    activeCheckBox.checked = !activeCheckBox.checked
                                }
                            }
                        }

                        CheckBox {
                            id: activeCheckBox
                            scale: 1.5
                            spacing: 50
                        }
                    }
                }
            }

            GroupBox {
                id: rightBox
                title: qsTr(" ")
                Layout.fillHeight: true
                Layout.preferredWidth: 220
                Layout.minimumHeight: Layout.minimumHeight + 50
                Layout.minimumWidth: Layout.minimumWidth + 50

                GridLayout {
                    id: rightLayout
                    rows: 14
                    flow: GridLayout.TopToBottom
                    anchors.fill: parent

                    TextField {
                        id:  connection
                        text: qsTr("")
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: networkCard
                        text: qsTr("")
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: configurationType
                        text: qsTr("")
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: networkMask
                        text: qsTr("")
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: router
                        text: qsTr("")
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: nameserver
                        text: qsTr("")
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: ipAddress
                        text: qsTr("")
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: wifiSsid
                        text: qsTr("")
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: security
                        text: qsTr("")
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: wpaKey
                        text: qsTr("")
                        echoMode: TextInput.Password
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: identity
                        text: qsTr("")
                        Layout.fillWidth: true
                    }

                    TextField {
                        id: password
                        text: qsTr("")
                        echoMode: TextInput.Password
                        Layout.fillWidth: true
                    }

                    Button {
                        id: setupWpa
                        Layout.fillWidth: true
                        text: qsTr("Setup WPA auto")
                        font.bold: true
                        onClicked: stackLayout.advance()
                    }

                    Button {
                        id: otherIp
                        Layout.fillWidth: true
                        text: qsTr("Other IP's")
                        font.bold: true
                        onClicked: stackLayout.advance()
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

            GroupBox {
                id: bottomBox
                Layout.fillWidth: true
                Layout.minimumHeight: Layout.minimumHeight + 50
                Layout.minimumWidth: Layout.minimumWidth + 50
                Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter

                GridLayout {
                    id: bottomLayout
                    rows: 1
                    flow: GridLayout.LeftToRight
                    anchors.fill: parent
                    Layout.fillWidth: true

                    Button {
                        id: buttonCancel
                        Layout.preferredHeight: 40
                        Layout.fillWidth: true
                        onClicked: appWindow.close()

                        contentItem: Text {
                            text: qsTr("❌")
                            font.bold: true
                            color: "red"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 25
                            anchors.centerIn: parent
                        }
                    }

                    Button {
                        id: buttonOk
                        Layout.preferredHeight: 40
                        Layout.fillWidth: true
                        onClicked: appWindow.close()

                        contentItem: Text {
                            text: qsTr("✔️")
                            font.bold: false
                            color: "green"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 45
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
    }
}
