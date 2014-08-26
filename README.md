Battleships
===========

Creating battleships game - Makers Academy week 4 project



# The Game

The player and his opponent place a defined number of ships of various lengths on a board made from 10 x 10 cells. Two ships cannot be placed in neighboring cells. The aim is to sink all of the opponent's ships before yours are sunk.

Once the ships have been placed, the players take turns in selecting cells on their opponent's board to attack. If the attacked cell was empty, the cell is marked as failed hit. If the attacked cell had a ship placed on it, the hit is successful. If all the cells of a ship are hit, the ship is sunk. Once all the ships of a player are sunk, the game is over and his opponent is the winner!

# The Domain Model

## The Board
##### Responsibilities
- it creates itself, 100 cells with their location, and 5 ships
- it asks the player to place the ships
- it knows where ships can be placed
- it knows what ships are in it and their state
- it asks the player for hit locations

##### Interactions
- The Ship
- The Cell

## The Ship

##### Responsibilities
- it knows its length
- it knows which grid it belongs to
- it knows if it has been placed
- it knows when it has been hit
- it knows when it has been sunk

##### Interactions
- The Board
- The Cell

## The Cell

##### Responsibilities
- knows its coordinates
- knows if it is available for a ship to be placed on it
- knows if it is occupied by a ship
- knows if it has been hit

##### Interactions
- The Ship
- The Board
