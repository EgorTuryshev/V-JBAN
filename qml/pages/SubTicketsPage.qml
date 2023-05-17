import QtQuick 2.15
import QtQuick.Layouts 1.15

import '../controls'

Item
{
    id: root
    anchors.fill: parent

    RowLayout
    {
        id: topControls
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        ControlSearchField
        {
            Layout.leftMargin: 5
            Layout.preferredHeight: 30
            Layout.preferredWidth: parent.width * 0.6
        }
        Item
        {
            Layout.fillWidth: true
        }
        Text
        {
            id: sortLabel
            text: qsTr("Отсортировать по: ")
            font.pixelSize: 16
            font.family: "Segoe UI"
            color: "#696969"
        }
        ControlComboBox
        {
            Layout.preferredWidth: sortLabel.width + 20
            Layout.preferredHeight: 40
            model: ["Проектам", "Названию"]
        }
    }

    ListView
    {
        clip: true
        anchors.top: topControls.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.topMargin: 35
        spacing: 30
        model: ListModel
        {
            ListElement { name: "Задача #1"; prName: "Проект #1" }
            ListElement { name: "Задача #2"; prName: "Проект #1" }
            ListElement { name: "Задача #3"; prName: "Проект #1" }
            ListElement { name: "Задача #4"; prName: "Проект #1" }
            ListElement { name: "Разработать API для реестра Windows 11"; prName: "Разработка плагинов для Windows 11" }
        }

        delegate: ModelControlTicketLarge
        {
            header: name
            projectName: prName
            width: parent.width - 10
            height: 150
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }
}
