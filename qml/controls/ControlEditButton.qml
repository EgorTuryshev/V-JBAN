import QtQuick 2.15

Item
{
    id: root
    function onClicked(){}

    Image
    {
        id: image
        source: "qrc:/res/edit.png"
        anchors.fill: parent
        MouseArea
        {
            id: mouseArea
            anchors.fill: parent
            onClicked:
            {
                root.onClicked();
            }
        }
    }
}
