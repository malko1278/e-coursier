

function submit() {
    var coloredDiv = document.getElementById('colorDiv');
    coloredDiv.setAttribute('style', 'background:red;');

    // ... Send Message to flutter app
    JavascriptChannel.postMessage('Hello World from Javascript');
}

function ok() {
    var coloredDiv = document.getElementById('colorDiv');
    coloredDiv.setAttribute('style', 'background:white;');
}