'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"index.html": "80b7f3c2a7bb29c643595523dbc0fc2e",
"/": "80b7f3c2a7bb29c643595523dbc0fc2e",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "dd6121d3182c033eb98e3de3d63bf02d",
"assets/assets/icons/dribbble-logo.svg": "2a9b68739f0c926afaf2ed707782356f",
"assets/assets/icons/fortune_colored.svg": "6ef55ab5021dc717bd378ad7fd1709f9",
"assets/assets/icons/luckit_logo.svg": "c78dc50ea99253f31dd84257d00acd9b",
"assets/assets/icons/luckit_logo2.svg": "2ac03fbe48439cf8122c5ba380a658c7",
"assets/assets/lotties/congratulation/congratulation.json": "8548414b64b30e977b48fae293b4f9e7",
"assets/assets/lotties/stop/sheep_stop.json": "1df98fb18737ed378711207b4911efdf",
"assets/assets/lotties/stop/horse_stop.json": "37ab37abab17f24e914a1fe615c4ca3d",
"assets/assets/lotties/stop/tiger_stop.json": "00284e76d744f16dcb6b44af9587bad8",
"assets/assets/lotties/stop/monkey_stop.json": "36bc7c8437b33be4767abde6882f907e",
"assets/assets/lotties/stop/snake_stop.json": "b8daeab86ac08d5cbcbfc612d0724410",
"assets/assets/lotties/stop/dragon_stop.json": "c43570d78270a61b24e6c655672589e6",
"assets/assets/lotties/stop/dog_stop.json": "54f3cc58757641c825a68687e4f62280",
"assets/assets/lotties/stop/rabbit_stop.json": "33bf335a7107594582067a5d3ce7203e",
"assets/assets/lotties/stop/chicken_stop.json": "7b0dcaaf106e16d3e21daa99518328b2",
"assets/assets/lotties/stop/mouse_stop.json": "2c1ed72c396098aa841828749b92ce39",
"assets/assets/lotties/stop/pig_stop.json": "f18297ec18c5d0c82723278b03641377",
"assets/assets/lotties/stop/cow_stop.json": "6156b90c1873e63b1a97f370b9c4d114",
"assets/assets/lotties/move/tiger_move.json": "967cc56080995f23aa2750bff2b20185",
"assets/assets/lotties/move/sheep_move.json": "16a22c7c0163edb024c80e8893d0e93d",
"assets/assets/lotties/move/snake_move.json": "e457194898e8586a5b1ca3dd89e8e71f",
"assets/assets/lotties/move/horse_move.json": "b77df75997431f49f924f0be2c70f394",
"assets/assets/lotties/move/cow_move.json": "3a89a52543c8a38f4b222be473dcf057",
"assets/assets/lotties/move/mouse_move.json": "799272719ca6132b6688263467418635",
"assets/assets/lotties/move/dog_move.json": "5bdb9c627c1cd6934b932fb6599ca593",
"assets/assets/lotties/move/monkey_move.json": "4fde897945ecd29eec7fe8d6d9afa82e",
"assets/assets/lotties/move/chicken_move.json": "71bffed23c61988f2c1505a2e8c2a218",
"assets/assets/lotties/move/dragon_move.json": "07c7b757e732795f0a7bb2906d4ceab1",
"assets/assets/lotties/move/rabbit_move.json": "5bc24731eefb47f7ad7abd05086e076d",
"assets/assets/lotties/move/pig_move.json": "f2421cf7266445748371fd2d5cd76fba",
"assets/assets/lotties/move/king_chicken_move.json": "c26318fee8735eaf5e332cb9ac9fe7e7",
"assets/assets/images/bezierApp.png": "4cb74af2e4099ff4f717c07e89f52268",
"assets/assets/images/gyeon.png": "ef5f1fb53350a19112878303753b4ba3",
"assets/assets/images/luckit_ppt.png": "b7e3956d2c262ffcc511e426d6b74c8f",
"assets/assets/images/floom.png": "d6d87d943fe2612b56b4a6dfa92ad6dd",
"assets/assets/images/luckit_bg.png": "a67450ed225f6e232678fe389599765e",
"assets/assets/images/sgb.png": "897bc07374f5cb4f84ef20dcbbf224f6",
"assets/assets/images/doit.png": "9408ba6afbcf8fe04f04a2d3016f7a7c",
"assets/fonts/Pretendard-Medium.ttf": "7305f90c923d4409825ec2f4380b63d6",
"assets/fonts/CarterOne-Regular.ttf": "3226bb55ad746ec8b6495ce6655cfc63",
"assets/fonts/Pretendard-Bold.ttf": "dfb614ebecd405875f50a918ca11c17c",
"assets/fonts/Pretendard-ExtraLight.ttf": "2f39a307ce00aa5e734137d4cee3b5c1",
"assets/fonts/Pretendard-SemiBold.ttf": "459eff7ba5380583ccd6eda49c846c85",
"assets/fonts/MaterialIcons-Regular.otf": "66608e1aecec7c0d2454a4514c0f9e1a",
"assets/fonts/Pretendard-Thin.ttf": "8b65a9299b173e635e6acac200e80257",
"assets/fonts/Pretendard-Black.ttf": "51c73880d5964b36e6373b3fe31f3058",
"assets/fonts/Pretendard-ExtraBold.ttf": "332e9b673b0c1709e93fee01e4543f1d",
"assets/fonts/Pretendard-Regular.ttf": "d6e0de06bff8b7fda2db4682168e3ddf",
"assets/fonts/Pretendard-Light.ttf": "77ecd2ca94928e38ff7c68bb255324f7",
"assets/fonts/Tenada.ttf": "0ba8366fb06b6b4c2fe9d6b83ac85bcf",
"assets/NOTICES": "ccae70a43c477dfe7b1f8e3a2dedebdf",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/FontManifest.json": "ce68a3eeb25fe3c9ef1ff315a3e2c765",
"assets/AssetManifest.bin": "f3d6fb2be6bedb0be05a03fdb008b87e",
"assets/AssetManifest.json": "e68f602e6c35e5df5e9f1195ffbc9ae7",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "e6a68ab0a8789566f5c33591733844ef",
"version.json": "0325640b78b9f97959290dc5ebb8b3ed",
"main.dart.js": "d498514ed50996f3462a7e0584f7552e"};
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
