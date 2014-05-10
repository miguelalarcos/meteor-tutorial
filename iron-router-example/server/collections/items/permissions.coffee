items = @items

items.allow
    insert: (userId, doc) ->
        true   
    update: (userId, doc, fieldNames, modifier) ->
        true
    remove: (userId, doc) ->
        if userId == doc.userId then true else false