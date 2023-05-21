import QtQuick
import QtQuick.Window
import QtQuick.Layouts 1.15

import './pages'

Window
{
    width: 1200
    height: 800
    minimumWidth: 800
    minimumHeight: 800
    visible: true
    title: qsTr("V-JBAN")

    Loader {
        id: loader
        anchors.fill: parent
        sourceComponent: LoginPage {
        }
    }
}
