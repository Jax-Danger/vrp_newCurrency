// This receieves data from the client, and updates it in the UI.
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

// This ensures the NUI can send data back to the client.
document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('destination-cancel').addEventListener('click', () => {
    axios.post(`https://${GetParentResourceName()}/releaseFocus`, {})
  })

  document.getElementById('destination-submit').addEventListener('click', () => {
    axios.post(`https://${GetParentResourceName()}/teleport`, {
      x: document.getElementById('destination-x').value,
      y: document.getElementById('destination-y').value,
      z: document.getElementById('destination-z').value,
    })

  })
}, false);

