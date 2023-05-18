import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root

    property alias header: header.text
    property alias description: desc.text
    property int numOfDoneTickets: 3
    property int numOfTickets: 10

    Rectangle
    {
        id: ticketRect
        width: parent.width
        height: parent.height
        layer.enabled: true
        radius: 15
        clip: true
        color: "#F9F9F9"
        layer.effect: DropShadow
        {
            color: "#e3e3e3"
            opacity: 0.3
            transparentBorder: true
            samples: 40
            radius: 10
            horizontalOffset: 4
            verticalOffset: 4
        }
        ColumnLayout
        {
            anchors.fill: parent
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 10
            RowLayout
            {
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true
                Text
                {
                    id: header
                    text: "Проект #1"
                    font.pixelSize: 20
                    font.family: "Segoe UI"
                    color: "#696969"
                    font.bold: true
                    elide: Qt.ElideRight
                }
                ControlEditButton
                {
                    Layout.preferredWidth: 15
                    Layout.preferredHeight: 15
                }
                Item
                {
                    Layout.fillWidth: true
                    Layout.minimumWidth: 100
                }
                ControlMoreButton
                {
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                }
            }
            RowLayout
            {
                ControlRegularText
                {
                    text: qsTr("Текущий прогресс")
                    font.bold: true
                }
                Item
                {
                    Layout.fillWidth: true
                    Layout.minimumWidth: 10
                }
                ControlRegularText
                {
                    text: qsTr("Задач завершено: " + numOfDoneTickets + "/" + numOfTickets)
                    font.bold: true
                }
            }
            Rectangle
            {
                Layout.fillWidth: true
                Layout.preferredHeight: 20
                radius: 15
                border.color: "#EDEDED"
                border.width: 2
                Rectangle
                {
                    height: parent.height - parent.border.width * 2
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width * (numOfDoneTickets / numOfTickets)
                    color: "#4B78DC"
                    radius: 15
                    clip: true

                    ControlRegularText
                    {
                        text: Math.round(numOfDoneTickets / numOfTickets * 100) + "%"
                        color: "white"
                        font.bold: true
                        font.pixelSize: 14
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 10
                        visible: Math.round(numOfDoneTickets / numOfTickets * 100) <= 5 ? false : true
                    }
                }
            }
            Text
            {
                Layout.alignment: Qt.AlignTop
                id: desc
                text: qsTr("Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit. Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit.")
                font.pixelSize: 16
                font.family: "Segoe UI"
                color: "#696969"
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                wrapMode: TextEdit.WordWrap
                elide: Text.ElideRight
            }
        }
    }
}
