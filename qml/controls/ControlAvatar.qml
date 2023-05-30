import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    id: root

    property int size: 20

    width: size
    height: size

    Rectangle
    {
        id: imgRect
        anchors.fill: parent
        radius: width / 2

        Image
        {
            id: image
            source: "qrc:/avatar.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            sourceSize.width: imgRect.width
            sourceSize.height: imgRect.height
            smooth: true
        }
    }

//    ToolTip {
//        contentItem: ControlRegularText {
//            text: "Иванов Иван"
//            font.pixelSize: 14
//        }

//        background: Rectangle {
//            radius: 5
//            color: "#E4E4E4"
//            border.color: "#696969"
//            border.width: 1
//        }
//    }
}
