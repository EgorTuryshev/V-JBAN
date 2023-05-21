import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects

import '../controls'

Item
{
    id: root
    property string errorMessage: ""

    anchors.fill: parent

    Connections
    {
        target: restAPI
        function onErrorReceived(error) {
            errorMessage = error;
            errorText.visible = true;
        }
    }
    Connections
    {
        target: restAPI
        function onTokensSet(accessToken, refreshToken) {
            if (accessToken !== "" && refreshToken !== "")
            {
                restAPI.getProjects();
                root.parent.setSource("MainPage.qml");
            }
        }
    }

    Rectangle
    {
        id: background
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        color: "#FEFEFE"
        width: 700
        height: 600
        radius: 10
        layer.enabled: true
        layer.effect: DropShadow
        {
            color:"grey"
            transparentBorder: true
            samples: 40
            radius: 10
            horizontalOffset: 0
            verticalOffset: 0
        }
        ColumnLayout
        {
            anchors.fill: parent
            anchors.bottomMargin: 20
            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter
                Image
                {
                    source: 'qrc:/res/logo.png'
                }
                Text
                {
                    text: qsTr("V-JBAN")
                    font.pixelSize: 96
                    font.family: "Segoe UI"
                    font.bold: true
                    color: "#404040"
                }
            }
            Text
            {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Войдите, чтобы начать работу!")
                font.pixelSize: 36
                font.family: "Segoe UI"
                font.bold: true
                color: "#404040"
            }
            ControlEdit
            {
                id: emailText
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: parent.width - 170
                placeholderText: "Введите логин"
            }
            ControlEdit
            {
                id: passwordText
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 40
                Layout.preferredWidth: parent.width - 170
                placeholderText: "Введите пароль"
                echoMode: TextInput.Password
                ControlTextButton
                {
                    id: forgotBtn
                    height: 30
                    anchors.right: parent.right
                    anchors.top: parent.bottom
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    text: "Забыли пароль?"
                    onClicked:
                    {
                        root.parent.setSource("ForgotPasswordPage.qml");
                    }
                }
            }
            ControlRegularErrorText
            {
                id: errorText
                visible: false
                text: errorMessage

                Layout.preferredWidth: parent.width - 170
                Layout.alignment: Qt.AlignHCenter
            }
            ControlButton
            {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 50
                Layout.preferredWidth: parent.width - 170
                text:"Продолжить"
                icon.source: "qrc:/res/button.png"
                icon.height: 15
                icon.width: 15
                onClicked:
                {
                    errorMessage = "";
                    errorText.visible = false;
                    restAPI.sendLoginRequest(emailText.text, passwordText.text);
                }
            }
            ControlButton
            {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredHeight: 50
                Layout.preferredWidth: parent.width - 170
                text:"Я дебил"
                icon.source: "qrc:/res/button.png"
                icon.height: 15
                icon.width: 15
                Material.background: "#D72F2F"
                onClicked:
                {
                    errorMessage = "";
                    errorText.visible = false;
                    restAPI.sendLoginRequest("johndoe@example.com", "123");
                }
            }
            ControlTextButton
            {
                id: createBtn
                Layout.alignment: Qt.AlignHCenter
                text: "Ещё не зарегистрированы? Создайте аккаунт!"
                onClicked:
                {
                    root.parent.setSource("RegisterPage.qml");
                }
            }
        }
    }
}

