import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root
    function onClicked(){}
    property int plusSize: 50
    Rectangle
    {
        anchors.fill: parent
        layer.enabled: true
        radius: 10
        color: "#EDEDED"
        layer.effect: DropShadow
        {
            color: "grey"
            transparentBorder: true
            samples: 40
            radius: 10
            horizontalOffset: 0
            verticalOffset: 0
        }
        Image
        {
            id: plus
            anchors.centerIn: parent
            width: plusSize
            height: plusSize
            source: "qrc:/res/plus_big.png"
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                root.onClicked();
            }
        }
    }
}
