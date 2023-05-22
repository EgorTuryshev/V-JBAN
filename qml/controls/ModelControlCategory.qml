import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import MyApp

Item
{
    id: category

    property alias title: title.text
    property string categoryId
    property alias tickets: visualModel.model

    Rectangle
    {
        anchors.fill: parent
        layer.enabled: true
        radius: 10
        color: "#F9F9F9"
        layer.effect: DropShadow
        {
            color: "grey"
            transparentBorder: true
            samples: 40
            radius: 10
            horizontalOffset: 0
            verticalOffset: 0
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
                color: "#696969"
            }

            DelegateModel
            {
                id: visualModel
                groups: [DelegateModelGroup
                {
                    name: category.categoryId
                    includeByDefault: true
                }]
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
