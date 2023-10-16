# Dead by Daylight Perk Randomizer Application
<br>
This application will allow a user to generate a random loadout for dead by daylight. 

## Local Dev Setup
To spin up a local dev environment for this application do the following: 

<ul>
    <li>Create the docker image: $docker build -t ethan-dbdl-webserver .</li>
    <li>Set the environment variable file paths in docker-compose.yml to the correct paths for your system</li>
    <li>Set the path to the SSL keys in the Volume directory in the docker-compose.yml file</li>
    <li>Spin up the server: $docker compose up</li>
</ul>
