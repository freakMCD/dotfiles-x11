// ==UserScript==
// @name        Fix web WhatsApp Notifications
// @description	Hits the notification button, once
// @version		1.0
// @namespace   https://web.whatsapp.com/
// @run-at document-idle
// @grant       none
// ==/UserScript==
(function() {
    'use strict';

    var waitForThatFrickingButton = setInterval(function() {
        let xpath = "//span[@class='edeob0r2 t94efhq2'][contains(.,'Activar notificaciones de escritorio')]";
        let button = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        if(button) {
            button.click();
            clearInterval(waitForThatFrickingButton);
        }
    }, 500)
})();
