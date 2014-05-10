items = @items

class @PageController extends @LoginController
    waitOn: -> Meteor.subscribe "items_start_with_letter", @params._id
    data: -> items: items.find({name: {$regex: '^' + @params._id + '.*'}}, {sort: {name: 1}})