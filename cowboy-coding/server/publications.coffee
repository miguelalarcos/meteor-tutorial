# es una buena práctica asignar la variable global a una local con el mismo nombre
items = @items

# operaciones permitidas sobre la colección items
items.allow
    insert: (userId, doc) ->
        true   # permitimos todos los insert
    update: (userId, doc, fieldNames, modifier) ->
        if userId == doc.userId
            true
        else
            false
    remove: (userId, doc) ->
        if userId == doc.userId then true else false # sólo permitimos si es el mismo usuario
                                                     # que el guardado en el documento (hooks, más adelante)

# declaramos una publicación de nombre 'items_start_with_letter' que devuelve (reactivo) todos los items
# que comienzan por una letra concreta
Meteor.publish 'items_start_with_letter', (letter) ->
    items.find({ name: {$regex: '^' + letter + '.*'} })