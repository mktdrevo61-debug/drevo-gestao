importScripts('https://www.gstatic.com/firebasejs/10.8.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.8.0/firebase-messaging-compat.js');

firebase.initializeApp({
    apiKey: "AIzaSyD_TaKudierPObWMsgmTJ9Cx4XdXLZ4meg",
    authDomain: "drevo-compras.firebaseapp.com",
    projectId: "drevo-compras",
    storageBucket: "drevo-compras.firebasestorage.app",
    messagingSenderId: "954205790898",
    appId: "1:954205790898:web:fa632733b0468ea51d5fab"
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage(function(payload) {
    console.log('[sw.js] Received background message ', payload);
    const notificationTitle = payload.notification.title || "Notificação";
    const notificationOptions = {
        body: payload.notification.body || "",
        icon: 'icon-192.png',
        badge: 'icon-192.png',
        vibrate: [200, 100, 200, 100, 200, 100, 200]
    };
    self.registration.showNotification(notificationTitle, notificationOptions);
});

self.addEventListener('install', event => {
    self.skipWaiting();
});

self.addEventListener('activate', event => {
    event.waitUntil(self.clients.claim());
});

self.addEventListener('notificationclick', event => {
    event.notification.close();
    event.waitUntil(
        clients.matchAll({ type: 'window' }).then(windowClients => {
            // Verifica se o aplicativo já está aberto em alguma aba
            for (let i = 0; i < windowClients.length; i++) {
                let client = windowClients[i];
                if (client.url.includes('APP_PRODUCAO') && 'focus' in client) {
                    return client.focus(); // Puxa o app pra frente
                }
            }
            // Se não estiver aberto, abre ele
            if (clients.openWindow) {
                return clients.openWindow('/');
            }
        })
    );
});
