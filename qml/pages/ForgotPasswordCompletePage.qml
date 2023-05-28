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
        height: 350
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
            Text
            {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 5
                Layout.preferredWidth: parent.width - 170
                text: "На адрес Вашей электронной почты было отправлено письмо для подтверждения. Пожалуйста, проследуйте инструкции в письме и затем нажмите на кнопку ниже."
                font.pixelSize: 18
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter

                font.family: "Segoe UI"
                color: "#696969"
            }
            ControlButton
            {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: -100
                Layout.preferredHeight: 50
                Layout.preferredWidth: parent.width - 170
                icon.source: "qrc:/mouse_click.svg"
                icon.height: 15
                icon.width: 15
                text:"Перейти на страницу входа"
            }
            ControlTextButton
            {
                id: createBtn
                Layout.alignment: Qt.AlignHCenter
                text: "Назад к странице регистрации"

                onClicked:
                {

                }
            }
        }
    }
}
