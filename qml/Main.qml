import QtQuick
import QtQuick.Window
import QtQuick.Layouts 1.15

Window
{
    width: 1200
    height: 800
    minimumWidth: 800
    minimumHeight: 800
    visible: true
    title: qsTr("V-JBAN")

    Component.onCompleted: {
        restAPI.getProjects()
    }

    Connections
    {
        target: restAPI
        function onProjectsReceived() {
            loader.setSource("./pages/MainPage.qml");
        }
        function onForceLoginPage() {
            loader.setSource("./pages/LoginPage.qml");
        }
    }

    Loader {
        id: loader
        anchors.fill: parent
//        sourceComponent: LoginPage { }
    }
}
