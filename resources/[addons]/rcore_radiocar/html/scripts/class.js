function getNameFromURL(URL, cb){
    const ytId = getYoutubeUrlId(URL);
    if(ytId === "")
	{
        let audioPlayer = new Audio(URL);
        audioPlayer.loop = false;
        audioPlayer.autoplay = false;
        audioPlayer.volume = 0.0;

        const cleanup = () => {
            if(audioPlayer){
                audioPlayer.pause();
                audioPlayer.src = "";
                audioPlayer.load();
                audioPlayer.onloadedmetadata = null;
                audioPlayer.onerror = null;
                audioPlayer = null;
            }
        }

        audioPlayer.onloadedmetadata = function() {
            cb(editString(URL), audioPlayer.duration);
            cleanup();
        };

        audioPlayer.onerror = function(event) {
            cb(null, null);
            cleanup();
        };
    }
    else
    {
        ValidYoutubeVideo(ytId, function(result) {
            if (result) {
                var test = new YT.Player("trash", {
                    height: '0',
                    width: '0',
                    videoId: ytId,
                    events: {
                        'onReady': function(event) {
                            cb(event.target.getVideoData().title, test.getDuration());
                            test.stopVideo();
                            test.destroy();
                        },
                    }
                });
            } else {
                cb(null, null);
            }
        });
    }
}

function ValidYoutubeVideo(id, cb) {
    fetch("https://img.youtube.com/vi/" + id + "/mqdefault.jpg", { method: 'HEAD' }).then(res => {
        if(res.status == 404){
            cb(false)
            }else{
            cb(true)
        }
    }).catch(err => cb(false));
}


function updateName(url){
    const ytId = getYoutubeUrlId(url);
    if(ytId === "")
	{
        currentSongName = editString(url);
        $(".nameSong").text(currentSongName);
    }
    else
    {
        fetch("https://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=" + ytId + "&format=json", { method: 'GET' }).then(res => res.json()) .then(data => {
            if (data && data.title) {
                currentSongName = data.title;
                $(".nameSong").text(currentSongName);
            }
        }).catch(error => {
            currentSongName = localesex.nameSong;
            $(".nameSong").text(currentSongName);
        });
    }
}

function getYoutubeUrlId(url) {
    let videoId = "";

    if (url.indexOf("youtube.com") !== -1) {
        const urlParts = url.split("v=");
        if (urlParts.length > 1) {
            videoId = urlParts[1].substring(0, 11);
        }
    }
    else if (url.indexOf("youtu.be") !== -1) {
        const urlParts = url.replace("//", "").split("/");
        if (urlParts.length > 1) {
            videoId = urlParts[1].substring(0, 11);
        }
    }

    return videoId;
}
function editString(string){
    return  string.split("/").pop().replace(/\.(mp3|wav|wma|wmv|aac|ac3|aif|ogg)/, " ").replace(/%20|[-_]/g, " ");
}