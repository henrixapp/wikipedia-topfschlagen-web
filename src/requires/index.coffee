require ["../ajax"],(ajax)->
  setting = sigma.settings
  setting.defaultNodeColor= '#ec5148'
  s = new sigma(
    renderer:
      container: document.getElementById('container')
      type: 'canvas'
      ,
    settings: setting)
  #sigma.parsers.json('data/data.json',s,()=>
  #  s.refresh()
  #  s.startForceAtlas2({worker: true, barnesHutOptimize: false})
  #  CustomShapes.init(s)
  #  s.refresh()
  #  )
  # Initialize the dragNodes plugin:
  dragListener = sigma.plugins.dragNodes(s, s.renderers[0])
  #TODO unter button legen
  ajax("api/distance","POST",(von:prompt("Von?"),zu:prompt("Zu?"))).done((data)->
    s.graph.clear()
    s.graph.read(data)
    s.startForceAtlas2({worker: true, barnesHutOptimize: false})
    s.refresh()
    )
###
  N=500
  s = new sigma('container')
  s.graph.addNode({
    id: 'n0',
    x:Math.random()*N | 0
    y:Math.random()*N | 0
    label: 'Hello',
    size: 1,
    color: '#f00'
  }).addNode({
    x:Math.random()*N | 0
    y:Math.random()*N | 0
    id: 'n1',
    label: 'World !',
    size: 1,
    color: '#00f'
  }).addEdge(
    id: 'e0'
    source: 'n0'
    target: 'n1'
    type:'curve'
    head : 'arrow'
  )
###
