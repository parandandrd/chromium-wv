# chromium-wv

Chromium-WV is a containerised version of Chromium for Raspberry Pi OS with Widevine support. This is useful for viewing DRM-encrypted Web video content on 64-bit Raspberry Pi 4 distributions. Right now the container and accompanying script have been tested under Ubuntu MATE 20.10. Prerequisites are simply Docker installed via the instructions on their website.

Running chromium-wv.sh will download the latest version of the container, create a local Docker volume to store persistent information, and launch the Chromium browser.

Upon first install, hardware acceleration is not enabled for Chromium. You can enable hardware acceleration for video by going to chrome://flags, and enabling Hardware Accelerated Video Decoding, as well as Zero-Copy Rasterization. You can verify hardware acceleration is enabled by going to chrome://gpu.

Right now this browser has been tested on Amazon Prime Video, Netflix, and Hulu. More testing will follow. Thereotically it should work with any site that works on Raspberry Pi OS.

The chromium-wv container is a vanilla install of Raspberry Pi OS with the Widevine DRM package installed, slimmed via Docker-Slim. No further modifications have been made to the included image. 

Instructions on how to build your own container will be forthcoming.

+Background

By default, Chromium does not support Widevine DRM, which is used by Netflix, Hulu, Amazon Video, etc. to encrypt their content. It is possible to extract the WidevineCdm libraries from a ChromeOS image, and install them so that Chromium recognizes them and becomes capable of viewing DRM-protected content.

HOWEVER...

The libraries only exist in 32-bit form, which means this particular hack won't work on 64-bit systems. Hence, a docker container that will run an instanced 32-bit Chromium with the necessary libraries configured.

+Usage

Running the install.sh script will install Docker for ARM64 Ubuntu, configure it to run under the current user, and pull the latest version of the chromium-wv container.

Running the chromium-wv.sh script will run the container with appropriate flags and environment variables configured.

+ To-Do

• Add automatic Chromium hardware acceleration configuration
• Suppress noisy messages in terminal
