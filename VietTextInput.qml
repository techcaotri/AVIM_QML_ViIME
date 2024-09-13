import QtQuick
import QtQuick.Controls
import "avim.js" as AVIM
import "avim_qml.js" as AVIMJS

TextArea {
    id: vietTextArea

    property bool vietnameseInput: true
    property int inputMethod: 1 // 1: TELEX, 2: VNI, 3: VIQR

    wrapMode: TextArea.Wrap

    onInputMethodChanged: {
        AVIMJS.setInputMethod(inputMethod);
    }

    Keys.onPressed: (event) => {
        if (vietnameseInput) {
            var result = AVIMJS.handleKeyPress(event, vietTextArea);
            if (result === false) {
                event.accepted = true;
            }
        }
    }

    Component.onCompleted: {
        AVIMJS.initAVIM();
        AVIMJS.setInputMethod(inputMethod);
        console.log("AVIM initialized with method:", inputMethod);
    }
}
