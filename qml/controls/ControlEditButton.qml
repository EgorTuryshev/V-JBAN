import QtQuick 2.15

Item
{
    id: root
    function onClicked() { console.log("clicked") }

    Image
    {
        id: image
        source: "qrc:/edit.svg"
        anchors.fill: parent

        MouseArea
        {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: root.onClicked();
        }
    }
}
