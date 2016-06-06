# Ruby Music Library ![Build Status](https://travis-ci.org/temifowotade/music-library.svg?branch=master)

## Overview

This is a command line music application that accepts a file path containing mp3 files, parses through them and imports the files to the Music Library.

## Features

User is able to do the following in the application:
* list the songs in the music library.
* play a song.
* list an artist's songs.
* list the songs under a genre.
* list all artists whose songs are in the music library.
* list the genres that the songs in the music library belong to.


## Getting Started

1. Clone the repo to your local machine.

  ```bash
  $  git clone https://github.com/andela-tfowotade/music-library.git
  ```

2. `cd` into the `music-library` folder.

  ```bash
  $  cd music-library
  ```
3. Install dependencies

  ```bash
    $  bundle install
  ```

## Usage

To start the application, `cd` into the `music-library` folder and run `bin/musiclibrary`.

```bash
$  bin/music_library

  Welcome to Themmy Music Library
  ----------------------------------------------------------------------------
  list songs: To list all songs in the music library
  play song: To play a song
  list artist: To list an artist songs
  list genre: To list the songs under a specific genre
  list artists: To list all artists whose songs are saved in the music library
  list genres: To list all the genres that the songs belong to
  help: to view command instructions
  else, enter 'exit'
  
Please enter command:
```

## Example of command usage:

1. `list songs`:
    
    ```bash
    Please enter command: list songs
    1. Action Bronson - Larry Csonka - indie
    2. Adele - Rolling In the Deep - folk
    3. Adele - Someone Like You - country
    4. AraabMuzik - Streetz Tonight - folk
    5. ASAP Rocky - Peso - dance
    6. Atlas Sound - Mona Lisa - pop
    7. Azealia Banks - 212 - hip-hop
    ...
  ```
2. `play song`: enter "1" when prompted for song number to play the first song:
    
```bash
Please enter command: play song
Please enter song number: 1
Playing Action Bronson - Larry Csonka - indie
```
3.  Enter `help` at anytime to view command instructions.

## Tests

Having installed all dependencies using `bundle install`, run

```bash
$  bundle exec rspec
```


