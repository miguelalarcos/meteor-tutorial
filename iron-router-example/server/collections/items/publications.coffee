items = @items

Meteor.publish 'items_start_with_letter', (letter) ->
    items.find({ name: {$regex: '^' + letter + '.*'} })

Meteor.publish 'all_items', ->
    items.find()    