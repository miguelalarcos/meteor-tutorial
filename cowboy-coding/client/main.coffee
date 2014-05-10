items = @items

# Session es un espacio de variables reactivas localmente
Session.set("letter", 'a')

# A Meteor.autorun se le pasa como argumento una función: esta función se recalculará cada
# vez que alguno de sus componentes reactivos cambie, en este caso Session.get("letter")
# Meteor.subscribe se subscribe a una fuente de datos del servidor. La combinación de ambas
# significa que vamos a recibir los items que empiecen por la letra Session.get('letter')
# incluso cuando ésta cambie
Meteor.autorun ->
    Meteor.subscribe "items_start_with_letter", Session.get("letter")


# la fuente de datos items para el template: los items que comienzan por una letra concreta y
# ordenados alfabéticamente
Template.hello.items = ->
    items.find({name: {$regex: '^' + Session.get("letter") + '.*'}}, {sort: {name: 1}})