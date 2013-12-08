Tanoshii Mahjong
=
Here, we rebuild the mahjong game for deployment on the phones. Eventually, this will be deployed to the markets for production, but all the code will be hosted here. Please don't steal it.

The Build Setup
=
If you're reading this, then you're either Trevor trying to figure out what sort of horrible trainwreck I've managed to cook up this time, or me proof reading for correctness. In the case of the former, I will go over how the setup for this project works.

This project contains both the server and client side code for running the mahjong app. You can run the mahjong server with the following command:

```shell
$ node server/application.js
```

After you've done this, you can play the mahjong game either through you favorite browser, or through the phonegap emulator. In case of the former, open your browser to localhost:8080. In case of the latter,run the following command (after you have phonegap installed).

```shell
$ phonegap run android
```

Building the application is done using Grunt.

```shell
$ npm install && bower install
$ grunt build
```

Testing, although very important, will be implemented a bit later.

Structure Break Down
=
On the client side, the game consists of two stages

# Stage 1: Room stage
Where players organize themselves into games and where players are dumped back into after the game ends. Unless you have any better ideas, I propse the room to be built as follows:

```
user = {
  session_id: String, # unique to each session
  room_id: String, # users may broadcast messages to rooms; users may join rooms
  [otherdata]
}
room = {
  users: [user], # players in a room are told to start their games by the room
  room_id: String, # unique to rooms
  [otherdata]
}
```

# Stage 2: Game stage
Where players play the game and all their actions are broadcast their each of their clients via socket.io on our nodejs backend.

```haskell
data Gamestate
type Action = Gametate -> Gamestate
type GameArtContext = Gamestate -> IO() -- draws out the game
type UIArtContext = [Action] -> IO() -- draws out the UI
data player = { actions:: gamestate -> [Action] }
```