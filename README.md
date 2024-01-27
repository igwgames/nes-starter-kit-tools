# nes-starter-kit tools

This is a small repository for the tools used by nes-starter-kit. 

They are built in nodejs, and compiled into binaries for both windows and linux
using pkg. Each tool is in a separate folder, and they are all built independently.
Each tool also has its own README file.

Check the Releases tab for the latest downloads. You can extract these into the tools
folder of your project and use them. (Though, if you use create-nes-game, this should
be automated!)

All code available under the MIT license, see LICENSE files in the subdirectories for details.

[Repository Home](https://gh.nes.science/nes-starter-kit-tools)

The projects are all written in nodejs, and compiled to cross-platform binaries using
[pkg](https://github.com/vercel/pkg).

## Prerequisites

Running these tools really just requires nodejs, most versions after 6 are likely fine, but
officially they only support node versions that are in active support by the nodejs team.

You'll need to run `npm install` in each tool's `src` folder in order for the tools to work.

## How can I use and modify these tools from my nes-starter-kit project?

`create-nes-game` will automatically install the binary version of these tools for you, so
if you don't want to change them, there is nothing to do!

If you want to modify the tools, you'll have to make a change for `nes-starter-kit` to run
the tools from your repository with node.

If you update the keys below in your `.create-nes-game.config.json` file, then run
`create-nes-game download-dependencies` the code will be installed and ready to be modified. 

```json
    "beforeStepActions": {
        "build": [
            "node tools/nes-starter-kit-tools-src/nes-starter-kit-tools-1.1.2/tmx2c/src/index.js 3 overworld levels/overworld.tmx source/c/generated/overworld"
        ]
    },
    "afterStepActions": {
        "build": [
            "node tools/nes-starter-kit-tools-src/nes-starter-kit-tools-1.1.2/chr2img/src/index.js graphics/tiles.chr graphics/palettes/main_bg.pal graphics/generated/tiles.png",
            "node tools/nes-starter-kit-tools-src/nes-starter-kit-tools-1.1.2/sprite_def2img/src/index.js ./source/c/sprites/sprite_definitions.c ./graphics/sprites.chr ./graphics/palettes/main_sprite.pal graphics/generated/sprites.png"
        ],
        "download-dependencies": [
            "cd tools/nes-starter-kit-tools-src/nes-starter-kit-tools-1.1.2/chr2img/src && npm install",
            "cd tools/nes-starter-kit-tools-src/nes-starter-kit-tools-1.1.2/tmx2c/src && npm install",
            "cd tools/nes-starter-kit-tools-src/nes-starter-kit-tools-1.1.2/sprite_def2img/src && npm install"
        ]
    },
    "extraDependencies": [{
        "name": "nes-starter-kit-tools-src",
        "default": "https://gh.nes.science/nes-starter-kit-tools/archive/refs/tags/1.1.2.zip"
    }]
}
```

The tools will be able to be added to your project via git, so any changes you make will be kept.

## How are the tools built?

This is automated through github, and posted as github releases. Check the `.github` folder to see how it works.

## What if I want to contribute my changes back to this repository?

If you want to do this, you'll need to use git to clone the repository manually, then do a pull
request through github. Pull requests are very welcome! Reach out if you need any help.
