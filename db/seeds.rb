# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
NodeClass.destroy_all
NodeClassProperty.destroy_all
NodeImpl.destroy_all
NodeImplProperty.destroy_all

article_class = NodeClass.create(name: 'article')

class_property_title = NodeClassProperty.create(
  name: :title,
  node_class: article_class,
  properties: {
    type: :string,
    ediable: true,
    validators: {
      empty: false,
      required: true,
      length: [2, 10],
      regexp: '^a-zA-Z$'
    }
  }
)

class_property_body = NodeClassProperty.create(
  name: :body,
  node_class: article_class,
  properties: {
    type: :text,
    ediable: true
  }
)

class_property_published = NodeClassProperty.create(
  name: :published,
  node_class: article_class,
  properties: {
    type: :boolean,
    ediable: true
  }
)

article = NodeImpl.create(node_class: article_class)

NodeImplProperty.create(
  node_impl: article,
  node_class_property: class_property_title,
  string_value: 'Lorem ipsum dolor sit amet'
)

NodeImplProperty.create(
  node_impl: article,
  node_class_property: class_property_body,
  text_value: 'Nullam ac feugiat leo, id fermentum ante. Nunc pretium massa at neque commodo, at ultrices lectus congue. Praesent dignissim augue mi, id tincidunt lorem suscipit sed. Nunc nisi dui, condimentum ac facilisis in, eleifend in ex. Nullam nec eros libero. Phasellus sed enim sagittis, sodales dui sed, eleifend tortor. Mauris congue urna risus, quis porta est maximus ut. Nunc vel nisl felis. Pellentesque consectetur consectetur ante vitae fermentum. Quisque tincidunt interdum dignissim. Nulla vel lacus non massa mattis vestibulum eu at massa. Mauris sagittis magna et iaculis commodo. Nulla facilisi. Nam nec consequat metus. Fusce blandit auctor elit, nec faucibus nunc euismod egestas. Donec ultrices arcu orci, ut dapibus felis scelerisque ut.'
)

NodeImplProperty.create(
  node_impl: article,
  node_class_property: class_property_published,
  boolean_value: true
)