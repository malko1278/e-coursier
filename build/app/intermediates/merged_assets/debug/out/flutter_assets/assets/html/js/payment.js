

//var coloredDiv = document.getElementById('colorDiv');
// coloredDiv.setAttribute('style', 'background:rgb(26, 40, 57);');

window.onload = function () {
 var widget = new cp.CloudPayments();
    widget.pay('charge', // или 'charge'
        { //options
            publicId: 'test_api_00000000000000000000001', //id из личного кабинета
            description: 'Оплата товаров в example.com', //назначение
            amount: 700, //сумма
            currency: 'Тенге', //валюта
            accountId: 'user@example.com', //идентификатор плательщика (необязательно)
            invoiceId: '1234567', //номер заказа (необязательно)
            skin: "mini", //дизайн виджета (необязательно)
            data: {
                myProp: 'myProp value'
            }
        },
        {
            onSuccess: function (options) { // success
                // действие при успешной оплате
                // ... Send Message to flutter app
                // JavascriptChannel.postMessage(options);
                // JavascriptChannel.postMessage('Test de paiement effectué avec succes');
                JavascriptChannel.postMessage('Тест на оплату прошел успешно');
            },
            onFail: function (reason, options) { // fail
                //действие при неуспешной оплате
                // ... Send Message to flutter app
                // JavascriptChannel.postMessage(reason, options);
                // JavascriptChannel.postMessage('Echec du paiement...');
                JavascriptChannel.postMessage('Оплата не произведена...');
            },
            onComplete: function (paymentResult, options) {
                // Вызывается как только виджет получает от api.cloudpayments ответ с результатом транзакции.
                // например вызов вашей аналитики Facebook Pixel
                // ... Send Message to flutter app
                // JavascriptChannel.postMessage(paymentResult, options);
                // JavascriptChannel.postMessage('Paiement effectue ...');
                JavascriptChannel.postMessage('Произведенный платеж ...');
            }
        }
    )
}

function ok() {}

