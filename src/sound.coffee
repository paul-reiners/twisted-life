sound =
  audio: {}
  list:
    "dead": "dead.wav"
    "particle": "particle.wav"
    "boom": "boom.mp3"
    "secosmic_lo": "secosmic_lo.mp3"
  init: ->
    @audio[name] =
    new Audio "resources/#{url}" for name, url of @list
  play: (name) ->
    @audio[name]?.currentTime = 0;
    @audio[name]?.play()

sound.init()

