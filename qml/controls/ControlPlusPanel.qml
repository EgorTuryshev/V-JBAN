import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects

Item
{
    id: root
    function onClicked(){}
    property int plusSize: 50
    property string bgColor
    Rectangle
    {
        anchors.fill: parent
        layer.enabled: true
        radius: 10
        color: bgColor
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

        Image
        {
            id: plus
            anchors.centerIn: parent
            width: plusSize
            height: plusSize
            source: "qrc:/plus_big.svg"
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
