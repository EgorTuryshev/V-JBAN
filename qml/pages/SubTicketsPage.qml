import QtQuick 2.15

import '../controls'

Item
{
    id: root
    anchors.fill: parent
    clip: true
    ListView
    {
        anchors.fill: parent
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
