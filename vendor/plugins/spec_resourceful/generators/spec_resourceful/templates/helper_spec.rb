require File.dirname(__FILE__) + '<%= '/..' * controller_class_nesting_depth %>/../spec_helper'

describe <%= controller_class_name %>Helper do
  include SpecResourceful::SpecHelpers::Helpers
  
  # Add specs here or remove this file altogether
end