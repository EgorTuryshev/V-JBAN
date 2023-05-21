import QtQuick
import QtQuick.Window
import QtQuick.Layouts 1.15

import './pages'

Window
{
    width: 1200
    height: 800
    minimumWidth: 800
    minimumHeight: 600
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

        //LoginPage
        //{
        //
        //}
        //RegisterPage
        //{
        //
        //}
        /*ForgotPasswordPage{

        }*/
    }
}
