import QtQuick 2.15

Item
{
    id: root
    height: width
    Rectangle
    {
        id: imgRect
        anchors.fill: parent
        radius: width / 2

        Image
        {
            id: image
            source: "qrc:/res/avatar.png"
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            sourceSize.width: imgRect.width
            sourceSize.height: imgRect.height
            smooth: true
        }
    }
}
