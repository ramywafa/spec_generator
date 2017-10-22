require 'rails_helper'

RSpec.describe <%= class_name %>, type: :model do
  it "has a valid factory" do
    expect(build(:listing)).to be_valid
  end

  let(:<%= singular_name %>) { build(:<%= singular_name %>) }

  context "validations" do
    <% class_name.constantize.validators.each do |v| %> 
      <%= resolve_validator(v, singular_name) %>
    <% end %>
  end
end
