class @HomeController extends RouteController
    waitOn: -> Meteor.subscribe "i18n", Session.get('i18n.language')
    data: ->
        total_manzanas : Session.get "total_manzanas"

Template.home_page.events
    'keyup .manzana': (e,t) ->
        Session.set 'total_manzanas', parseInt($(e.target).val())
       