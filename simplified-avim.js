// simplified-avim.js
.pragma library

var AVIM = {
    method: 1, // 1: TELEX
    charmap: {
        a: ['a', 'á', 'à', 'ả', 'ã', 'ạ'],
        e: ['e', 'é', 'è', 'ẻ', 'ẽ', 'ẹ'],
        i: ['i', 'í', 'ì', 'ỉ', 'ĩ', 'ị'],
        o: ['o', 'ó', 'ò', 'ỏ', 'õ', 'ọ'],
        u: ['u', 'ú', 'ù', 'ủ', 'ũ', 'ụ'],
        y: ['y', 'ý', 'ỳ', 'ỷ', 'ỹ', 'ỵ'],
        d: ['d', 'đ']
    },

    tonemark: ['', 's', 'f', 'r', 'x', 'j'],

    processKey: function(text, key) {
        if (this.method !== 1) return text + key; // Only implement TELEX for simplicity

        var lastChar = text.slice(-1).toLowerCase();
        var rest = text.slice(0, -1);

        if (key in this.charmap) {
            if (lastChar in this.charmap) {
                return rest + this.changeChar(lastChar, key);
            }
        } else if (this.tonemark.indexOf(key) !== -1) {
            if (lastChar in this.charmap) {
                return rest + this.addMark(lastChar, this.tonemark.indexOf(key));
            }
        }

        return text + key;
    },

    changeChar: function(char, type) {
        if (type === 'a' && char === 'a') return 'â';
        if (type === 'a' && char === 'â') return 'ă';
        if (type === 'e' && char === 'e') return 'ê';
        if (type === 'o' && char === 'o') return 'ô';
        if (type === 'o' && char === 'ô') return 'ơ';
        if (type === 'u' && char === 'u') return 'ư';
        if (type === 'd' && char === 'd') return 'đ';
        return char;
    },

    addMark: function(char, mark) {
        if (char in this.charmap) {
            return this.charmap[char][mark];
        }
        return char;
    }
};
