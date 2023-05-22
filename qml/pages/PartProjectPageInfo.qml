import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import '../controls'

Item
{
    anchors.fill: parent
    ColumnLayout
    {
        anchors.fill: parent
        RowLayout
        {
            Layout.fillWidth: true
            ControlTextArea
            {
                Layout.fillWidth: true
            }
        }
        RowLayout
        {
            Layout.fillWidth: true
            ControlDescriptionBox
            {
                Layout.fillWidth: true
            }
        }
    }
}
