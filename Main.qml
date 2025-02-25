import QtQuick
import QtQuick.Controls
import QtQuick.Window

Window {
    width: 900
    height: 600
    visible: true
    title: "BabelBreak - Главное меню"

    // Основной контейнер для навигации
    StackView {
        id: stackView
        initialItem: mainPage // Стартовая страница
        anchors.fill: parent
    }

    // Компонент главной страницы
    Component {
        id: mainPage

        Rectangle {
            color: "transparent"

            Row {
                anchors.centerIn: parent
                spacing: 1

                Image {
                    source: "Images/TextChat.jpg"
                    width: 300
                    height: 500
                    fillMode: Image.PreserveAspectFit

                    MouseArea {
                        anchors.fill: parent
                        onClicked: stackView.push("TextTranslationWindow.qml")
                    }
                }

                Image {
                    source: "Images/TranslateVideos.jpg"
                    width: 300
                    height: 500
                    fillMode: Image.PreserveAspectFit

                    MouseArea {
                        anchors.fill: parent
                        onClicked: { /* Аналогично для других окон */ }
                    }
                }

                Image {
                    source: "Images/VoiceChat.jpg"
                    width: 300
                    height: 500
                    fillMode: Image.PreserveAspectFit

                    MouseArea {
                        anchors.fill: parent
                        onClicked: { /* Аналогично для других окон */ }
                    }
                }
            }
        }
    }
}
