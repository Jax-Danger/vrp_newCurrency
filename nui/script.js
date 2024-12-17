// This receieves data from the client, and updates it in the UI.

// This event listener gets the location and heading of the player, and updates the UI.
window.addEventListener('message', (event) => {
  const data = event.data;

  if (data.type === 'position') {
    document.getElementById('heading-output').textContent = Math.round(data.heading);
    document.getElementById('pos-x-output').textContent = Math.round(data.x);
    document.getElementById('pos-y-output').textContent = Math.round(data.y);
    document.getElementById('pos-z-output').textContent = Math.round(data.z);
  }

  if (data.type === 'ping') {
    axios.post(`https://${GetParentResourceName()}/pong`, {
      foo: 'bar',

    }).then((response) => {
      console.log(JSON.stringify(response.data));
    });
  }
})
function addPeriods(str) {
  let reversedStr = str.split('').reverse().join('');
  let result = "";
  for (let i = 0; i < reversedStr.length; i++) {
    result += reversedStr[i];
    if ((i + 1) % 3 === 0 && i !== reversedStr.length - 1) {
      result += ".";
    }
  }
  return result.split('').reverse().join('');
}

// This event listener gets the player's wallet balance, and updates the UI.
window.addEventListener('message', (event) => {
  const data = event.data;

  if (data.type === 'updateWallet') {
    if (data.useCommas) {
      document.getElementById('player-wallet').textContent = data.wallet.toLocaleString();
    } else {
      document.getElementById('player-wallet').textContent = addPeriods(data.wallet.toString());
    }
    document.getElementById('currency-sign').textContent = data.currencySymbol;
  }
})

// This ensures the NUI can send data back to the client.

// document.addEventListener('DOMContentLoaded', () => {
// This is example code for sending data to the client. Copy and paste to make more.

//document.getElementById('destination-cancel').addEventListener('click', () => {
// Remember to create the NUI callback in client.lua that matches the part after "}/" in the URL.
// Example: The NUI callback for the below code should be named "test".

//axios.post(`https://${GetParentResourceName()}/test`, {})
//})

// }, false);