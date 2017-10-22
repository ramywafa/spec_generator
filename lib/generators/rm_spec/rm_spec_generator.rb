class RmSpecGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers

  source_root File.expand_path('../templates', __FILE__)

  def create_validates_model_spec
    template "model_spec.rb", File.join("spec/models", "#{singular_name}_spec.rb")
  end

  private

  def resolve_validator(validator, instance)
    "it { expect(#{instance}).to #{map_validators_to_shoulda_matchers[validator.class.name]}(:#{validator.attributes.first}) }"
  end

  def map_validators_to_shoulda_matchers
    { 
      "ActiveModel::Validations::NumericalityValidator" => "validate_numericality_of",
      "ActiveRecord::Validations::PresenceValidator" => "validate_presence_of",
      "ActiveModel::Validations::LengthValidator" => "validate_length_of",
    }

  end
end
