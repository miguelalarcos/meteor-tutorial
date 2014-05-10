items = @items

class @ItemFormController extends @LoginController
    waitOn: -> Meteor.subscribe 'all_items'
    data: -> 
        doc2Edit = Session.get("doc2Edit")
        typeForm: if doc2Edit == null then 'insert' else 'update'
        myDoc: if doc2Edit == null then null else items.findOne {_id: doc2Edit}
        items: items.find()