Session.set "doc2Edit", null

Template.item_form.events
    'click .editable': (e,t) ->
        Session.set 'doc2Edit', $(e.target).attr('_id')
        console.log $(e.target).attr('_id')