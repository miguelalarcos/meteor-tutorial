items = @items

Session.set "doc2Edit", null

Template.item_form.events
    'click .editable': (e,t) ->
        Session.set 'doc2Edit', $(e.target).attr('_id')
        console.log $(e.target).attr('_id')

class @ItemFormController extends @LoginController
    waitOn: -> Meteor.subscribe 'all_items'
    data: -> 
        doc2Edit = Session.get("doc2Edit")
        typeForm: if doc2Edit == null then 'insert' else 'update'
        myDoc: if doc2Edit == null then null else items.findOne {_id: doc2Edit}
        items: items.find()
