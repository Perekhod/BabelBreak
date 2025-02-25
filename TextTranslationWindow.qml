import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "TranslationHelper.js" as TranslationHelper // Импортируем JavaScript-файл

Page {
    // Заголовок окна (опционально)
    header: Label {
        text: "Окно перевода"
        padding: 10
        font.bold: true
    }

    // Контент окна
    Rectangle {
        anchors.fill: parent
        color: "white"

        /* Таймер задержки перевода */
        Timer {
            id: translationTimer
            interval: 500
            /*Вызов функции перевода*/
            onTriggered: {
                            var apiKey = "YOUR_GOOGLE_TRANSLATE_API_KEY";
                            var sourceLang = sourceLanguage.currentIndex === 0 ? "ru" : "en";
                            var targetLang = targetLanguage.currentIndex === 0 ? "ru" : "en";
                            TranslationHelper.translateText(inputText.text, sourceLang, targetLang, apiKey, function(translatedText) {
                                outputText.text = translatedText; // Обновляем поле перевода
                            });
                        }
                    }

        }
        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            // Рамка для выбора языков
            Rectangle {
                Layout.fillWidth: true
                height: 50
                color: "#f0f0f0"
                border.color: "#cccccc"
                border.width: 1

                RowLayout {
                    anchors.centerIn: parent
                    spacing: 10

                    ComboBox {
                        id: sourceLanguage
                        model: ["Русский", "Английский"]
                        currentIndex: 0
                    }

                    Label {
                        text: "→"
                        font.pixelSize: 20
                    }

                    ComboBox {
                        id: targetLanguage
                        model: ["Русский", "Английский"]
                        currentIndex: 1
                    }
                }
            }

            // Рамка для ввода текста
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#f9f9f9"
                border.color: "#cccccc"
                border.width: 1

                ScrollView {
                    anchors.fill: parent
                    TextArea {
                        id: inputText
                        placeholderText: "Введите текст для перевода..."
                        wrapMode: TextArea.Wrap

                        // Обработчик синхронного отображения текста
                        onTextChanged: {
                            outputText.text = inputText.text

                        }
                    }
                }
            }

            // Рамка для перевода текста
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#f9f9f9"
                border.color: "#cccccc"
                border.width: 1

                ScrollView {
                    anchors.fill: parent
                    TextArea {
                        id: outputText
                        readOnly: true
                        wrapMode: TextArea.Wrap
                        text: "Перевод будет здесь..."
                    }
                }
            }
        }

        // Кнопка "Назад"
        Button {
            text: "← Назад"
            anchors {
                left: parent.left
                top: parent.top
                margins: 10
            }
            onClicked: stackView.pop()
        }
}
