class Person
  include ActiveModel::AttributeMethods
  extend ActiveModel::Callbacks
  extend ActiveModel::Naming

  attribute_method_prefix 'reset_'
  attribute_method_suffix '_highest?'
  define_attribute_methods 'age'
  define_model_callbacks :update

  before_update :reset_me
  attr_accessor :age

  Person.model_name.name                # => "Person"
  Person.model_name.singular            # => "person"
  Person.model_name.plural              # => "people"
  Person.model_name.element             # => "person"
  Person.model_name.human               # => "Person"
  Person.model_name.collection          # => "people"
  Person.model_name.param_key           # => "person"
  Person.model_name.i18n_key            # => :person
  Person.model_name.route_key           # => "people"
  Person.model_name.singular_route_key  # => "person"

  def update
    run_callbacks(:update) do
      # This method is called when update is called on an object.
    end
  end

  def reset_me
    # This method is called when update is called on an object as a before_update callback is defined.
  end

  private
    def reset_attribute(attribute)
      send("#{attribute}=", 0)
    end

    def attribute_highest?(attribute)
      send(attribute) > 100
    end
end
