window.addEventListener('message', function(event) {
    const data = event.data;

    if(data.type === 'update-scoreboard'){
        $('.scoreboard-list').html('') // reset
        $('.scoreboard-list').append(data.nui)
    }
});