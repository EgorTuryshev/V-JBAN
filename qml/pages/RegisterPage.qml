import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects

import '../controls'

Item
{
    id: root
    anchors.fill: parent
    Rectangle
    {
        id: background
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "#FEFEFE"
        width: 700
        height: 750
        radius: 10
        layer.enabled: true
        layer.effect: DropShadow
        {
            color:"grey"
            transparentBorder: true
            samples: 40
            radius: 10
            horizontalOffset: 0
            verticalOffset: 0
        }
        ColumnLayout
        {
            anchors.fill: parent
            anchors.bottomMargin: 20
            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter

                Image { source: 'qrc:/logo.svg' }

                Text
                {
                    text: qsTr("V-JBAN")
                    font.pixelSize: 96
                    font.family: "Segoe UI"
                    font.bold: true
                    color: "#404040"
                }
            }

            Text
            {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Регистрация")
                font.pixelSize: 36
                font.family: "Segoe UI"
                font.bold: true
                color: "#404040"
            }

            ControlEdit
            {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: parent.width - 170
                placeholderText: "Введите адрес электронной почты<font color=\"#D72F2F\"> *</font>"
            }

            ControlEdit
            {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: parent.width - 170
                placeholderText: "Введите Ваше имя<font color=\"#D72F2F\"> *</font>"
            }

            ControlEdit
            {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: parent.width - 170
                placeholderText: "Введите Вашу фамилию<font color=\"#D72F2F\"> *</font>"
            }

            ControlEdit
            {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: parent.width - 170
                placeholderText: "Введите пароль<font color=\"#D72F2F\"> *</font>"
                echoMode: TextInput.Password
            }

            ControlEdit
            {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: parent.width - 170
                placeholderText: "Подтвердите пароль<font color=\"#D72F2F\"> *</font>"
                echoMode: TextInput.Password

            }

            ControlButton
            {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 50
                Layout.preferredWidth: parent.width - 170
                text:"Продолжить"
                icon.source: "qrc:/mouse_click.svg"
                icon.height: 15
                icon.width: 15
            }

            ControlTextButton
            {
                id: createBtn
                Layout.alignment: Qt.AlignHCenter
                text: "Уже есть аккаунт? Войдите!"
                onClicked:
                {
                    root.parent.setSource("LoginPage.qml");
                }
            }
        }
    }
}
