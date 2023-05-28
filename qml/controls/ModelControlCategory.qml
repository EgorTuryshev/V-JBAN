import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import Qt.labs.qmlmodels
import MyApp

Item
{
    id: category

    property alias title: title.text
    property string categoryId
    property alias tickets: ticketList.model

    Rectangle
    {
        anchors.fill: parent
        layer.enabled: true
        radius: 10
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
            id: column
            anchors.fill: parent
            spacing: 10
            clip: true

            Text
            {
                id: title
                text: "Category Title"

                height: 30
                Layout.fillWidth: true
                Layout.leftMargin: 10

                color: "#696969"
                font.bold: true
                font.pixelSize: 24
                font.family: "Segoe UI"
            }

            ControlPlusPanel
            {
                Layout.fillWidth: true
                Layout.preferredHeight: 115
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                bgColor: "#EDEDED"
            }

            ListView
            {
                id: ticketList
                Layout.fillWidth: true
                Layout.fillHeight: true
                highlightMoveVelocity: -1
                highlightMoveDuration: 1000
                clip: true
                // 2 - def. spacing + 4 - dropshadow of Ticket
                spacing: 2 + 4

                delegate: Item {
                    id: delegateItem
                    width: ticketList.width
                    height: childrenRect.height

                    ControlPlaceBar
                    {
                        id: ticketRectangle
                        index: model.index
                        categoryId: category.categoryId
                        width: parent.width - 20
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    ModelControlTicket
                    {
                        id: ticketDelegate
                        header: name
                        index: model.index
                        categoryId: category.categoryId

                        width: parent.width - 20
                        anchors.top: ticketRectangle.bottom
                        anchors.topMargin: 2
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                footer: Item {
                    width: ticketList.width
                    height: ticketRectangleBottom.height + 10

                    ControlPlaceBar
                    {
                        id: ticketRectangleBottom
                        index: -1
                        categoryId: category.categoryId
                        width: parent.width - 20

                        anchors.top: parent.top
                        anchors.topMargin: ticketList.spacing
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
}
