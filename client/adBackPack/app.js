function call() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) {
      (async () => {
        const urlParams = new URLSearchParams(window.location.search);
        const device_id = urlParams.get('device_id');
        console.log(device_id);
        const rawResponse = await fetch('http://192.168.0.105:3000/tracks', {
          method: 'POST',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            track:
                {
                  device_id: `${device_id}`,
                  latitude: `${position.coords.latitude}`,
                  longitude: `${position.coords.longitude}`
                }
          })
        });
        const content = await rawResponse.json();
        console.log(content);
        document.querySelector('html').style.backgroundImage = 'url(' + content.ads + ')';
        document.getElementById('distance').innerHTML = `Distance: ${content.distance}miles`;
        document.getElementById('text').innerHTML = `Payment: ${content.profit}`;
      })();

      document.getElementById('1').innerHTML = position.coords.latitude + ', ' + position.coords.longitude;
    }, function () {
    });
  } else {
    document.getElementById('1').innerHTML = 'browser does not support geolocation api';
  }
}

call();
setInterval(call, 5000);


