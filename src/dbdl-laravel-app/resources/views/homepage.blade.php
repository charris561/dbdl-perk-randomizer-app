<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DBDL Perk Randomizer</title>
    @vite(['resources/css/app.css', 'resources/sass/app.scss', 'resources/js/app.js'])
</head>
<body>
    <div class="navbar-container">
        <nav class="navbar">
            <div class="navbar-left">
                <ul>
                    <li><a href="#" class="active">Home</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">About</a></li>
                </ul>
            </div>
            <div class="navbar-right">
                <ul>
                    <li><a href="#">Settings</a></li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="main-content-container">
        <div class="jumbotron">
            <div class="jumbotron-left">
                <h1 class="jumbo-title">Dead By Daylight Perk Randomizer</h1>
            </div>
            <div class="jumbotron-right">
                <a href="#" class="generate-btn">Generate</a>
            </div>
        </div>
        <div class="perks-display-container">
            <div class="user-input-grid-container">
                <p>Number of Perks To Generate: </p>
                <!-- Make the below use a PHP variable that is iterated with JS and buttons in this element later -->             
                <p class="num-perks-to-generate">0</p>
                <div class="num-perks-picker-container">
                    <button>Up</button>
                    <button>Down</button>
                </div>
            </div>
            <div class="perks-generated">
                <div class="perks-display-grid">
                    <div class="perk1">
                        <img src="{{ asset('assets\images\perk_outline.png') }}" alt="">
                        <p>Perk 1</p>
                    </div>
                    <div class="perk2">
                        <img src="{{ asset('assets\images\perk_outline.png') }}" alt="">
                        <p>Perk 2</p>
                    </div>
                    <div class="perk3">
                        <img src="{{ asset('assets\images\perk_outline.png') }}" alt="">
                        <p>Perk 3</p>
                    </div>
                    <div class="perk4">
                        <img src="{{ asset('assets\images\perk_outline.png') }}" alt="">
                        <p>Perk 4</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="perks-inventory-container">
        <div class="perk-inventory">
                <div class="perk-inventory-grid">
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>