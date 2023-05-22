import QtQuick 2.15
import QtQuick.Layouts 1.15

import '../controls'

Item
{
    id: root

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            id: controlPanel

            Layout.fillWidth: true
            Layout.preferredHeight: 35
            Layout.margins: 5

            RowLayout
            {
                anchors.fill: parent

                ControlSearchField
                {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                Text
                {
                    id: sortLabel
                    text: qsTr("Отсортировать по: ")

                    color: "#696969"
                    font.pixelSize: 16
                    font.family: "Segoe UI"
                }

                ControlComboBox
                {
                    Layout.preferredWidth: sortLabel.width + 20
                    Layout.fillHeight: true

                    model: ListModel
                    {
                        ListElement { name: "Проектам" }
                        ListElement { name: "Названию" }
                    }
                }
            }
        }

        ListView
        {
            Layout.fillWidth: true
            Layout.fillHeight: true

            clip: true
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
}
