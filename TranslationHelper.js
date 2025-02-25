function translateText(text) {
    if (text === "") {
        outputText.text = ""; // Очищаем поле перевода, если текст пустой
        return;
    }

    // Ваш API-ключ от Яндекс.Облака
    var apiKey = "YOUR_YANDEX_API_KEY";
    // Язык источника и целевой язык (например, "ru" для русского, "en" для английского)
    var sourceLang = sourceLanguage.currentIndex === 0 ? "ru" : "en";
    var targetLang = targetLanguage.currentIndex === 0 ? "ru" : "en";

    // URL для запроса к Яндекс.Переводчику API
    var url = "https://translate.api.cloud.yandex.net/translate/v2/translate";

    // Данные для POST-запроса
    var requestData = JSON.stringify({
        folder_id: "YOUR_FOLDER_ID", // Идентификатор каталога в Яндекс.Облаке
        texts: [text],
        sourceLanguageCode: sourceLang,
        targetLanguageCode: targetLang
    });

    // Отправка запроса
    var xhr = new XMLHttpRequest();
    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.setRequestHeader("Authorization", "Api-Key " + apiKey); // Авторизация через API-ключ

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                var translatedText = response.translations[0].text;
                outputText.text = translatedText; // Обновляем поле перевода
            } else {
                console.error("Ошибка перевода:", xhr.statusText);
                outputText.text = "Ошибка перевода";
            }
        }
    };

    xhr.send(requestData);
}
