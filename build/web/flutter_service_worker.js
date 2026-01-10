'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "81e0f42916024d69214fc18e8d64c935",
"index.html": "bf1e45747974a42ebcf850f57cc46223",
"/": "bf1e45747974a42ebcf850f57cc46223",
"main.dart.js": "604715161de13a269e5e69fe24f4c20f",
"version.json": "9b818ca9511483c901bed1545384376c",
"assets/assets/images/bgImage.png": "dffeab6196014d9c0597211c6ce143fd",
"assets/assets/images/my_profile.png": "4f7f1c775f397943e36429083ccca382",
"assets/assets/images/projects/grabgo/customer/splash_screen.png": "b1721982ae2d9ea9c5a679f97a5572ba",
"assets/assets/images/projects/grabgo/customer/login_screen.png": "8e045f4f10ca23d7fde5131f5afeead2",
"assets/assets/images/projects/grabgo/customer/home_screen.png": "b035b754a65bb483d1e5d4fe074fa9db",
"assets/assets/images/projects/grabgo/customer/categories_deals.png": "54ef927fdd80cedfdd1f0e3df328ef58",
"assets/assets/images/projects/grabgo/customer/onboarding.png": "fc9824a914070973e52281e85e86b395",
"assets/assets/images/projects/grabgo/customer/home_dark_mode.png": "c0796647360c436f65c7460577c217ec",
"assets/assets/images/projects/grabgo/rider/onboarding_1.png": "adde2c424b11d2e9009a7e5e6439690a",
"assets/assets/images/projects/grabgo/rider/onboarding_2.png": "22899979d596d0f9c5af08a2b5a9faed",
"assets/assets/images/projects/grabgo/rider/login_screen.png": "23ddc5abca7b8fa37a74f4d00a108340",
"assets/assets/images/projects/grabgo/rider/home_screen.png": "9880b6d7b66fdab4d8ae4e72a9b74bdf",
"assets/assets/images/projects/grabgo/rider/profile_screen.png": "2afc9709c59000f8f2770a8525c0c4da",
"assets/assets/images/projects/grabgo/rider/wallet_screen.png": "dc14d43874e28d9409304108e5a232af",
"assets/assets/images/projects/grabgo/rider/profile_menu.png": "73968e7027d930c23d3eed3b71b34df0",
"assets/assets/images/projects/slidebuddy/home_upload.png": "691d734562d74517ec270f8282a48416",
"assets/assets/images/projects/slidebuddy/ai_summary.png": "44298feb8aca8bd5ccd0e2415bdd321c",
"assets/assets/images/projects/slidebuddy/practice_questions.png": "55ec78041b436e8265dd050d8ba2459c",
"assets/assets/images/projects/slidebuddy/login_modal.png": "87fec3b13eda02effe48182442322ed2",
"assets/assets/images/projects/slidebuddy/history_page.png": "b2e1c872003eb8fdecfe8ce70a81cd16",
"assets/assets/images/projects/citsa/splash_screen.png": "7b6212a0c993743d713eb61848e1d131",
"assets/assets/images/projects/citsa/signin_screen.png": "bb9b0ac3317d92c9fba69319117ede8b",
"assets/assets/images/projects/citsa/verify_email.png": "f39243f8ef02cd9f07d5e661957fa997",
"assets/assets/images/projects/citsa/profile_setup_1.png": "f5059565b55fda00455fb3a6d6b3a97f",
"assets/assets/images/projects/citsa/profile_setup_2.png": "5fa4814678ea2220955aef05b61e356d",
"assets/assets/images/projects/citsa/profile_setup_3.png": "0a2ac7fb989ef20f53cf25553db42093",
"assets/assets/images/projects/utag/login_screen.png": "6a4a942610c06133247543a894269895",
"assets/assets/images/projects/utag/splash_screen.png": "849d5ac2a724bb84a5d202e124a1635d",
"assets/assets/images/projects/utag/register_screen.png": "aeb2a0c0ae16ef5f960fa0bf97b46ce9",
"assets/assets/icons/behance.svg": "35ad2d47e647d0b168e7707b2984c6b5",
"assets/assets/icons/coffee-cup.png": "65bb7ca8fb426057ab6285bdba273ef2",
"assets/assets/icons/download.svg": "628700a3031424d215a441fab2da1731",
"assets/assets/icons/dribble.svg": "d392567c5678d42472d2c7b766268101",
"assets/assets/icons/github.svg": "9226aa209923e38c0a6ddcb236e2bc68",
"assets/assets/icons/linkedin.svg": "5b2195ddf9e879047dd8a163c4194920",
"assets/assets/icons/check.svg": "4220c82511cc1dfb40b8bba7d25c5f55",
"assets/assets/icons/twitter.svg": "a4a0163fef48a4247a305528c07bc4fa",
"assets/assets/doc/Muktar%2520Zakari%2520Junior%2520CV.pdf": "a3613cd8706fef3ece2ca424b9b85faa",
"assets/assets/fonts/Lato-Bold.ttf": "24b516c266d7341c954cb2918f1c8f38",
"assets/assets/fonts/Lato-Regular.ttf": "122dd68d69fe9587e062d20d9ff5de2a",
"assets/assets/fonts/Lato-Light.ttf": "2bcc211c05fc425a57b2767a4cdcf174",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/fonts/MaterialIcons-Regular.otf": "e0a3d73cde7c360dfa16d5f02ec1686c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "9edc4f60d1de54875a896d7ee585b2bc",
"assets/AssetManifest.bin.json": "8c22125e79a3fbe0fad642c91c03d0fa",
"assets/FontManifest.json": "afaeae3d62fe3c7183c614f026039176",
"assets/NOTICES": "c97308afc65ea68cfa0314f9ce317a21",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "d8fe34f7ae4c072a77b924e01dac8a50",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
