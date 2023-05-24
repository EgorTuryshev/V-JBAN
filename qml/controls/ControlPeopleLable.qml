import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts 1.15
import '../controls'
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
        RowLayout{
            anchors.fill: parent
            ControlAvatar
                {
                   Layout.leftMargin: 10
                   Layout.alignment: Qt.AlignVCenter
                   size: 25
                }
            Text
            {
                text: qsTr("Мирошник Д.")
                font.pixelSize: 18
                font.family: "Segoe UI"
                color: "#404040"
            }
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
