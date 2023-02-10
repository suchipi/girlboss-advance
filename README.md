# girlboss-advance

the objective of this project is to make this possible:

- playing multiplayer gba games with friends online, with low latency. all they need is a web browser.

more concretely, the workflow I want:

- friend 1 (me) spins up server on their machine and port-forwards it
- friends 2, 3, and 4 connect to server via web browser
- everyone sees the same x session (vnc) and hears the same audio (the remote audio is streamed to them and arrives via their browser)
- people's gamepad inputs get forwarded from through the browser to the server where they control virtual gamepads
- one or more emulators can be opened in the x session, and people's virtual gamepad inputs will be mapped to the emulator inputs
- play

relevant concerns:

- latency must be acceptable. shouldn't feel sluggish
- I have relatively bad upload bandwidth (~1MiB/sec)
- GBA games have small screens; to minimize data throughput, we can make the x session have the minimum geometry possible

I will probably use no$gba as the emulator because its multiplayer support is pretty good. that means using wine, of course, but no$gba works perfectly fine in wine on my linux desktop. its "nocash" video renderer works even without OpenGL.

progress so far:

- [x] run vnc server against x session in virtual framebuffer
- [x] make it possible to load roms from a docker volume.
- [x] run http/websocket server that serves the browser vnc client.
- [x] make it so people don't have to enter an address to connect to the server (aside from the address in the browser URL bar)
- [x] prove anecdotally that with tuning of compression/quality settings, vnc is a sufficient transport mechanism for low-latency remote GBA gameplay.
  - a friend about 1000 miles away was able to play kirby some and said with the compression and quality dialed in, it was usable
- ~~[ ] get sound working, via [replit rfbproxy](https://github.com/replit/rfbproxy) and corresponding [noVNC fork](https://github.com/novnc/noVNC/pull/1525)~~
- [ ] get sound working, via approach outlined in [this comment](https://github.com/novnc/noVNC/issues/302#issuecomment-1225449899)
- [ ] little UI that shows connected players. maybe a chat window.
- [ ] forward gamepad input. easiest approach might be a separate websocket server (rather than trying to fit it into the RFB protocol).
- [ ] nice UI for assigning controllers to slots, ala steam remote play.
- [ ] put page behind HTTP basic auth
- [ ] automatically set up and open the emulator when the x session starts, instead of needing to open it manually.
  - this includes resizing the session, making things fullscreen (or at least hiding window decorations), etc.
- [ ] maybe? only send the relevant section of the screen to the relevant users. mostly as a bandwidth/throughput concern.
- [ ] extra credit: file upload/download dialog so people other than player 1 can manage saves. this would also be good for trading/battling pokemon.
