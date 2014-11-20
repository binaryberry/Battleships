Battleships
===========

Creating battleships game - Makers Academy week 4 project

##What is it?

A Ruby-based battleships game! 

## How was it built?

Built in a team of five, with [James McNeil], [Albert Vallverdu], [Kevin Daniels], [Maya Driver] and myself! We used CRC cards to design classes and assign responsibilities.

Entirely TDDed, built with Ruby and Rspec.

![image](https://github.com/binaryberry/Battleships/blob/master/battleships_screenshot.png)


##Full description

The player and his opponent place a defined number of ships of various lengths on a grid made from 10 x 10 cells. Two ships cannot be placed in neighboring cells. The aim is to sink all of the opponent's ships before yours are sunk.

Once the ships have been placed, the players take turns in selecting cells on their opponent's grid to attack. If the attacked cell was empty, the cell is marked as failed hit. If the attacked cell had a ship placed on it, the hit is successful. If all the cells of a ship are hit, the ship is sunk. Once all the ships of a player are sunk, the game is over and his opponent is the winner!

### The Domain Model

#### The Game

##### Responsibilities

- it orders the grid to create itself
- it prompts the players to place the ships
- it begins the game
- it determines who's turn it is
- it keeps score

#### The Grid

##### Responsibilities
- it creates itself, 100 cells with their location, and 5 ships as follows: the aircraft carrier (size: 5 cells), the battleship (4 cells), the Submarine (3 cells), the Destroyer (3 cells) and the patrol boat (2 cells)
- it knows where ships can be placed
- it knows what ships are in it and their state
- it asks the player for hit locations

##### Interactions
- The Ship
- The Cell

#### The Ship

##### Responsibilities
- it knows its length
- it knows which grid it belongs to
- it knows if it has been placed
- it knows when it has been hit
- it knows when it has been sunk

##### Interactions
- The Grid
- The Cell

#### The Cell

##### Responsibilities
- knows its coordinates
- knows if it is available for a ship to be placed on it
- knows if it is occupied by a ship
- knows if it has been hit

##### Interactions
- The Ship
- The Grid

### Game dynamics

#### Game creation

##### Initialization

- The player tells the game to create itself
- The game tells the grid to create itself
- The grid builds a 10x10 array with coordinates A-J and 1-10
- The grid tells 100 cells to create themselves
- The grid assigns each cell its coordinates
- The grid tells 5 ships to create themselves (with varying lengths)
- The grid tells the game it is ready
- The game repeats the process for Player 2's grid

##### Ship placement

- The game prompts Player 1 to place ships
- The player returns a ship and location
- The grid checks with each cell where the ship will be placed if it is free
- The grid tells each cell where the ship will be placed that it is filled and with which ship
- The grid tells the ship that it has been placed
- The grid iterates over all cells to determine whether their status needs changing (i.e. if they are next to a filled cell)
- The grid tells the game that the ship has been placed
- The game iterates until all ships have been placed
- The game initiates the process for Player 2

#### Game play

- The game invites Player 1 to make a move
- Player 1 tells the game which cell it wants to attack
- The game tells the cell it has been hit
- The cell tells the ship it has been hit
- The grid asks the cell if it had a ship
- The grid asks the ship if it has been sunk
- The game asks the grid if there has been a hit, miss, or sinking
- The game updates the score
- The game checks whether the player has been defeated
- The game decides who's turn it is based on the outcome of the previous move

[James McNeil]: https://github.com/Jrmcneil
[Albert Vallverdu]: https://github.com/byverdu
[Kevin Daniels]: https://github.com/globalavocado
[Maya Driver]: https://github.com/yasuba
