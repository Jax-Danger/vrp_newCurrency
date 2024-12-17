// This receieves data from the client, and updates it in the UI.
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