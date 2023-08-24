import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow {
    id: appWindow
    visible: true
    title: qsTr("Network - IP address")
    readonly property int margin: 11

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
                Layout.fillHeight: true
                Layout.preferredWidth: 220
                Layout.minimumHeight: Layout.minimumHeight + 50
                Layout.minimumWidth: Layout.minimumWidth + 50

                ColumnLayout {
                    anchors.fill: parent

                    ComboBox {
                       id: combo
                       textRole: "text"
                       valueRole: "value"
                       Layout.fillWidth: true
                       implicitContentWidthPolicy: ComboBox.ContentItemImplicitWidth

                       onActivated: backend.modifier = currentValue

                       Component.onCompleted: currentIndex = indexOfValue(backend.modifier)
                       model: [
                           { value: Qt.NoConnection, text: qsTr("No Internet Connection") },
                           { value: Qt.FirstConnection, text: qsTr("Ethernet Connection") },
                           { value: Qt.SecondConnection, text: qsTr("Wireless Connection") }
                        ]
                    }

                    Item {
                        Layout.fillHeight: true
                        height: 100
                    }

                    Button {
                        id: newConn
                        Layout.fillWidth: true
                        text: qsTr("New Connection")
                        onClicked: stackLayout.advance()
                    }

                    Button {
                        id: eliminateConn
                        Layout.fillWidth: true
                        text: qsTr("Eliminate")
                        onClicked: stackLayout.advance()
                    }

                    Button {
                        id: applyConn
                        Layout.fillWidth: true
                        text: qsTr("Apply")
                        onClicked: stackLayout.advance()
                    }
                }
            }

            GroupBox {
                id: centerBox
                title: qsTr(" ")
                Layout.fillHeight: true
                Layout.preferredWidth: 220
                Layout.minimumHeight: Layout.minimumHeight + 50
                Layout.minimumWidth: Layout.minimumWidth + 50

                GridLayout {
                    id: centerLayout
                    rows: 14
                    flow: GridLayout.TopToBottom
                    anchors.fill: parent
                    Layout.fillWidth: true

                    Label { text: qsTr("Connection") }
                    Label { text: qsTr("Network card") }
                    Label { text: qsTr("Configuration type") }
                    Label { text: qsTr("Network mask") }
                    Label { text: qsTr("Router") }
                    Label { text: qsTr("Nameserver") }
                    Label { text: qsTr("IP address") }
                    Label { text: qsTr("WiFi SSID") }
                    Label { text: qsTr("Security") }
                    Label { text: qsTr("WPA/WPA2 key") }
                    Label { text: qsTr("Identity") }
                    Label { text: qsTr("Password") }
                    Label { text: qsTr("") }

                    RowLayout {
                        Label {
                            text: qsTr("Active")
                        }

                        CheckBox {
                            leftPadding: 50
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
                        placeholderText: "802-3-ethernet connection"
                        Layout.fillWidth: true
                    }

                    TextField {
                        placeholderText: "enp6s0"
                        Layout.fillWidth: true
                    }

                    TextField {
                        placeholderText: "AUTOMATIC"
                        Layout.fillWidth: true
                    }
                    TextField {
                        placeholderText: "255.255.255.0"
                        Layout.fillWidth: true
                    }

                    TextField {
                        placeholderText: "10.5.0.254"
                        Layout.fillWidth: true
                    }

                    TextField {
                        placeholderText: "10.99.202.1"
                        Layout.fillWidth: true
                    }

                    TextField {
                        placeholderText: "10.5.0.85"
                        Layout.fillWidth: true
                    }

                    TextField {
                        Layout.fillWidth: true
                    }

                    TextField {
                        Layout.fillWidth: true
                    }

                    TextField {
                        placeholderText: "*******"
                        echoMode: TextInput.Password
                        Layout.fillWidth: true
                    }

                    TextField {
                        Layout.fillWidth: true
                    }

                    TextField {
                        placeholderText: "*******"
                        echoMode: TextInput.Password
                        Layout.fillWidth: true
                    }

                    Button {
                        id: setupWPA
                        Layout.fillWidth: true
                        text: qsTr("Setup WPA auto")
                        onClicked: stackLayout.advance()
                    }

                    Button {
                        id: otherIP
                        Layout.fillWidth: true
                        text: qsTr("Other IP's")
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
                title: qsTr(" ")
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
                        Layout.preferredHeight: 50
                        Layout.fillWidth: true
                        onClicked: stackLayout.advance()

                        contentItem: Text {
                            text: qsTr("X")
                            font.bold: true
                            color: "red"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 30
                            anchors.centerIn: parent
                        }
                    }

                    Button {
                        id: buttonOk
                        Layout.preferredHeight: 50
                        Layout.fillWidth: true
                        onClicked: stackLayout.advance()

                        contentItem: Text {
                            text: qsTr("V")
                            font.bold: true
                            color: "green"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 30
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
    }
}

