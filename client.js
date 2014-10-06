var socket = require('socket.io-client')(process.env.SERVER_PATH || 'http://localhost:3000');

socket.on('connect', function(){
  console.log('connected!');
});

socket.on('door-command', function(cmd){

  console.log('door-command '+cmd+' recieved')
  switch(cmd) {
    case 'open':
      open_door();
      break;
    case 'close':
      close_door();
      break;
    case 'toggle':
      toggle_door();
      break;
  }
});

socket.on('disconnect', function(){
  console.log('disconnected!');
});

socket.on('reconnect', function(){
  console.log('reconnected!');
});

socket.on('reconnecting', function(num) {
  console.log('attempting to reconnect');
  console.log('attempt number ' + num);
});

function open_door() {
  socket.emit('door-status', 'opening')
  setTimeout(function() {
    socket.emit('door-status', 'opened')
  }, 5000);
}


function close_door() {
  socket.emit('door-status', 'closing')
  setTimeout(function() {
    socket.emit('door-status', 'closed')
  }, 5000);
}

function toggle_door() {
  (Math.random() > .5) ? open_door() : close_door();
}