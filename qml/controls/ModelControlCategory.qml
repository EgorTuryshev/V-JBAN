import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects

Item
{
    id: category

    property alias title: title.text
    property alias tickets: visualModel.model

    Rectangle
    {
        anchors.fill: parent
        layer.enabled: true
        radius: 10
        color:"#F9F9F9"
        layer.effect: DropShadow
        {
            color:"grey"
            transparentBorder: true
            samples: 40
            radius: 10
            horizontalOffset: 0
            verticalOffset: 0
        }
        DropArea
        {
            anchors.fill: parent

            onDropped:
            {
                console.log("DROPPED");
            }
            onEntered:
            {
                console.log(drag.source.DelegateModel.itemsIndex);
            }
            onExited:
            {
                console.log(drag.source.DelegateModel.itemsIndex - 1);
            }
        }

        Column
        {
            id: column
            anchors.fill: parent
            spacing: 10
            clip: true

            Text
            {
                id: title
                anchors.left: parent.left
                anchors.leftMargin: 10
                text: "Category Title"
                font.bold: true
                font.pixelSize: 36
                font.family: "Segoe UI"
                height: 30
                color:"#696969"
            }

            DelegateModel
            {
                id: visualModel
                model: tickets
                /*{
                    ListElement { name: "Ticket 1" }
                    ListElement { name: "Ticket 2" }
                    ListElement { name: "Ticket 3" }
                    ListElement { name: "Ticket 4" }
                    ListElement { name: "Ticket 5" }
                    ListElement { name: "Ticket 6" }
                    ListElement { name: "Ticket 7" }
                    ListElement { name: "Ticket 8" }
                }*/
                delegate: ModelControlTicket
                {
                    header: name
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            ListView
            {
                id: ticketList
                property int dragItemIndex: -1
                anchors.fill: parent
                highlightMoveVelocity: -1
                highlightMoveDuration: 1000
                anchors.topMargin: title.height + parent.spacing + 10
                clip: true
                spacing: 10
                model: visualModel
            }
        }
    }
}
