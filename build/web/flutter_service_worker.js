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
"flutter_bootstrap.js": "38e6968e216df42c20e19fd56bb11b4b",
"index.html": "7622abdf5e0adb1111a454ea1cf8bc51",
"/": "7622abdf5e0adb1111a454ea1cf8bc51",
"main.dart.js": "a3f7fdf64a05554fc825219ec327c115",
"version.json": "9b818ca9511483c901bed1545384376c",
"assets/assets/images/bgImage.png": "dffeab6196014d9c0597211c6ce143fd",
"assets/assets/images/my_profile.png": "4f7f1c775f397943e36429083ccca382",
"assets/assets/images/projects/grabgo/customer/home_screen.png": "21e64e8fdaed82c9f86e4723af802905",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772568681.png": "96e6791da82dd122b125630c01fb727f",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772568710.png": "528c4ecdb693bdf39310990579989370",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772657734.png": "8bcb876dbce58e7af5d982e3d6753f99",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772935081.png": "8a137b4374c283950ccb395a73910005",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772938430.png": "941747f954745d81ac1e8551552cddd6",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772963087.png": "b0b7e6ca4f18afd39040661331266988",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772963094.png": "4357a79829691607c57af773e6a07993",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772963145.png": "36764defb1ace481293f578643771b8b",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772963137.png": "d901e35f8b1d2028284ff66611939180",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772963148.png": "e2a6cf778957271804c54ceb156554de",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772963155.png": "eb80bd958d76dbf6ebc8f1176a142943",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772965017.png": "33b3e98dab9b2085960f160035aa0441",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772965813.png": "0116f1b16386a0d32106a99f7fa9cb38",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772965829.png": "aecd5029cb9cfa98852fe42d20ae8cb3",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772964992.png": "226c350c3132b9af179d62e510a8c9df",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772965018.png": "33b3e98dab9b2085960f160035aa0441",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772965024.png": "886e292b46ac85941f479190eca2286b",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772965039.png": "1a01260e3ad78c4480babda3390705c9",
"assets/assets/images/projects/grabgo/customer/Screenshot_1772965046.png": "76e89b39c638fd8ab44927e1be25ec5e",
"assets/assets/images/projects/grabgo/customer/Screenshot_1773016032.png": "a61b12a9f1c4c2469c0b12bc5f8bc1dd",
"assets/assets/images/projects/grabgo/customer/Screenshot_1773016039.png": "b16293cc2d8f0fe7e39b41067e664e07",
"assets/assets/images/projects/grabgo/customer/Screenshot_1773016076.png": "a380b785ca101fe5ef7c87efa4ae0c26",
"assets/assets/images/projects/grabgo/rider/Screenshot_1772506102.png": "d9dde83277504a61e9f41f84cf46f9bc",
"assets/assets/images/projects/grabgo/rider/Screenshot_1772654224.png": "400e759829ecc5258cb61786fe856d08",
"assets/assets/images/projects/grabgo/rider/Screenshot_1772963296.png": "3c741df10efc2108f1fdcd88d12103b0",
"assets/assets/images/projects/grabgo/rider/Screenshot_1772963302.png": "beefe5c43580be80b8cb43b9e38bd5be",
"assets/assets/images/projects/grabgo/rider/Screenshot_1772963308.png": "347a79ae7d0595a57b9b7435255a3eae",
"assets/assets/images/projects/grabgo/rider/Screenshot_1772963316.png": "cc2fbe24c8b109897eaf8c789805956d",
"assets/assets/images/projects/grabgo/rider/Screenshot_1773010390.png": "7fe04fbb1f9bfd8478fb8d882d427328",
"assets/assets/images/projects/grabgo/rider/Screenshot_1773010477.png": "01d49de9bb99a1dbe376433b76567d2c",
"assets/assets/images/projects/grabgo/rider/Screenshot_1773010491.png": "c9c964ae08c9b26ae1f04941b696c47f",
"assets/assets/images/projects/grabgo/rider/Screenshot_1773010498.png": "f7df3e84e6b4cb4944c344200f9991c3",
"assets/assets/images/projects/grabgo/rider/Screenshot_1773011484.png": "99eb59f26afc76e53047704bc528c4c0",
"assets/assets/images/projects/grabgo/rider/Screenshot_1773011499.png": "b05e0ea05fe00e6e55c1f41b9a93b577",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010125.png": "473624ac66d35240d93223ce3da1d83f",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010129.png": "8e6de114eef1f99309029f5b97bf9f0f",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010133.png": "47e2e6b9f65ea9f38af44eb53c0da1f0",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010137.png": "04fe4811c01b127fd4d2de2fe0dec8f7",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010165.png": "8b533aa01799811dc806ba46cca00e18",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010168.png": "0a3c51052ab58a684094777464f3f483",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010176.png": "f59529479bbe1ca2662cca6eca425b32",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010184.png": "859072c07b5422a00067b5f933853651",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010189.png": "9f83eae8f4a8adc425da2972e4565ea9",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010198.png": "24c3ff2ce3f663612a8ad02e341a62eb",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010216.png": "10c78cc1abce77b26fbf4cb4370ab4f4",
"assets/assets/images/projects/grabgo/vendor/Screenshot_1773010205.png": "d04535ea27ff50cbe0344a6bc6679ad2",
"assets/assets/images/projects/citsa/splash_screen.png": "7b6212a0c993743d713eb61848e1d131",
"assets/assets/images/projects/citsa/signin_screen.png": "bb9b0ac3317d92c9fba69319117ede8b",
"assets/assets/images/projects/citsa/verify_email.png": "f39243f8ef02cd9f07d5e661957fa997",
"assets/assets/images/projects/citsa/profile_setup_1.png": "f5059565b55fda00455fb3a6d6b3a97f",
"assets/assets/images/projects/citsa/profile_setup_2.png": "5fa4814678ea2220955aef05b61e356d",
"assets/assets/images/projects/citsa/profile_setup_3.png": "0a2ac7fb989ef20f53cf25553db42093",
"assets/assets/images/projects/citsa/Screenshot_1772346455.png": "ca966cb0437bc65d9d876827f77967b8",
"assets/assets/images/projects/citsa/Screenshot_1772346498.png": "5ae62b2fa44d5adb3a3be8c4ac72f424",
"assets/assets/images/projects/citsa/Screenshot_1772346509.png": "f414e5e954582abe5b7a624e52206ef1",
"assets/assets/images/projects/citsa/Screenshot_1772346570.png": "0788fae47f08de27b96c6ee101f3e547",
"assets/assets/images/projects/citsa/Screenshot_1772346656.png": "b2e2a2a8763675e842220d64dcf0c96a",
"assets/assets/images/projects/citsa/Screenshot_1772346672.png": "654c918a31e99d8383f977b095a9c9e7",
"assets/assets/images/projects/citsa/Screenshot_1772346854.png": "5e314237bc4947a5ab1a3a5f5ab7fd98",
"assets/assets/images/projects/citsa/Screenshot_1772346928.png": "f134a2911a65b6ecb14ad3ad557e69e0",
"assets/assets/images/projects/citsa/Screenshot_1772347334.png": "0b0b35bbc79742072d72e92cf5fd67c4",
"assets/assets/images/projects/citsa/Screenshot_1772347432.png": "c3ea864e891f0e0a6d4f460f29a13020",
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
"assets/fonts/MaterialIcons-Regular.otf": "2ad11d0f27a7588ebae7880608a52f4b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "adab9a27817d9a333c329b49e4b000a0",
"assets/AssetManifest.bin.json": "32cdc4894a75a3e745a17d48b51a6810",
"assets/FontManifest.json": "afaeae3d62fe3c7183c614f026039176",
"assets/NOTICES": "c97308afc65ea68cfa0314f9ce317a21",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "13037a8af7fad2a5096a4ebd40ea8d17",
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
