import QtQuick 2.15
import QtQuick.Controls.Material 2.15

Item
{
    id: root
    function onClicked() {
        menu.open();
    }

    Menu {
        id: menu

        MenuItem {
            text: "Подробнее"
            onTriggered: {
                console.log("Подробнее selected")
            }
        }

        MenuItem {
            text: "Удалить"
            onTriggered: {

            }
        }
    }

    Image
    {
        id: image
        source: "qrc:/res/more.png"
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

