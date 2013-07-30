fs     = require 'fs'
{exec} = require 'child_process'

appFiles  = [
  # omit src/ and .coffee to make the below lines a little shorter
  '_utils'
  'gfx'
  'keys'
  'sound'
  'dialogs/_Dialog'
  'dialogs/LevelDialog'
  'dialogs/DeadDialog'
  'screens/_Screen'
  'screens/GameScreen'
  'screens/TitleScreen'
  'life/Life'
  'life/TwistedLife'
  'player/Player'
  'goal/Goal'
  'levels/Level'
  'game'
]

build = () ->
  appContents = new Array remaining = appFiles.length
  for file, index in appFiles then do (file, index) ->
    fs.readFile "src/#{file}.litcoffee", 'utf8', (err, fileContents) ->
      throw err if err
      appContents[index] = fileContents
      process() if --remaining is 0
  process = ->
    fs.writeFile 'script/main.coffee', appContents.join('\n\n'), 'utf8', (err) ->
      throw err if err
      exec 'coffee --compile -l script/main.coffee', (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr
        fs.unlink 'script/main.coffee', (err) ->
          throw err if err
          console.log 'Done.'

task 'build', 'Build single application file from source files', ->
  build()

genHTML = (src, dest) ->
  markdown = exec 'perl ./vendor/Markdown.pl --html4tags ' + src + ' > ' + dest
  markdown.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  markdown.stdout.on 'data', (data) ->
    print data.toString()
  markdown.on 'exit', (code) ->
    callback?() if code is 0

task 'gen-html', 'Generate HTML from source files', ->
  genHTML('./src/KindOfFunnyLooking.md', './doc/KindOfFunnyLooking.html')
  for file in appFiles
    genHTML("src/#{file}.litcoffee", "doc/#{file}.html")
