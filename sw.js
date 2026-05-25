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
