@items = new Meteor.Collection 'Items',
    schema:
        name:
            type:String
        description:
            type: String
            optional: true

