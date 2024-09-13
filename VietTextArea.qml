import QtQuick 2.15
import QtQuick.Controls 2.15
import "simplified-avim.js" as AVIMJS

TextArea {
    id: vietTextArea

    property var avim: AVIMJS.AVIM

    function processInput(text, key) {
        if (avim) {
            return avim.processKey(text, key);
        }
        return text + key;
    }

    Keys.onPressed: (event) => {
        if (event.text.length > 0) {
            var newText = processInput(text, event.text);
            if (newText !== text + event.text) {
                event.accepted = true;
                text = newText;
                cursorPosition = text.length;
            }
        }
    }

    Component.onCompleted: {
        console.log("AVIM loaded successfully");
    }
}
