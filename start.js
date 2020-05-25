const concurrently = require('concurrently');

// By default, configure Bridgetown to use port 4001 so Browsersync can use 4000
// See also Browsersync settings in sync.js
const port = 4001

/////////////////
// Concurrently
/////////////////
function sleep5000() {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve();
    }, 5000);
  });
}

function runConcurrently() {
  concurrently([
    { command: "yarn webpack-dev", name: "Webpack", prefixColor: "yellow"},
    { command: "sleep 4; yarn serve --port " + port, name: "Bridgetown", prefixColor: "green"},
    { command: "sleep 8; yarn sync", name: "Live", prefixColor: "blue"}
  ], {
    restartTries: 3,
    killOthers: ['failure', 'success'],
  }).then(() => {
    console.log("Done.");
    return new Promise(function(resolve, reject) {
      setTimeout(function() {
        resolve();
      }, 1000);
    })
  }, () => {}).then(() => {
    console.log("Really done!");
  });
}

runConcurrently()
