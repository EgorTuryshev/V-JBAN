import QtQuick 2.15
import '../controls'

Item {
    anchors.fill: parent

    ListView
    {
        anchors.fill: parent
        spacing: 30

        model: ListModel
        {
            ListElement { }
        }

        delegate: ModelControlMessage
        {
            width: parent.width - 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }
}
