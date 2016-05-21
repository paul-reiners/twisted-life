frameRate(1);
var unit = 10;
var radius = (((height - unit) / unit) - 1) / 2;
var diameter = 2 * radius + 1;
debug(diameter);
var n_rows = diameter;
var n_cols = diameter;
var universe = [];
for (var y = 0; y <= n_rows; y++) {
    universe[y] = [];
    for (var x = 0; x <= n_cols; x++) {
        if (random(0, 2) < 1) {
            universe[y][x] = 1;
        } else {
            universe[y][x] = 0;
        }
    }
}

var isAlive = function (x, y) {
    var liveNeighbors = 0;
    for (var dy = -1; dy <= 1; dy++) {
      for (var dx = -1; dx <= 1; dx++) {
        var neighborY = (y + dy + n_rows) % n_rows;
        var neighborX = (x + dx + n_cols) % n_cols;
        if ((dy !== 0 || dx !== 0) && universe[neighborY][neighborX] === 1) {
          liveNeighbors++;
        }
      }
    }
    if (universe[y][x] === 1) {
        // Any live cell with fewer than two live neighbours dies, as if caused by 
        // under-population.
        if (liveNeighbors < 2) {
            return 0;
        // Any live cell with two or three live neighbours lives on to the next generation.
        } else if (liveNeighbors === 2 || liveNeighbors === 3) {
            return 1;
        // Any live cell with more than three live neighbours dies, as if by overcrowding.
        } else {
            return 0;
        }
    } else {
        // Any dead cell with exactly three live neighbours becomes a live cell, as if by 
        // reproduction.
        if (liveNeighbors === 3) {
            return 1;
        } else {
            return 0;
        }
    }
};

var getNextGen = function() {
    var new_universe = [];
    for (var y = 0; y < n_rows; y++) {
        new_universe[y] = [];
      for (var x = 0; x < n_cols; x++) {
        new_universe[y][x] = isAlive(x, y);
      }
    }
    for (var y = 0; y < n_rows; y++) {
      for (var x = 0; x < n_cols; x++) {
        universe[y][x] = new_universe[y][x];
      }
    }
};

var twist = function(radius, sideLen) {
  var twisted = [];
  for (var i = -radius; i <= radius; i++) {
    var ii = i + radius;
    twisted[ii] = [];
    for (var j = -radius; j <= radius; j++) {
        var absI = abs(i);
        var absJ = abs(j);
        var dist = max(absI, absJ);
        var iOffSet = 0;
        var jOffSet = 0;
        if (i === 0 && j === 0) {
          iOffSet = 0;
          jOffSet = 0;
        } else if (dist === absI && i < 0 && !(i === -radius && j === -radius)) {
            iOffSet =  0;
            jOffSet = -1;
        } else if (dist === absJ && j > 0) {
            iOffSet = -1;
            jOffSet =  0;
        } else if (dist === absI && i > 0) {
            iOffSet = 0;
            jOffSet = 1;
        } else {
          iOffSet = 1;
          jOffSet = 0;
        }
        var x = ((i + radius + iOffSet) + sideLen) % sideLen;
        var y = ((j + radius + jOffSet) + sideLen) % sideLen;
        var jj = j + radius;
        twisted[ii][jj] = universe[x][y];
    }
  }
  
  return twisted;
};

draw = function() {
    background(255, 255, 255);
    
    noStroke();
    fill(0, 0, 0);
    for (var y = 0; y < n_rows; y++) {
        for (var x = 0; x < n_cols; x++) {
            if (universe[y][x] === 1) {
                rect(x * unit + unit / 2, y * unit + unit / 2, unit, unit);
            }
        }
    }
    getNextGen();
    var twistedNextGen = twist(20, 40);
    for (var y = 0; y < n_rows; y++) {
      for (var x = 0; x < n_cols; x++) {
        universe[y][x] = twistedNextGen[y][x];
      }
    }
};
