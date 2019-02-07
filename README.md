# docker-transmission
Transmission torrent client dockerized

Example Build and Run

```bash
docker build -t <userid>/transmission:<label>
docker run --name transmission -p 8080:8080 -p 64388:64388 -v "$(pwd)/Torrents:/Torrents" -itd <userid>/transmission:<label>
```
