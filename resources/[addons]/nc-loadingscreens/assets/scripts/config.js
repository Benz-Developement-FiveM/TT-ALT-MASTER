Config = {}; // Don't touch

Config.ServerIP = "127.0.0.1:30120";

// Social media buttons on the left side
Config.Socials = [
    {name: "discord", label: "Discord", description: "Click here to copy the link and join our Discord server!", icon: "assets/media/icons/discord.png", link: "https://discord.gg/cKt4Mpd2PQ"},
    {name: "instagram", label: "Instagram", description: "An Instagram page will open for us soon, feel free to join and follow us!", icon: "assets/media/icons/tiktok.png", link: "#"},
    {name: "tebex", label: "Donations", description: "For donations, feel free to look at the room - #Donations at Discord.", icon: "assets/media/icons/tebex.png", link: "#"},
];

Config.HideoverlayKeybind = 112 // JS key code https://keycode.info
Config.CustomBindText = "F1"; // leave as "" if you don't want the bind text in html to be statically set

// Staff list
Config.Staff = [
    {name: "Bookathebull", description: "Owner & Dev", color: "#ff0000", image: "https://cdn.discordapp.com/attachments/1155051863905943562/1318676227908833400/ALIENTOPBACKGROUND.png?ex=67633070&is=6761def0&hm=cd344844f95975dfb4faf2388c64ff1025c56df2945afdf30d1accb94839aafe&"},
    //{name: "Owner #2", description: "Owner", color: "#ff0000", image: "https://cdn.discordapp.com/attachments/894588279591161926/997613293034287236/unnamed__1_-removebg-preview.png"},


];

// Categories
Config.Categories = [
    {label: "Social Media", default: true},
    {label: "Staff", default: false}
];

// Music
Config.Song = "song.mp3";