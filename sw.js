self.addEventListener("install",e=>self.skipWaiting());
self.addEventListener("activate",e=>e.waitUntil(self.clients.claim()));
self.addEventListener("fetch",e=>{
  if(e.request.method!=="GET") return;
  e.respondWith(fetch(e.request).catch(()=>caches.match(e.request)));
});
self.addEventListener("push",e=>{
  let data={title:"BTC Journal",body:"Ada pembaruan BTC."};
  try{data=Object.assign(data,e.data?e.data.json():{})}catch(_){}
  e.waitUntil(self.registration.showNotification(data.title,{body:data.body,icon:"icon-192.png",badge:"icon-192.png",data:data.url||"./"}));
});
self.addEventListener("notificationclick",e=>{
  e.notification.close();
  e.waitUntil(clients.matchAll({type:"window",includeUncontrolled:true}).then(cs=>{
    for(const c of cs){if("focus"in c)return c.focus()}
    return clients.openWindow(e.notification.data||"./");
  }));
});