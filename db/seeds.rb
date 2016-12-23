@node_class_article = Noodle::NodeClass.create(:service => 'service1.example.com', :name => 'article')
@node_class_property_title = Noodle::NodeClassProperty.create(
  :node_class => @node_class_article,
  :name => 'title',
  :properties => {:type => 'string'}
)
@node_class_property_body = Noodle::NodeClassProperty.create(
  :node_class => @node_class_article,
  :name => 'body',
  :properties => {:type => 'text'}
)
