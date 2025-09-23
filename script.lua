
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game GUI</title>
    <style>
        body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #87ceeb; /* Màu xanh nhạt */
        }

        .container {
            position: relative;
            width: 300px;
            height: 600px;
        }

        .character {
            width: 50px;
            height: 100px;
            background-color: #ffcc00; /* Màu vàng cho nhân vật */
            position: absolute;
            bottom: 100px; 
            left: 50%;
            transform: translateX(-50%);
        }

        .controls {
            position: absolute;
            bottom: 50px;
            left: 50%;
            transform: translateX(-50%);
            display: grid;
            grid-template-columns: repeat(3, 50px);
            gap: 10px;
        }

        .control {
            width: 50px;
            height: 50px;
            background-color: #ffffff;
            text-align: center;
            line-height: 50px;
            border: 2px solid #000;
            font-size: 24px;
            cursor: pointer;
        }

        .control:hover {
            background-color: #f0f0f0;
        }

        .gui {
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 24px;
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="character"></div>
        <div class="controls">
            <div class="control" id="w">W</div>
            <div class="control" id="a">A</div>
            <div class="control" id="s">S</div>
            <div class="control" id="d">D</div>
        </div>
        <div class="gui">gui</div>
    </div>
    <script>
        document.getElementById("w").onclick = function() {
            alert("Move Up");
        }
        document.getElementById("a").onclick = function() {
            alert("Move Left");
        }
        document.getElementById("s").onclick = function() {
            alert("Move Down");
        }
        document.getElementById("d").onclick = function() {
            alert("Move Right");
        }
    </script>
</body>
</html>
