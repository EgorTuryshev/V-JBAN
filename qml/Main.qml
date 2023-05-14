import QtQuick
import QtQuick.Window
import QtQuick.Layouts 1.15

import './pages'

Window
{
    width: 800
    height: 600
    visible: true
    title: qsTr("V-JBAN")
    StackLayout
    {
        id: router
        anchors.fill: parent
        currentIndex: 0
        MainPage
        {

        }

        LoginPage
        {

        }
    }
}
