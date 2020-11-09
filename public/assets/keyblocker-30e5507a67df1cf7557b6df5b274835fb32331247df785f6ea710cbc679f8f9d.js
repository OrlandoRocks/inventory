// Blocks keys using a regular expression. Doesn't accept global modifiers
function keyBlocker(input, expr) {
    $(input).on('keypress', function(event) {
        var key, keyChar;
        key = event.charCode || event.which;
        keyChar = String.fromCharCode(key);
        if (!expr.test(keyChar)) {
            if (!/((^8$)|(^0$))/g.test(key)) {
                event.preventDefault();
            }
        }
    });
};
