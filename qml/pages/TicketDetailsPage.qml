import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import '../controls'
Dialog {
    id: ticketDetails
    implicitWidth: 650
    implicitHeight: 1000
    ColumnLayout{
        Text
        {
            anchors.topMargin: parent.TopLeft
            text: qsTr("Задача #1")
            font.pixelSize: 36
            font.family: "Segoe UI"
            font.bold: true
            color: "#404040"
        }
        Text
        {
            anchors.topMargin: parent.TopLeft
            Layout.topMargin: 20
            text: qsTr("Исполнители:")
            font.pixelSize: 24
            font.family: "Segoe UI"
            font.bold: true
            color: "#404040"
        }
        RowLayout{
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ControlPlusPanel
            {
                id: addPeopleButton
                Layout.fillHeight: true
                Layout.preferredWidth: 200
                Layout.preferredHeight: 40
                Layout.topMargin: 10
                Layout.alignment: Qt.AlignTop
                plusSize: 20
                bgColor: "#F9F9F9"
                visible: listView.contentX + listView.width >= listView.contentWidth - 10
            }
            ControlPeopleLable
            {
                id: addChangePeopleButton
                Layout.fillHeight: true
                Layout.preferredWidth: 200
                Layout.preferredHeight: 40
                Layout.topMargin: 10
                Layout.alignment: Qt.AlignTop
                bgColor: "#F9F9F9"
                visible: listView.contentX + listView.width >= listView.contentWidth - 10
            }

        }
        Text
        {
            anchors.topMargin: parent.TopLeft
            Layout.topMargin: 15
            text: qsTr("Сроки выполнения:")
            font.pixelSize: 24
            font.family: "Segoe UI"
            font.bold: true
            color: "#404040"
        }
        RowLayout{
            Layout.topMargin: 10
            Text
            {
                text: qsTr("Начало:")
                font.pixelSize: 18
                font.family: "Segoe UI"
                color: "#404040"
            }
            ControlEdit{
                Layout.leftMargin: 40
                Layout.preferredWidth: 180
                Layout.preferredHeight: 24
            }
            Text
            {
                Layout.leftMargin: 20
                text: qsTr("Конец:")
                font.pixelSize: 18
                font.family: "Segoe UI"
                color: "#404040"
            }
            ControlEdit{
                Layout.leftMargin: 40
                Layout.preferredWidth: 180
                Layout.preferredHeight: 24
            }

        }
        Text
        {
            anchors.topMargin: parent.TopLeft
            Layout.topMargin: 15
            text: qsTr("Теги:")
            font.pixelSize: 24
            font.family: "Segoe UI"
            font.bold: true
            color: "#404040"
        }
        RowLayout{
            Layout.topMargin: 5
            Text
            {
                text: qsTr("Приоритет:")
                font.pixelSize: 18
                font.family: "Segoe UI"
                color: "#404040"
            }
            ControlComboBox{
                Layout.leftMargin: 12
                Layout.preferredWidth: 180
                Layout.preferredHeight: 40
            }
            Text
            {
                Layout.leftMargin: 22
                text: qsTr("Сложность:")
                font.pixelSize: 18
                font.family: "Segoe UI"
                color: "#404040"
            }
            ControlComboBox{
                Layout.leftMargin: 2
                Layout.preferredWidth: 180
                Layout.preferredHeight: 40
            }

        }
        Text
        {
            anchors.topMargin: parent.TopLeft
            Layout.topMargin: 15
            text: qsTr("Категория:")
            font.pixelSize: 24
            font.family: "Segoe UI"
            font.bold: true
            color: "#404040"
        }
        ControlComboBox{
            Layout.preferredWidth: 180
            Layout.preferredHeight: 40
        }

        ControlDescriptionBox
        {
            Layout.fillWidth: true

        }

    }


}
